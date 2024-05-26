DROP TABLE IF EXISTS checkedout;
DROP TABLE IF EXISTS tools;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id       INTEGER PRIMARY KEY,
    username TEXT
    );

CREATE TABLE tools (
    id            INTEGER PRIMARY KEY,
    name          TEXT,
    description   TEXT,
    lastReturned  TEXT,
    timesBorrowed INTEGER
    );

CREATE TABLE checkedout (
    user_id INTEGER,
    tool_id INTEGER
    );

INSERT INTO users (username)
VALUES ('Andrew');

INSERT INTO tools (name, description, lastReturned, timesBorrowed) VALUES
    ('Hammer', 'Punch eth', '2024-04-28', 0),
    ('Saw',    'Sawing eth', '2024-04-28', 0);