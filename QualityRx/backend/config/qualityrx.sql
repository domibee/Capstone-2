-- Create a database
CREATE  DATABASE qualityrx;

\c qualityrx;


CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "email" varchar
);

CREATE TABLE "pharmacies" (
  "id" integer PRIMARY KEY,
  "pharmacy_name" varchar,
  "location" varchar
);

CREATE TABLE "medications" (
  "id" integer PRIMARY KEY,
  "brand_name" varchar,
  "generic_name" varchar,
  "dosage" float,
  "unit" string,
  "adverse_events" varchar
);

CREATE TABLE "prices" (
  "id" integer PRIMARY KEY,
  "medication_id" integer FOREIGN KEY,
  "pharmacy_id" integer FOREIGN KEY,
  "price" float
);

CREATE TABLE "user_pharmacy" (
  "id" integer PRIMARY KEY,
  "user_id" integer FOREIGN KEY,
  "pharmacy_id" FOREIGN KEY integer
);
