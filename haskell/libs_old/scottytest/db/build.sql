DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS session_ids;

CREATE TABLE users (
    id          INTEGER PRIMARY KEY,
    username    TEXT,
    userpass    TEXT,
    avatar      TEXT,
    create_date TEXT
    );

CREATE TABLE messages (
    id          INTEGER PRIMARY KEY,
    owner_id    INTEGER,
    body        TEXT,
    send_date   TEXT
    );

CREATE TABLE session_ids (
    id          INTEGER PRIMARY KEY,
    owner_id    INTEGER,
    create_date TEXT
    session_key TEXT
    );