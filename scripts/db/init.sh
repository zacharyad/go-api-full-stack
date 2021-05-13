#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
\c postgres
CREATE TABLE IF NOT EXISTS cars (
    id            SERIAL       NOT NULL,
    make          VARCHAR(100) NOT NULL,
    model         VARCHAR(100) NOT NULL,
    year          INT          NOT NULL
);


EOSQL
