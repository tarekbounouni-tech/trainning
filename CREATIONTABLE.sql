DROP TABLE IF EXISTS RESERVER;
DROP TABLE IF EXISTS VOYAGE;
DROP TABLE IF EXISTS AGENCE;
DROP TABLE IF EXISTS HOTEL;
DROP TABLE IF EXISTS TRANSPORT;
DROP TABLE IF EXISTS CLIENT;
DROP TABLE IF EXISTS LABEL_ECOLOGIQUE;

/* 1. CREATION DES TABLES Indépendante */
CREATE TABLE IF NOT EXISTS AGENCE(
    ID_Agence INTEGER NOT NULL, 
    Nom_Agence VARCHAR(50), 
    Ville VARCHAR(50), 
    PRIMARY KEY(ID_Agence)
);

CREATE TABLE IF NOT EXISTS HOTEL(
    ID_Hotel INTEGER NOT NULL,
    Nom_Hotel VARCHAR(50),
    Ville VARCHAR(50),
    Categorie INTEGER,
    Prix_Nuit INTEGER,
    PRIMARY KEY (ID_Hotel)
);

CREATE TABLE IF NOT EXISTS TRANSPORT(
    ID_Transport INTEGER NOT NULL,
    Type_Transport VARCHAR(20) CHECK (Type_Transport IN ('Avion', 'Bateau', 'Voiture', 'Train')),
    Compagnie_Aerienne VARCHAR(20) CHECK(Compagnie_Aerienne IN (
        'Air France', 'Ryanair', 'easyJet', 'Lufthansa', 'Emirates', 
        'SNCF', 'Eurostar', 'Trenitalia',
        'Corsica Ferries', 'Brittany Ferries',
        'Hertz', 'Avis', 'Sixt', 'Europcar')),
    Emission_CO2 DECIMAL(5,2),
    PRIMARY KEY (ID_Transport)
);

CREATE TABLE IF NOT EXISTS CLIENT(
    ID_Client INTEGER NOT NULL,
    NOM VARCHAR(50),
    Prenom VARCHAR(50),
    Email VARCHAR(80),
    Telephone VARCHAR(11) CHECK (LENGTH(Telephone) = 11),
    PRIMARY KEY (ID_Client)
);

CREATE TABLE IF NOT EXISTS LABEL_ECOLOGIQUE(
    ID_Label INTEGER NOT NULL,
    Nom_Label VARCHAR(50),
    Niveau_Impact INTEGER,
    PRIMARY KEY (ID_Label)
); 

/* 2. CREATION DES TABLES Dépendante */
CREATE TABLE IF NOT EXISTS VOYAGE(
    ID_Voyage INTEGER NOT NULL,
    Destination VARCHAR(50),
    Ville_Depart VARCHAR(50),
    Date_Depart VARCHAR(10),
    Date_Retour VARCHAR(10),
    Prix INTEGER,
    Distance_KM INTEGER,
    Nb_Nuits INTEGER,
    ID_Hotel INTEGER,
    ID_Label INTEGER,
    ID_TRANSPORT INTEGER,
    ID_Agence INTEGER,
    PRIMARY KEY (ID_Voyage),
    FOREIGN KEY(ID_Hotel) REFERENCES HOTEL(ID_Hotel),
    FOREIGN KEY (ID_Label) REFERENCES LABEL_ECOLOGIQUE(ID_Label),
    FOREIGN KEY (ID_Transport) REFERENCES TRANSPORT(ID_Transport),
    FOREIGN KEY (ID_Agence) REFERENCES AGENCE(ID_Agence)
);

CREATE TABLE IF NOT EXISTS RESERVER(
    ID_Client INTEGER,
    ID_Voyage INTEGER,
    Date_Reservation VARCHAR(10),
    PRIMARY KEY (ID_Client, ID_Voyage),
    FOREIGN KEY (ID_Client) REFERENCES CLIENT(ID_Client),
    FOREIGN KEY (ID_Voyage) REFERENCES VOYAGE(ID_Voyage)
);