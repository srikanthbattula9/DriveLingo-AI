# DriveLingo AI Database Design

## Design Decision

DriveLingo will store each unique traffic sign once and connect user activity to that sign through a separate history table.

This reduces duplicate data, lowers storage and processing costs, and creates a single source of truth.

## Core Tables

### Users

Stores user account and preference information.

Suggested fields:

- user_id
- name
- email
- preferred_language
- created_at

### TrafficSigns

Stores one record for each unique traffic sign.

Suggested fields:

- sign_id
- original_image_url
- ocr_text
- normalized_text
- detected_language
- sign_category
- country
- confidence_score
- created_at
- updated_at

### SignTranslations

Stores translations and explanations for each sign.

Suggested fields:

- translation_id
- sign_id
- target_language
- translated_text
- ai_explanation
- translation_confidence
- created_at
- updated_at

### UserHistory

Stores which user processed which sign and when.

Suggested fields:

- history_id
- user_id
- sign_id
- translation_id
- processed_at

## Relationships

- One user can have many history records.
- One traffic sign can have many translations.
- One traffic sign can appear in many user history records.
- One translation belongs to one traffic sign.

## Initial SQL Schema Draft

### users

- user_id — primary key
- name
- email — unique
- preferred_language
- created_at

### traffic_signs

- sign_id — primary key
- original_image_url
- ocr_text
- normalized_text
- detected_language
- sign_category
- country
- confidence_score
- created_at
- updated_at

### sign_translations

- translation_id — primary key
- sign_id — foreign key
- target_language
- translated_text
- ai_explanation
- translation_confidence
- created_at
- updated_at

### user_history

- history_id — primary key
- user_id — foreign key
- sign_id — foreign key
- translation_id — foreign key
- processed_at