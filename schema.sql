CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT CHECK(age >= 12) --Le Jeu est pegi 12 malheuresement 
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE characters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
    user_id INT REFERENCES users(id) ON DELETE CASCADE, -- CASCADE permet de supprimer les lignes enfants lorsque une ligne parent est supprimé
    game_id INT REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE character_items (
    character_id INT REFERENCES characters(id) ON DELETE CASCADE,
    item_id INT REFERENCES items(id) ON DELETE CASCADE,
    quantity INT DEFAULT 1 CHECK (quantity > 0),
    PRIMARY KEY (character_id, item_id)
);

CREATE TABLE quests (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    game_id INT REFERENCES games(id) ON DELETE CASCADE
);

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    score INT NOT NULL DEFAULT 0,
    duration_seconds INT NOT NULL,
    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    character_id INT REFERENCES characters(id) ON DELETE CASCADE,
    game_id INT REFERENCES games(id) ON DELETE CASCADE
);