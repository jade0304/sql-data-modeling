DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE Patients
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
Address1 TEXT NOT NULL,
Address2 TEXT NOT NULL,
State TEXT NOT NULL,
Phone INTEGER,
diagnosis_id INTEGER REFERENCES Diagnosis ON DELETE SET NULL,
doctors_id INTEGER REFERENCES Doctors ON DELETE SET NULL
);

CREATE TABLE Doctors
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
patients_id INTEGER REFERENCES Patients ON DELETE SET NULL,
employees_id INTEGER REFERENCES Employees ON DELETE SET NULL
);

CREATE TABLE Employees
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL
);

CREATE TABLE Diagnosis
(
id SERIAL PRIMARY KEY
name TEXT NOT NULL,
doctor_id INTEGER REFERENCES Doctors ON DELETE SET NULL
);

INSERT INTO patients
(first_name, last_name, address1, state, phone, diagnosis_id, doctor_id)
VALUES
('Jane', 'Foster', '12 1 ST', 'iowa', '123 4576333', '1', '1'),
('Tom', 'Ford', '112 4 ST', 'Minneapolis', '123 7986333', '2', '2');

INSERT INTO Doctors
(first_name, last_name, patients_id)
VALUES
('Eric', 'Schnider', 1),
('Ben', 'Red', 2);

INSERT INTO Employees 
(first_name, last_name)
VALUES
('Trisha', 'Roth')
('Jessy', 'Simpson');

INSERT INTO Diagnosis
(name, doctor_id)
VALUES
('Diabetes'),
('Hyperlipidemia'),
('Hypothyroidism');