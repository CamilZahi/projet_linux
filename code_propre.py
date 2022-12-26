# -*- coding: utf-8 -*-

import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.linear_model import LogisticRegression
from sklearn import linear_model
from sklearn.svm import SVC
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from time import time
from sklearn.metrics import f1_score

df1 = pd.read_csv("data/2008.csv")
df2 = pd.read_csv("data/2009.csv")
df3 = pd.read_csv("data/2010.csv")
df4 = pd.read_csv("data/2011.csv")
df5 = pd.read_csv("data/2012.csv")
df6 = pd.read_csv("data/2013.csv")
df7 = pd.read_csv("data/2014.csv")
df8 = pd.read_csv("data/2015.csv")
df7 = pd.read_csv("data/2016.csv")
df9 = pd.read_csv("data/2017.csv")
df10 = pd.read_csv("data/2018.csv")
df11 = pd.read_csv("data/2019.csv")
df12 = pd.read_csv("data/2020.csv")
df13 = pd.read_csv("data/2021.csv")
df14 = pd.read_csv("data/2022.csv")
df15 = pd.read_csv("data/2023.csv")

data = pd.concat([df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12,df13,df14,df15])

# Echantillon d'entrainement
def model_entrainement(clf, X_train, y_train):
    start = time()
    clf.fit(X_train, y_train)
    end = time()
   # print("Modèle d'apprentissage {:2f} seconds".format(end-start))

# Fonctions réalisant nos prédictions
def predict_labels(clf, features, target):
    start = time()
    y_pred = clf.predict(features)
    end = time()
   # print("Etablis nos prédictions en {:2f} seconds".format(end-start))

    acc = sum(target == y_pred) / float(len(y_pred))

    return f1_score(target, y_pred, average='micro'), acc

# Nos scores de modèles sur échantillons d'apprentissage et échantillon de test
def model(clf, X_train, y_train, X_test, y_test):
    model_entrainement(clf, X_train, y_train)

    f1, acc = predict_labels(clf, X_train, y_train)
   # print("train set:")
   # print("-" * 20)
   # print("F1 Score:{}".format(f1))
   # print("Accuracy:{}".format(acc))

   # f1, acc = predict_labels(clf, X_test, y_test)
   # print("test set:")
   # print("-" * 20)
   # print("F1 Score:{}".format(f1))
   # print("Accuracy:{}".format(acc))

# Définition de nos variables utiles pour réaliser nos prédictions
vars_X = ['home_encoded', 'away_encoded', 'HTHG', 'HTAG', 'HS',
                'AS', 'HST', 'AST', 'HR', 'AR']
var_Y = ['FTR']

# Notre périmètre de modélisation
features = vars_X + var_Y

# Encodage nécessaire pour nos variables témoignant des équipes 
encoder = LabelEncoder()
home_encoded = encoder.fit_transform(data['HomeTeam'])
home_encoded_mapping = dict(
    zip(encoder.classes_, encoder.transform(encoder.classes_).tolist()))
data['home_encoded'] = home_encoded

encoder = LabelEncoder()
away_encoded = encoder.fit_transform(data['AwayTeam'])
away_encoded_mapping = dict(
    zip(encoder.classes_, encoder.transform(encoder.classes_).tolist()))
data['away_encoded'] = away_encoded

data = data[features]

# Analyse des valeurs manquantes
data.isna().sum()
# Possiblement 2 observations à supprimer

# Suppression de nos observations manquantes
data[data.isna().any(axis=1)]
data = data.dropna(axis=0)

# Variables explicatives et variable à expliquer
X = data[vars_X]
Y = data['FTR']

# Séparation en 2 échantillons un d'apprentissage et un de test
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2)

# Préparation de nos algorithmes de Machine Learning choisis
lr_classifier1 = LogisticRegression(multi_class='ovr', max_iter=500)
lr_classifier2 = linear_model.LogisticRegression(C=1.0,max_iter=500)
nbClassifier = GaussianNB()
rfClassifier = RandomForestClassifier()

# Résultats de nos différents modèles

#Régression logistique 1
model(lr_classifier1, X_train, Y_train, X_test, Y_test)


#Régression logistique 2
model(lr_classifier2, X_train, Y_train, X_test, Y_test)

#Classification naive Bayésienne
model(nbClassifier, X_train, Y_train, X_test, Y_test)

#Forêts aléatoires
model(rfClassifier, X_train, Y_train, X_test, Y_test)

# On sélectionne une année pour nous intéresser maintenant aux paris sportifs

df = pd.read_csv("data/2018.csv")

# Suppression de nos observations manquantes
df[df.isna().any(axis=1)]
df = df.dropna(axis=0)

# Sélectionner les colonnes d'entrée
df['HTR'] = df['HTR'].replace({"H": 0, "D": 1, "A": 2})
X = df[['HTHG', 'HTAG', 'HS', 'AS', 'HTR']]

# Créer la variable cible en codant la colonne FTR en valeurs numériques
y = df['FTR'].replace({"H": 0, "D": 1, "A": 2})
y = y.astype(float)
# Séparer le dataframe en jeu d'entraînement et jeu de test
X_train2, X_test2, y_train2, y_test2 = train_test_split(X, y, test_size=0.2, random_state = 42)

# Entraîner un modèle de régression logistique
lr = LogisticRegression(multi_class = 'ovr' , max_iter = 500)
lr.fit(X_train2, y_train2)

# Prédire les classes pour les données de test
y_pred = lr.predict(X_test2)

# Calculez les probabilités de chaque classe
y_proba = lr.predict_proba(X_test2)


# Calculer l'accuracy des prédictions
accuracy = (y_pred == y_test2).mean()


def simulate_year_of_bets(df, y_pred, y_test2, bet_amount=5):
    # Initialiser notre compteur de départ
    total_winnings = 0
    # Initialiser le compteur de paris gagnants et perdus à 0
    win_count = 0
    loss_count = 0

    # Pour chaque pari et chaque prédiction
    for i, prediction in enumerate(y_pred):
        # Récupérer les cotes de chaque événement
        home_win_odds = df.iloc[i]['B365H']
        away_win_odds = df.iloc[i]['B365A']
        draw_odds = df.iloc[i]['B365D']
        
        # Vérifier si la prédiction est correcte
        if prediction == y_test2.iloc[i]:
            # Si la prédiction est correcte, on parie sur l'événement correspondant
            if prediction == 0.0:
                total_winnings += home_win_odds * bet_amount
                win_count += 1
            elif prediction == 1.0:
                total_winnings += draw_odds * bet_amount
                win_count += 1
            elif prediction == 2.0:
                total_winnings += away_win_odds * bet_amount
                win_count
               # Sinon, on perd la mise et on compte un pari perdu
            
        else:
            total_winnings -= bet_amount
            loss_count += 1
    
    # On retourne le compteur de gains et les compteurs de paris gagnants et perdus à la fin de l'année de paris
    return total_winnings, win_count, loss_count

# Appeler la fonction pour simuler une année de paris
print("Votre gain annuel avec PronoSocker (avec le nombre de paris gagnés et le nombre de paris perdus en misant 5 euros à chaque match) : " ,simulate_year_of_bets(df, y_pred, y_test2))

cm = pd.crosstab(y_test2, y_pred, rownames=['Classe réelle'], colnames=['Classe prédite'])

from sklearn.metrics import classification_report

classification_report(y_test2, y_pred)
