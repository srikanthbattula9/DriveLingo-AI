CREATE TABLE users (
    user_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    preferred_language VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE traffic_signs (
    sign_id BIGSERIAL PRIMARY KEY,
    original_image_url TEXT NOT NULL,
    ocr_text TEXT,
    normalized_text TEXT NOT NULL,
    detected_language VARCHAR(50),
    sign_category VARCHAR(100),
    country VARCHAR(100),
    confidence_score DECIMAL(5,4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE sign_translations (
    translation_id BIGSERIAL PRIMARY KEY,
    sign_id BIGINT NOT NULL,
    target_language VARCHAR(50) NOT NULL,
    translated_text TEXT NOT NULL,
    ai_explanation TEXT,
    translation_confidence DECIMAL(5,4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_translation_sign
        FOREIGN KEY (sign_id)
        REFERENCES traffic_signs(sign_id),

    CONSTRAINT unique_sign_language
        UNIQUE (sign_id, target_language)
);
CREATE TABLE user_history (
    history_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    sign_id BIGINT NOT NULL,
    translation_id BIGINT NOT NULL,
    processed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_history_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_history_sign
        FOREIGN KEY (sign_id)
        REFERENCES traffic_signs(sign_id),

    CONSTRAINT fk_history_translation
        FOREIGN KEY (translation_id)
        REFERENCES sign_translations(translation_id)
);