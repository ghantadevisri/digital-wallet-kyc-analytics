-- 01_create_tables.sql
-- Week 3: create the empty tables for the Digital Wallet KYC project.
-- Run this inside the database digital_wallet_kyc (PostgreSQL).

CREATE SCHEMA IF NOT EXISTS wallet;

CREATE TABLE wallet.users (
    user_id             VARCHAR(10) PRIMARY KEY,
    signup_date         DATE,
    city                TEXT,
    device_type         TEXT,
    acquisition_channel TEXT,
    age_band            TEXT
);

CREATE TABLE wallet.kyc_events (
    user_id          VARCHAR(10),
    kyc_started_at   TIMESTAMP,
    kyc_completed_at TIMESTAMP,
    kyc_status       TEXT,
    rejection_reason TEXT,
    has_date_issue   SMALLINT
);

CREATE TABLE wallet.transactions (
    transaction_id   VARCHAR(12) PRIMARY KEY,
    user_id          VARCHAR(10),
    transaction_date TIMESTAMP,
    amount           NUMERIC(12,2),
    status           TEXT,
    payment_type     TEXT,
    has_amount_issue SMALLINT
);

-- Raw app events: kept exactly as generated. Cleaning happens in a later script.
CREATE TABLE wallet.app_events_raw (
    user_id    VARCHAR(10),
    event_time TIMESTAMP,
    event_name TEXT,
    session_id VARCHAR(12)
);

CREATE TABLE wallet.date_dimension (
    date            DATE PRIMARY KEY,
    year            INT,
    quarter         INT,
    month           INT,
    month_name      TEXT,
    week            INT,
    week_start_date DATE,
    day_of_week     TEXT,
    is_weekend      SMALLINT
);
