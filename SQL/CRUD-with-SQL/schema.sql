CREATE TABLE `cities`(
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT,
  `zip` TEXT
);

CREATE TABLE `inhabitants` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `first_name` TEXT,
  `last_name` TEXT,
  `age` INTEGER,
  `city_id` INTEGER,
  FOREIGN KEY(city_id) REFERENCES cities(id)
);
