CREATE SEQUENCE logger_id_seq AS INTEGER;
CREATE TABLE loggers (
    id INTEGER NOT NULL DEFAULT nextval('logger_id_seq') PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    is_displayed BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE SEQUENCE log_id_seq AS INTEGER;
CREATE TABLE logs (
    id INTEGER NOT NULL DEFAULT nextval('log_id_seq') PRIMARY KEY,
    logger_id INTEGER NOT NULL,
    temperature_c FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    FOREIGN KEY (logger_id) REFERENCES loggers(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX logs_timestamp_idx ON logs(timestamp);