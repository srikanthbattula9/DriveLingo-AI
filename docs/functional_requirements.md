# DriveLingo AI
## Functional Requirements (Version 1)

---

# Objective

DriveLingo AI is designed to help international drivers understand road signs by translating and explaining them in their preferred language.

---

# Functional Requirements

### FR-001
The system shall allow the user to upload an image of a traffic sign.

---

### FR-002
The system shall validate that the uploaded file is an image.

---

### FR-003
The system shall extract text from the image using an OCR engine.

---

### FR-004
The system shall automatically detect the language of the extracted text.

---

### FR-005
The system shall translate the extracted text into the user's preferred language.

---

### FR-006
The system shall generate a simple AI explanation of the road sign.

---

### FR-007
The system shall display:

- Original Image
- Original Text
- Detected Language
- Translated Text
- AI Explanation

---

### FR-008
The system shall store every processed traffic sign in the database.

---

### FR-009
The system shall allow users to view their translation history.

---

### FR-010
The system shall return an error if OCR fails.

---

### FR-011
The system shall detect duplicate traffic signs during processing and avoid storing the same sign multiple times.

---

### FR-012
If a duplicate sign is detected, the system shall reuse the existing OCR, translation, and AI explanation instead of processing the sign again.