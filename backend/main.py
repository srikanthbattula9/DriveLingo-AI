from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.exc import IntegrityError
from sqlalchemy.orm import Session

from backend.database import SessionLocal
from backend.models import TrafficSign
from backend.schemas import TrafficSignCreate, TrafficSignResponse


app = FastAPI(title="DriveLingo AI API")


def get_database():
    database = SessionLocal()

    try:
        yield database
    finally:
        database.close()


@app.get("/")
def read_root():
    return {"message": "DriveLingo AI backend is running"}
    


@app.get("/traffic-signs")
def get_traffic_signs(database: Session = Depends(get_database)):
    return database.query(TrafficSign).all()


@app.get("/traffic-signs/{sign_id}")
def get_traffic_sign(sign_id: int, database: Session = Depends(get_database)):
    sign = (
        database.query(TrafficSign)
        .filter(TrafficSign.sign_id == sign_id)
        .first()
    )

    if sign is None:
        raise HTTPException(status_code=404, detail="Traffic sign not found")

    return sign
    

@app.post("/traffic-signs", response_model=TrafficSignResponse, status_code=201)
def create_traffic_sign(
    sign_data: TrafficSignCreate,
    database: Session = Depends(get_database),
):
    existing_sign = (
        database.query(TrafficSign)
        .filter(
            TrafficSign.normalized_text == sign_data.normalized_text,
            TrafficSign.country == sign_data.country,
        )
        .first()
    )

    if existing_sign is not None:
        raise HTTPException(
            status_code=409,
            detail="Traffic sign already exists",
        )

    new_sign = TrafficSign(**sign_data.model_dump())

    database.add(new_sign)

    try:
        database.commit()
        database.refresh(new_sign)
    except IntegrityError:
        database.rollback()
        raise HTTPException(
            status_code=409,
            detail="Traffic sign already exists",
        )

    return new_sign
    