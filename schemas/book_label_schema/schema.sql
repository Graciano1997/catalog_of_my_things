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
cover_state varchar(50),
publish_date date,
archived boolean,
CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id)
);
