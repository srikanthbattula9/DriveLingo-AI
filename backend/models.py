from sqlalchemy import BigInteger, Column, DateTime, Numeric, String, Text
from sqlalchemy.sql import func
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class TrafficSign(Base):
    __tablename__ = "traffic_signs"

    sign_id = Column(BigInteger, primary_key=True)
    original_image_url = Column(Text, nullable=False)
    ocr_text = Column(Text)
    normalized_text = Column(Text, nullable=False)
    detected_language = Column(String(50))
    sign_category = Column(String(100))
    country = Column(String(100))
    confidence_score = Column(Numeric(5, 4))
    created_at = Column(DateTime, server_default=func.now())
    updated_at = Column(DateTime, server_default=func.now())