-- CREATE TABLE IF NOT EXISTS Item (
--   id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
-- );

CREATE TABLE IF NOT EXISTS label (
id SERIAL PRIMARY KEY,
title varchar(150),
color varchar(50)
);

CREATE TABLE IF NOT EXISTS book(
id SERIAL PRIMARY KEY,
genre_id INT NULL,
label_id INT NOT NULL,
source_id INT NULL,
publisher varchar(100),
cover_state varchar(55),
publish_date date,
archived boolean,
CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE IF NOT EXISTS musicAlbum (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT NOT NULL,
  label_id INT NULL,
  source_id INT NULL,
  on_spotify BOOLEAN,
  publish_date DATE,
  FOREIGN KEY(genre_id) REFERENCES Genre(id)
);

CREATE TABLE IF NOT EXISTS Genre (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(150),
  -- item_id INTEGER,
  -- FOREIGN KEY(item_id) REFERENCES Item(id)
);

-- CREATE INDEX index_music_album_item_id ON musicAlbum(item_id);
-- CREATE INDEX index_genre_item_id ON Genre(item_id);
CREATE INDEX index_music_album_item_id ON musicAlbum(id);
CREATE INDEX index_genre_item_id ON Genre(id);


