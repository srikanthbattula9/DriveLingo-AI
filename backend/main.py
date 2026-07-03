from fastapi import FastAPI

app = FastAPI(title="DriveLingo AI API")


@app.get("/")
def read_root():
    return {"message": "DriveLingo AI backend is running"}
    