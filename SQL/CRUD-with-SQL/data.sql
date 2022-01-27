-- C
INSERT INTO cities ('name','zip') VALUES ('Paris','75000');
INSERT INTO cities ('name','zip') VALUES ('Marseille','13000');
INSERT INTO cities ('name','zip') VALUES ('Lyon','69000');
INSERT INTO cities ('name','zip') VALUES ('Saint-Etienne','42000');
INSERT INTO cities ('name','zip') VALUES ('Bordeaux','33000');

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Maxime', 'Arquillière', 22, 1);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Valentin', 'Beaussart', 25, 2);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Marie', 'delori', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Toufik', 'El Bouamri', 25, 4);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Paul', 'Schauss', 25, 5);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Florent', 'Romano', 25, 1);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Charles', 'Moreau', 25, 2);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Deborah', 'Martin', 25, 2);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Charlotte', 'Marion', 25, 4);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Pierre', 'Lemasson', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Joséphine', 'Lazzaris', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Amine', 'Lafi', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Christophe', 'Faure', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Mohammed', 'Fassi Fihri', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Toufik', 'El Bouamri', 25, 3);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Marie', 'delori', 25, 1);

INSERT INTO inhabitants ('first_name', 'last_name', 'age', 'city_id')
  VALUES ('Valentin', 'Beaussart', 25, 3);

-- U
-- UPDATE inhabitants SET age = 40, first_name = 'John', last_name = 'SMITH' WHERE id = 18;
 
--- ❌ do not forget the WHERE !!!!!!

-- D
-- DELETE FROM inhabitants WHERE id = 18;

-- What is the next id ? 

-- Why should I not set myself an id ?

-- ❌ delete all ?
