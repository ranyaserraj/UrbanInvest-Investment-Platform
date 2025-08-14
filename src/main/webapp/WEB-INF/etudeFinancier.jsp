<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Formulaire d'Étude Financière</title>
</head>
<body>
    <h1>Formulaire d'Étude Financière</h1>
    <form method="post" action="form11">
        <p>
            <label for="nomComplet">Nom Complet : </label>
            <input type="text" name="nomComplet" id="nomComplet" required />
        </p>
        <p>
            <label for="telephone">Téléphone : </label>
            <input type="tel" name="telephone" id="telephone" required />
        </p>
        <p>
            <label for="nomDuProjet">Nom du Projet : </label>
            <input type="text" name="nomDuProjet" id="nomDuProjet" required />
        </p>
        <p>
            <label for="typeInvestissement">Type d'Investissement : </label>
            <input type="text" name="typeInvestissement" id="typeInvestissement" required />
        </p>
        <p>
            <label for="villeRegion">Ville/Région : </label>
            <input type="text" name="villeRegion" id="villeRegion" required />
        </p>
        <p>
            <label for="adresseExacte">Adresse Exacte : </label>
            <input type="text" name="adresseExacte" id="adresseExacte" required />
        </p>
        <p>
            <label for="superficieEstimee">Superficie Estimée (en m²) : </label>
            <input type="number" name="superficieEstimee" id="superficieEstimee" min="0" required />
        </p>
        <p>
            <label for="budgetEstimee">Budget Estimé (en €) : </label>
            <input type="number" step="0.01" name="budgetEstimee" id="budgetEstimee" min="0" required />
        </p>
        <p>
            <label for="sourceFinancement">Source de Financement : </label>
            <input type="text" name="sourceFinancement" id="sourceFinancement" required />
        </p>
        
        <input type="submit" value="Envoyer" />
    </form>
</body>
</html>