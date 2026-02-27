# 🚕 Analyse de Rentabilité : Taxis NYC 2024 (dbt & DuckDB)

## 🎯 Objectif du Projet
Transformer des données brutes de trajets de taxi (format Parquet) en une pipeline analytique fiable. L'objectif final est d'identifier les zones et les périodes les plus rentables (pourcentage de pourboire le plus élevé) pour les chauffeurs à New York.

## 🛠️ Stack Technique
- **dbt-duckdb** : Pour la transformation SQL haute performance avec DuckDB.
- **DuckDB** : Moteur de base de données OLAP local utilisé pour le traitement des données.
- **Parquet** : Format de source de données haute performance (NYC TLC).

## 📊 Architecture & Pipeline
1. **Ingestion** : Lecture des fichiers Parquet locaux (données de 2024).
2. **Nettoyage (Staging)** : Filtrage des anomalies (passagers = 0, distances nulles, montants négatifs).
3. **Optimisation** : Exclusion des trajets avec des vitesses physiquement impossibles (> 100 mph).
4. **Enrichissement (Mart)** : 
   - Jointure avec les zones de taxi (Seeds) pour obtenir les noms des quartiers (Boroughs).
   - Création de dimensions temporelles (Heures, Jours de la semaine, Périodes de la journée).
5. **Analyse** : Calcul automatique du `% de pourboire` moyen pour chaque zone géographique.

## 🛡️ Qualité des Données
- **14 tests automatisés** : Validation de la non-nullité, des types de données (BIGINT pour les passagers) et des valeurs acceptées (Credit card, Cash).
- **Tests personnalisés** : Détection proactive des anomalies de vitesse et des incohérences de distance.

## 📈 Résultats Clefs
- **Segmentation Temporelle** : Identification des variations de rentabilité entre les heures de pointe et la nuit.
- **Top Zones** : Classement des quartiers par générosité des clients (basé sur le `tip_percentage`).