SELECT id, nom, ville FROM client;

SELECT nom, prix, stock FROM produit
WHERE stock > 0 AND  actif != 0
ORDER BY prix DESC;

SELECT nom, prix, stock FROM produit
WHERE nom LIKE '%SQL%';

SELECT id, id_client, date_commande
FROM commande
WHERE statut = 'PAYEE';

SELECT COUNT(*) as nombre_total FROM client;

SELECT MAX(prix) AS MAX_price, MIN(prix) AS min_price, AVG(prix) FROM produit;

SELECT * FROM produit
WHERE stock = 0;

SELECT * 
FROM client
WHERE YEAR(date_inscription) = 2026;

SELECT nom, prix
FROM produit
ORDER BY prix DESC
LIMIT 3;


SELECT *
FROM commande
WHERE date_commande BETWEEN '2026-03-01 00:00:00'
AND '2026-03-31 23:59:59';




SELECT produit.nom, categorie.nom
FROM produit
JOIN categorie WHERE produit.id_categorie = categorie.id;

SELECT commande.id, sum(prix_unitaire*qte) AS total
FROM commande
JOIN ligne_commande WHERE commande.id = ligne_commande.id_commande
GROUP BY commande.id;


SELECT commande.id as commande_id, client.nom AS client_nom, commande.statut, commande.date_commande
FROM commande
JOIN client ON client.id = commande.id_client;


SELECT * 
FROM client
LEFT JOIN commande ON client.id = commande.id_client
WHERE commande.id_client IS NULL;


SELECT client.nom, COUNT(*) AS nb_commande
FROM client
LEFT JOIN commande ON client.id = commande.id_client
GROUP BY client.id;


SELECT categorie.nom, sum(qte * prix_unitaire) AS total_ventes
FROM ligne_commande
JOIN produit ON produit.id = ligne_commande.id_produit
JOIN categorie ON categorie.id = produit.id_categorie
GROUP BY categorie.nom;

SELECT SUM(qte * prix_unitaire) AS total
FROM commande
JOIN ligne_commande ON commande.id = ligne_commande.id_commande
GROUP BY commande.id
HAVING total > 1000;

SELECT * 
FROM produit
LEFT JOIN ligne_commande ON produit.id = ligne_commande.id_produit
WHERE ligne_commande.id_produit IS NULL;

SELECT statut, COUNT(*) AS nb_commande
FROM commande
WHERE YEAR(date_commande) = 2026 AND month(date_commande) = 3
GROUP BY statut;


SELECT *
FROM commande
left JOIN paiement ON commande.id = paiement.id_commande
WHERE paiement.id_commande IS NULL AND commande.statut = 'PAYEE';