-- 02_clean_app_events.sql
-- Week 3: build wallet.app_events_clean from wallet.app_events_raw.
-- Raw table stays untouched.
-- Problems found in raw data: 1,218 blank session_ids and 307 exact duplicate rows.
-- Decision: remove exact duplicates; keep rows with a blank session_id and flag them.

-- Check the problems in the raw table
SELECT COUNT(*) AS blank_session_ids
FROM wallet.app_events_raw
WHERE session_id IS NULL OR session_id = '';          -- expected 1218

SELECT
  (SELECT COUNT(*) FROM wallet.app_events_raw)
  -
  (SELECT COUNT(*) FROM (SELECT DISTINCT * FROM wallet.app_events_raw) AS d)
  AS duplicate_rows;                                  -- expected 307

-- Build the clean table
CREATE TABLE wallet.app_events_clean AS
SELECT
    user_id,
    event_time,
    event_name,
    NULLIF(TRIM(session_id), '') AS session_id,
    CASE WHEN session_id IS NULL OR TRIM(session_id) = ''
         THEN 1 ELSE 0 END AS has_missing_session
FROM (SELECT DISTINCT * FROM wallet.app_events_raw) AS d;

-- Check the clean table
SELECT COUNT(*) AS total_rows, SUM(has_missing_session) AS missing_sessions
FROM wallet.app_events_clean;                         -- expected 249954 and 1218
