DROP TABLE IF EXISTS properties;

CREATE TABLE properties(
  id SERIAL PRIMARY KEY,
  numbers_of_bedrooms INT,
  year_built INT,
  buy_let VARCHAR(255),
  build VARCHAR(255)
);
