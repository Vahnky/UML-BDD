CREATE DATABASE Cine_DB;

USE Cine_DB;

CREATE TABLE Cinema (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
);

CREATE TABLE Salle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT(50),
    nombreplace,
    cinema_id INT,

    FOREIGN KEY (cinema_id) REFERENCES Cinema(id)
);

CREATE TABLE Seance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    film VARCHAR(100),
    heure DATETIME,
    salle_id INT,

    FOREIGN KEY (salle_id) REFERENCES Salle(id)
);

CREATE TABLE Client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
);

CREATE TABLE Reservation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prix DECIMAL(4,2),
    payment ENUM('online', 'surplace'),
    client_id INT,
    seance_id INT,

    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (seance_id) REFERENCES Seance(id)
);

CREATE TABLE Admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    cinema_id INT,

    FOREIGN KEY (cinema_id) REFERENCES Cinema(id)
);


INSERT INTO Cinema (name)
VALUES ('Cinema Lodent'), ('Cinema Laria');

INSERT INTO Salle (cinema_id, numero, nombreplace)
VALUES (1, 1, 100), (1, 2, 80), (2, 1, 120);

INSERT INTO Seance (salle_id, film, heure)
VALUES (1, 'Yannick', '2024-01-22 20:00:00'), (2, 'Réalité', '2024-01-22 20:30:00');

INSERT INTO Client (name, email)
VALUES ('John Doe', 'john.doe@gmail.com'), ('John Dupond', 'john.Dupond@gmail.com');

INSERT INTO Reservation (client_id, seance_id, prix, payment)
VALUES (1, 1, 9.20, 'surplace'), (2, 2, 7.60, 'online');

INSERT INTO Admin (name, cinema_id)
VALUES ('Admin Lodent', 1), ('Admin Laria', 2);