CREATE TABLE IF NOT EXISTS ${TABLE_NAME} (
    pk INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    id VARCHAR(256) UNIQUE,
    title VARCHAR(256),
    description VARCHAR(2000),
    published_timestamp TIMESTAMP,
    last_update_timestamp TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_${TABLE_NAME}_published_dates_range
  ON ${TABLE_NAME}
  USING btree (CAST(DATE_PART('year', DATE(published_timestamp)) AS INT));
