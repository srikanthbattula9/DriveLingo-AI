from decimal import Decimal

from pydantic import BaseModel, ConfigDict


class TrafficSignCreate(BaseModel):
    original_image_url: str
    ocr_text: str | None = None
    normalized_text: str
    detected_language: str | None = None
    sign_category: str | None = None
    country: str | None = None
    confidence_score: Decimal | None = None


class TrafficSignResponse(TrafficSignCreate):
    model_config = ConfigDict(from_attributes=True)

    sign_id: int