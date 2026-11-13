-- 03_keys_and_indexes.sql
-- Week 3: link the tables with foreign keys and add indexes for faster queries.
-- Orphan check before this script: 0 orphan rows in kyc_events, transactions, app_events_clean.

-- Foreign keys: every user_id must exist in wallet.users
ALTER TABLE wallet.kyc_events
  ADD CONSTRAINT fk_kyc_user FOREIGN KEY (user_id) REFERENCES wallet.users (user_id);
ALTER TABLE wallet.transactions
  ADD CONSTRAINT fk_txn_user FOREIGN KEY (user_id) REFERENCES wallet.users (user_id);
ALTER TABLE wallet.app_events_clean
  ADD CONSTRAINT fk_events_user FOREIGN KEY (user_id) REFERENCES wallet.users (user_id);

-- Indexes: speed up lookups by user, date and event name
CREATE INDEX idx_kyc_user ON wallet.kyc_events (user_id);
CREATE INDEX idx_txn_user ON wallet.transactions (user_id);
CREATE INDEX idx_txn_date ON wallet.transactions (transaction_date);
CREATE INDEX idx_events_user ON wallet.app_events_clean (user_id);
CREATE INDEX idx_events_name ON wallet.app_events_clean (event_name);
