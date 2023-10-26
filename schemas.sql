
CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(250),
    last_name VARCHAR(250)
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    item_type VARCHAR(250),
    multiplayer BOOLEAN,
    last_played_at DATE,

    published_date DATE,
    archived BOOLEAN

    genre_id INT REFERENCES genre(id),
    author_id INT REFERENCES author(id),
    label_id INT REFERENCES label(id),
    
);

-- =====================
CREATE TABLE label (
    id SERIAL,
    title VARCHAR(250),
    color VARCHAR(50),
    PRIMARY KEY (id, title)
)

CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    item_type VARCHAR(250),
    title VARCHAR(250),
    cover_state BOOLEAN,

    published_date DATE,
    archived BOOLEAN,
    
    genre_id INT REFERENCES genre(id),
    author_id INT REFERENCES author(id),
    label_id INT REFERENCES label(id)
)


-- ===========================
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
)

CREATE TABLE music_album (
    id SERIAL PRIMARY KEY,
    item_type VARCHAR(250),
    on_spotify BOOLEAN,
    
    published_date DATE,
    archived BOOLEAN,

    genre_id INT REFERENCES genre(id),
    author_id INT REFERENCES author(id),
    label_id INT REFERENCES label(id)
)
