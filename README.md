## 📊 Analyse exploratoire des trajets de taxi à New York (dbt project)

Ce projet dbt a pour objectif de réaliser une première analyse exploratoire sur les données publiques de trajets de taxis jaunes de New York (2024). Les données sont stockées au format Parquet et accessibles via une URL fournie par NYC TLC.

### Objectifs du projet :
- Charger les données Parquet distantes dans dbt
- Analyser la répartition des trajets selon :
  - Le type de paiement (`payment_type`)
  - Le statut de transfert (`store_and_fwd_flag`)
  - Les zones de prise en charge et de dépôt (`PULocationID`, `DOLocationID`)
  - Les anomalies temporelles (ex : dépôt avant prise en charge)
  - Les distances nulles ou incohérentes

### Résultat attendu :
Ce projet permet de mettre en lumière les premières tendances, de détecter des anomalies dans les données brutes, et de préparer la construction de modèles dbt plus robustes dans une pipeline analytique.

### Technologies :
- dbt (data build tool)
- SQL
- Duckdb
- Fichiers Parquet distants
