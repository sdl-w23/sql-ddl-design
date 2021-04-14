-- from the terminal run:
-- psql < med_center.sql

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    doc_name TEXT NOT NULL 
);

INSERT INTO doctors
(doc_name)
VALUES
('Pete Stevenson'), ('Charles Watkins'), ('Larry Douglas');


CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    pt_name TEXT NOT NULL
);

INSERT INTO patients
(pt_name)
VALUES
('William Squilliam'), ('Mary Peters'), ('Fred Daniels');

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(id),
    patient_id INTEGER REFERENCES patients(id),
    visit_date TEXT NOT NULL
);

INSERT INTO visits
(doctor_id, patient_id, visit_date)
VALUES
(1, 1, '4-1-2021'), (1, 2, '4-1-2021'), (2, 3, '4-5-2021');

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

INSERT INTO diseases
(disease_name)
VALUES
('Tuberculosis'), ('Multiple Myeloma'), ('Polio');


CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits(id),
    disease_id INTEGER REFERENCES diseases(id),
    notes TEXT
);

INSERT INTO diagnoses
(visit_id, disease_id, notes)
VALUES
(1, 3, 'Patient has polio'), (2, 2, 'Patient has multiple myeloma'), (3, 1, 'Patient has tuberculosis');



