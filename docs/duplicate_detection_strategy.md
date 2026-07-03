# Duplicate Detection Strategy

## Goal

The system should avoid processing and storing the same traffic sign multiple times.

## Why This Matters

Duplicate detection helps reduce:

- OCR processing cost
- Translation API cost
- LLM API cost
- Database duplication
- Response time for users

## Version 1 Strategy

In Version 1, duplicates will be detected using normalized OCR text.

Example:

Original OCR Text:

STOP

Normalized Text:

stop

If the normalized text already exists in the database, the system will reuse the existing translation and AI explanation.

## Normalization Rules

Before checking duplicates, the system should:

- Convert text to lowercase
- Remove extra spaces
- Remove unnecessary symbols
- Standardize common words

## Future Strategy

In later versions, duplicate detection can be improved using:

- Image hashing
- Computer vision similarity
- Embeddings
- Country and sign category matching