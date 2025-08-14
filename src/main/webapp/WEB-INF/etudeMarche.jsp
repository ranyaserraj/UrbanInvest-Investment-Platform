<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Formulaire d'Étude de marche</title>
</head>
<body>
    <h1>Formulaire d'Étude de marche</h1>
    <form method="post" action="form22">
        <p>
            <label for="nomProjet">Nom du Projet : </label>
            <input type="text" name="nomProjet" id="nomProjet" required />
        </p>
        <p>
            <label for="typeInvesissement">type d'Invesissement : </label>
            <input type="text" name="typeInvesissement" id="typeInvesissement" required />
        </p>
        <p>
            <label for="villeRegion">Ville/Region : </label>
            <input type="text" name="villeRegion" id="villeRegion" required />
        </p>
        <p>
            <label for="adresseExacte">Adresse : </label>
            <input type="text" name="adresseExacte" id="adresseExacte" required />
        </p>
        <p>
            <label for="superficieEstimee">Superficie Estimée (en m²) : </label>
            <input type="number" name="superficieEstimee" id="superficieEstimee" required />
        </p>
        <p>
            <label for="objectifEtude">Objectif d'etude : </label>
            <input type="text" name="objectifEtude" id="objectifEtude" required />
        </p>
        <p>
            <label for="typeClientele">type de clientele: </label>
            <input type="text" name="typeClientele" id="typeClientele"  required />
        </p>
        <p>
            <label for="concurrents">les concurrents : </label>
            <input type="text" name="concurrents" id="concurrents" required />
        </p>
       
        <input type="submit" value="Envoyer" />
    </form>
</body>
</html>