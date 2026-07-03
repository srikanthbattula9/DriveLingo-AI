# DriveLingo AI User Flow

## Version 1

1. The user uploads an image of a traffic sign.
2. The system validates the image.
3. OCR extracts the text from the image.
4. The system detects the language.
5. The extracted text is normalized.
6. The system checks whether the sign already exists in the database.
7. If the sign exists, the stored translation and explanation are returned.
8. If the sign does not exist, the system translates the text.
9. The system generates a simple explanation of the sign.
10. The result is stored in the database.
11. The final result is shown to the user.

## Low-Confidence Fallback

If the system cannot confidently identify, translate, or explain the traffic sign, it should not guess.

The system should either:

- Query a trusted government or traffic-sign data source
- Return a low-confidence warning
- Ask the user to upload a clearer image