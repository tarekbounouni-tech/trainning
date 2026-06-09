
/* Requete 1 */
SELECT * FROM AGENCE
JOIN VOYAGE ON AGENCE.ID_Agence = VOYAGE.ID_Agence;
 
/* Requete 2 */
SELECT 
    Compagnie_Aerienne, 
    Emission_CO2 
FROM TRANSPORT 
WHERE Type_Transport = 'Avion';

/* Requete 3 */
SELECT 
    Nom_Hotel, 
    Ville, 
    Prix_Nuit 
FROM HOTEL 
WHERE Categorie = 5;

/* Requete 4 */
SELECT 
    AGENCE.ID_Agence, 
    AGENCE.Nom_Agence, 
    VOYAGE.ID_Voyage,
    VOYAGE.Ville_Depart,
    VOYAGE.Destination,
    VOYAGE.Prix
FROM AGENCE
JOIN VOYAGE ON AGENCE.ID_AGENCE = VOYAGE.ID_AGENCE 
WHERE AGENCE.Nom_Agence = 'Havas Voyages';

/* Requete 5 */
SELECT 
    AGENCE.Nom_Agence,
    VOYAGE.Ville_Depart,
    VOYAGE.Destination, 
    TRANSPORT.Type_Transport,
    TRANSPORT.Emission_CO2 AS Emission_par_km,
    VOYAGE.Distance_km,
    (VOYAGE.Distance_km * TRANSPORT.Emission_CO2) AS Total_CO2_Voyage
FROM VOYAGE
JOIN TRANSPORT ON VOYAGE.ID_TRANSPORT = TRANSPORT.ID_Transport
JOIN AGENCE ON AGENCE.ID_Agence=VOYAGE.ID_Agence;

/* Requete 6 */
SELECT 
    AGENCE.Nom_Agence,
    VOYAGE.Destination, 
    LABEL_ECOLOGIQUE.Nom_Label, 
    LABEL_ECOLOGIQUE.Niveau_Impact
FROM VOYAGE
JOIN AGENCE ON VOYAGE.ID_Agence = AGENCE.ID_Agence
JOIN LABEL_ECOLOGIQUE ON VOYAGE.ID_Label = LABEL_ECOLOGIQUE.ID_Label
WHERE LABEL_ECOLOGIQUE.Niveau_Impact >= 3
ORDER BY LABEL_ECOLOGIQUE.Niveau_Impact DESC;

/* Requete 7  */
SELECT 
    AGENCE.Nom_Agence,
    HOTEL.Nom_Hotel,
    VOYAGE.Destination,
    TRANSPORT.Type_Transport,
    TRANSPORT.Compagnie_Aerienne,
    (VOYAGE.Prix + (VOYAGE.Nb_Nuits * HOTEL.Prix_Nuit)) AS PRIX_TOTAL_VOYAGE
FROM VOYAGE
JOIN HOTEL ON VOYAGE.ID_Hotel = HOTEL.ID_Hotel
JOIN TRANSPORT ON VOYAGE.ID_Transport = TRANSPORT.ID_Transport
JOIN AGENCE ON VOYAGE.ID_Agence = AGENCE.ID_Agence;

/* Requete 8 */
SELECT 
    CLIENT.NOM, 
    CLIENT.Prenom, 
    VOYAGE.Ville_Depart,
    VOYAGE.Destination, 
    VOYAGE.Date_Depart, 
    AGENCE.Nom_Agence
FROM RESERVER
JOIN CLIENT ON RESERVER.ID_Client = CLIENT.ID_Client
JOIN VOYAGE ON RESERVER.ID_Voyage = VOYAGE.ID_Voyage
JOIN AGENCE ON VOYAGE.ID_Agence = AGENCE.ID_Agence;

/* Requete 9 */
SELECT 
    VOYAGE.Ville_Depart,
    VOYAGE.Destination, 
    TRANSPORT.Type_Transport, 
    LABEL_ECOLOGIQUE.Nom_Label, 
    (VOYAGE.Distance_km * TRANSPORT.Emission_CO2) AS Total_CO2_Voyage
FROM VOYAGE
JOIN TRANSPORT ON VOYAGE.ID_TRANSPORT = TRANSPORT.ID_Transport
JOIN LABEL_ECOLOGIQUE ON VOYAGE.ID_Label = LABEL_ECOLOGIQUE.ID_Label
ORDER BY Total_CO2_Voyage ASC;

/* Requete 10 */
SELECT 
    AGENCE.Nom_Agence,
    VOYAGE.Destination, 
    HOTEL.Nom_Hotel, 
    HOTEL.Categorie AS Etoiles, 
    TRANSPORT.Type_Transport, 
    TRANSPORT.Compagnie_Aerienne
FROM VOYAGE
JOIN HOTEL ON VOYAGE.ID_Hotel = HOTEL.ID_Hotel
JOIN TRANSPORT ON VOYAGE.ID_TRANSPORT = TRANSPORT.ID_Transport
JOIN AGENCE ON VOYAGE.ID_Agence = AGENCE.ID_Agence
WHERE HOTEL.Categorie >= 4;