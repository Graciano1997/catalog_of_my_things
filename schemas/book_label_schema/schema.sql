CREATE TABLE IF NOT EXISTS label (
id SERIAL PRIMARY KEY,
title VARCHAR(150),
color VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS book(
id SERIAL PRIMARY KEY,
genre_id INT NULL,
label_id INT NOT NULL,
source_id INT NULL,
publisher VARCHAR(100),
cover_state VARCHAR(50),
publish_date DATE,
archived BOOLEAN,
CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id)
);
