DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions_likes;
DROP TABLE IF EXISTS replies;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname,lname)
VALUES
    ('Aqua','Man'),
    ('Bat', 'Woman'),
    ('Incredible', 'Hulk');

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Narnia','can you enter through the wardrobe?', 1),
    ('Asgard','Does Thor live here?', 2),
    ('Hogwarts', 'are you Hufflepuff?', 3);
    

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);
INSERT INTO 
    question_follows(users_id, questions_id)
VALUES
    (1, 1), (2, 2), (3, 3);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    replier_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (replier_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);
INSERT INTO 
    replies(question_id, parent_id, replier_id, body)
VALUES
    (1, NULL, 2, 'no, you may not'),
    (1, 1, 3, 'actually you can'),
    (2, NULL, 1, 'yes thor lives here'),
    (3, NULL, 2, 'im Slitherin');

CREATE TABLE questions_likes (
    id INTEGER PRIMARY KEY,
    users_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id)
);
INSERT INTO 
    questions_likes(users_id, questions_id)
VALUES
    (1, 2),
    (2, 3),
    (3, 1);

