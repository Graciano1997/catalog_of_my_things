CREATE TABLE IF NOT EXISTS label (
id SERIAL PRIMARY KEY,
title VARCHAR(150),
color VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS book(
id SERIAL PRIMARY KEY,
genre_id INT NULL,
label_id INT NOT NULL,
author_id INT NULL,
source_id INT NULL,
publisher VARCHAR(100),
cover_state VARCHAR(55),
publish_date DATE,
archived BOOLEAN,
CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE IF NOT EXISTS author (
id SERIAL PRIMARY KEY,
first_name VARCHAR(150),
last_name VARCHAR(150),
);

CREATE TABLE IF NOT EXISTS game(
id SERIAL PRIMARY KEY,
genre_id INT NULL,
label_id INT NULL,
source_id INT NULL,
author_id INT NOT NULL,
publish_date DATE,
archived BOOLEAN,
multiplayer BOOLEAN,
last_played_at date,
CONSTRAINT fk_label FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS Genre (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150),
);


CREATE TABLE IF NOT EXISTS musicAlbum (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT NOT NULL,
  label_id INT NULL,
  source_id INT NULL,
  author_id INT NULL,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  FOREIGN KEY(genre_id) REFERENCES Genre(id)
);


CREATE INDEX index_music_album_item_id ON musicAlbum(id);
CREATE INDEX index_genre_item_id ON Genre(id);


