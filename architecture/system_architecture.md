# DriveLingo AI System Architecture

## Version 1

The first version of DriveLingo AI will use a simple request-response architecture.

## High-Level Flow

1. The user uploads a traffic sign image.
2. The frontend sends the image to the backend API.
3. The backend validates the file.
4. The image is stored in object storage.
5. OCR extracts text from the image.
6. The system detects the source language.
7. The extracted text is normalized.
8. The database is checked for an existing matching sign.
9. If a match exists, the stored result is returned.
10. If no match exists, the text is translated.
11. AI generates a simple explanation.
12. The processed result is stored in the database.
13. The backend returns the final response to the user.

## Main Components

- Frontend
- Backend API
- Image Storage
- OCR Service
- Language Detection Service
- Translation Service
- AI Explanation Service
- Database
- Logging and Monitoring

## Architecture Diagram

```text
User
  |
  v
Frontend
  |
  v
Backend API
  |
  +--------------------+
  |                    |
  v                    v
Image Storage       Database Check
                       |
                       v
                  Existing Result?
                  /             \
                Yes              No
                |                |
                v                v
          Return Result      OCR Processing
                                  |
                                  v
                          Language Detection
                                  |
                                  v
                             Translation
                                  |
                                  v
                          AI Explanation
                                  |
                                  v
                           Save to Database
                                  |
                                  v
                           Return to User