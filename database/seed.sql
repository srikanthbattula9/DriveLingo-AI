INSERT INTO users (
    name,
    email,
    preferred_language
)
VALUES
    ('Aarav Kumar', 'aarav@example.com', 'English'),
    ('Sofia Martinez', 'sofia@example.com', 'Spanish'),
    ('Kenji Sato', 'kenji@example.com', 'Japanese');

INSERT INTO traffic_signs (
    original_image_url,
    ocr_text,
    normalized_text,
    detected_language,
    sign_category,
    country,
    confidence_score
)
VALUES
    (
        'images/stop_sign_japan.jpg',
        '止まれ',
        '止まれ',
        'Japanese',
        'Stop',
        'Japan',
        0.9800
    ),
    (
        'images/construction_germany.jpg',
        'Baustelle',
        'baustelle',
        'German',
        'Construction',
        'Germany',
        0.9400
    );

INSERT INTO sign_translations (
    sign_id,
    target_language,
    translated_text,
    ai_explanation,
    translation_confidence
)
VALUES
    (
        1,
        'English',
        'Stop',
        'The driver must come to a complete stop before proceeding.',
        0.9900
    ),
    (
        2,
        'English',
        'Construction Zone',
        'The road ahead may contain construction work, lane changes, or reduced speeds.',
        0.9600
    );

INSERT INTO user_history (
    user_id,
    sign_id,
    translation_id
)
VALUES
    (1, 1, 1),
    (2, 1, 1),
    (3, 2, 2);