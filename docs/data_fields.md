# Data Fields

## Goal

This document defines what information DriveLingo AI should store when a traffic sign is processed.

## Main Traffic Sign Data

Each unique traffic sign should store:

- sign_id
- original_image_url
- ocr_text
- normalized_text
- detected_language
- translated_text
- target_language
- ai_explanation
- sign_category
- country
- confidence_score
- created_at
- updated_at
- usage_count

## Why These Fields Matter

### sign_id
Unique ID for every traffic sign.

### original_image_url
Stores the location of the uploaded image.

### ocr_text
Raw text extracted from the image.

### normalized_text
Cleaned version of OCR text used for duplicate detection.

### detected_language
The language found in the original sign.

### translated_text
The translated version of the sign.

### target_language
The language selected by the user.

### ai_explanation
Simple explanation of what the sign means.

### sign_category
Example: speed limit, warning, parking, construction, stop, toll.

### country
Helps understand country-specific traffic signs.

### confidence_score
Confidence from OCR or AI model.

### usage_count
Tracks how many times this sign result was reused.