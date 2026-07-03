from fastapi import Depends, FastAPI,HTTPException
from sqlalchemy.orm import Session

from backend.database import SessionLocal
from backend.models import TrafficSign

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