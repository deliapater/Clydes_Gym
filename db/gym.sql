DROP TABLE bookings;
DROP TABLE members;
DROP TABLE gym_classes;

CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  age INT4
);

CREATE TABLE gym_classes
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  capacity INT4
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT4 REFERENCES members(id) ON DELETE CASCADE,
  gym_class_id INT4 REFERENCES gym_classes(id) ON DELETE CASCADE
);
