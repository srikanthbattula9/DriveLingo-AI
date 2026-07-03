-- Query 1:
-- Find the most frequently processed traffic signs

SELECT
    ts.sign_id,
    ts.normalized_text,
    ts.sign_category,
    ts.country,
    COUNT(uh.history_id) AS usage_count
FROM traffic_signs ts
LEFT JOIN user_history uh
    ON ts.sign_id = uh.sign_id
GROUP BY
    ts.sign_id,
    ts.normalized_text,
    ts.sign_category,
    ts.country
ORDER BY
    usage_count DESC;

    -- Query 2:
-- Find the most requested target languages

SELECT
    st.target_language,
    COUNT(uh.history_id) AS request_count
FROM sign_translations st
LEFT JOIN user_history uh
    ON st.translation_id = uh.translation_id
GROUP BY
    st.target_language
ORDER BY
    request_count DESC;

    -- Query 3:
-- Find traffic signs with low confidence scores

SELECT
    sign_id,
    ocr_text,
    detected_language,
    sign_category,
    country,
    confidence_score
FROM traffic_signs
WHERE confidence_score < 0.9500
ORDER BY confidence_score ASC;

-- Query 4:
-- Find the top traffic-sign category in each country

WITH category_counts AS (
    SELECT
        ts.country,
        ts.sign_category,
        COUNT(uh.history_id) AS usage_count
    FROM traffic_signs ts
    LEFT JOIN user_history uh
        ON ts.sign_id = uh.sign_id
    GROUP BY
        ts.country,
        ts.sign_category
),
ranked_categories AS (
    SELECT
        country,
        sign_category,
        usage_count,
        DENSE_RANK() OVER (
            PARTITION BY country
            ORDER BY usage_count DESC
        ) AS category_rank
    FROM category_counts
)
SELECT
    country,
    sign_category,
    usage_count
FROM ranked_categories
WHERE category_rank = 1
ORDER BY country;

-- Query 5:
-- Calculate the average OCR confidence by detected language

SELECT
    detected_language,
    COUNT(*) AS total_signs,
    ROUND(AVG(confidence_score), 4) AS average_confidence
FROM traffic_signs
GROUP BY
    detected_language
ORDER BY
    average_confidence ASC;

-- Query 6:
-- Retrieve each traffic sign with its translated text and AI explanation

SELECT
    ts.sign_id,
    ts.ocr_text,
    ts.detected_language,
    st.target_language,
    st.translated_text,
    st.ai_explanation
FROM traffic_signs ts
JOIN sign_translations st
    ON ts.sign_id = st.sign_id;