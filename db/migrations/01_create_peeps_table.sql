CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(180) NOT NULL);
ALTER TABLE peeps ADD COLUMN created_at timestamp DEFAULT NOW();
