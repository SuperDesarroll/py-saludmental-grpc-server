import os
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
from subprocess import check_output

from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.model_selection import cross_validate

from sklearn.feature_selection import SelectKBest
from sklearn.gaussian_process import GaussianProcessClassifier
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier, GradientBoostingClassifier

from sklearn.model_selection import GridSearchCV
from sklearn.metrics import confusion_matrix

import grpc
import socket
import sys
import json

class MlDetection():

    def cargar(self):

        data = pd.read_csv("server/sabana_recoleccion_datos_detallada.csv",sep=';')
        pd.set_option('display.max_columns', None)
        data.columns

        data.drop(['Ingresos',"Años Cumplidos", 'usuario_id', 'iat', 'id', '%', 'fecha', 'latitud', 'longitud','El departamento de residencia actual es','El municipio de residencia actual es','Universidad','Acepto participar','¿De acuerdo a la identidad de género, usted se considera?','¿Dónde vive usted actualmente en Santa Marta?','¿Te consideras una persona?','Especifique la categoria de género'], axis=1, inplace=True)

        data.rename(columns={'Soy mayor de edad': 'Mayor de edad'}, inplace=True)
        data.rename(columns={'Acepto participar': 'Acepta participar'}, inplace=True) 
        data.rename(columns={'Años Cumplidos': 'Edad'}, inplace=True) 
        data.rename(columns={'¿Cuál es su sexo?': 'Sexo'}, inplace=True) 
        data.rename(columns={'¿De acuerdo a la identidad de género, usted se considera?': 'Identidad Genero'}, inplace=True) 
        data.rename(columns={'Especifique la categoria de género': 'Cat. Genero'}, inplace=True) 
        data.rename(columns={'¿Te consideras una persona?': 'Raza'}, inplace=True) 
        data.rename(columns={'¿Cuál es el estrato del barrio en que vives?': 'Estrato'}, inplace=True) 
        data.rename(columns={'Su ingreso económico es': 'Nivel Ingreso'}, inplace=True) 
        data.rename(columns={'Ingresos': 'Ingresos'}, inplace=True) 
        data.rename(columns={'¿Cuál es su ocupación?': 'Ocupacion'}, inplace=True) 
        data.rename(columns={'Estado Marital': 'Estado Marital'}, inplace=True) 
        data.rename(columns={'Nivel de escolaridad': 'Nivel Escolar'}, inplace=True) 
        data.rename(columns={'¿Haces parte de la comunidad universitaria?': 'Parte de la U'}, inplace=True) 
        data.rename(columns={'Universidad': 'Universidad'}, inplace=True) 
        data.rename(columns={'¿En relación con la universidad mi rol es?': 'Rol en la U'}, inplace=True) 
        data.rename(columns={'El departamento de residencia actual es': 'Departamento'}, inplace=True) 
        data.rename(columns={'El municipio de residencia actual es': 'Municipio'}, inplace=True)  
        data.rename(columns={'Vivo en la zona': 'Zona'}, inplace=True) 
        data.rename(columns={'¿Dónde vive usted actualmente en Santa Marta?': 'En Santa Marta'}, inplace=True) 
        data.rename(columns={'Mi estado de salud en general actual es': 'Estado Salud'}, inplace=True) 
        data.rename(columns={'Actualmente, vivo con una enfermedad crónica': 'Enfermedad Cronica'}, inplace=True) 
        data.rename(columns={'He sido diagnosticado con COVID-19 durante la pandemia': 'Diagnosticado COVID'}, inplace=True) 
        data.rename(columns={'Los síntomas de la enfermedad por COVID fueron': 'Nivel Sintomas'}, inplace=True) 
        data.rename(columns={'Debido a la enfermedad por COVID usted requirió': 'Asistencia COVID'}, inplace=True) 
        data.rename(columns={'¿Algún familiar o conocido cercano se le comprobó la infección por COVID-19?': 'Familiar Contagiado'}, inplace=True) 
        data.rename(columns={'¿Algún familiar cercano ha fallecido por la infección por COVID-19?': 'Familiar Fallecido'}, inplace=True) 
        data.rename(columns={'Me incomoda pensar en el coronavirus-19': 'Incomoda Covid'}, inplace=True) 
        data.rename(columns={'Mis manos se ponen húmedas cuando pienso en el coronavirus-19': 'Manos Humedas'}, inplace=True) 
        data.rename(columns={'Temo morir por el coronavirus-19': 'Temor Covid'}, inplace=True) 
        data.rename(columns={'Es difícil dormir porque me preocupa contraer el coronavirus-19': 'Dificil Dormir'}, inplace=True) 
        data.rename(columns={'Mi corazón se acelera o me dan palpitaciones cuando pienso en contraer el coronavirus-19': 'Corazon Acelerado'}, inplace=True) 
        data.rename(columns={'Confío en las vacunas contra COVID-19': 'confia Vacunas'}, inplace=True) 
        data.rename(columns={'Todas personas deberían vacunarse contra COVID-19': 'Deberian Vacunarse'}, inplace=True) 
        data.rename(columns={'Yo recomiendo las vacunas contra COVID-19': 'Recomienda Vacunas'}, inplace=True) 
        data.rename(columns={'Es importante que las personas que me rodean estén vacunadas contra COVID-19': 'Cercanos Vacunarse'}, inplace=True) 
        data.rename(columns={'Es vital que me vacune contra COVID-19': 'Vital Vacunarse'}, inplace=True) 
        data.rename(columns={'Es mayor el beneficio de las vacunas contra COVID-19 que los posibles efectos secundarios': 'Vacunas Beneficiosas'}, inplace=True) 
        data.rename(columns={'Confío en la información proporcionada sobre las vacunas contra COVID-19': 'Confia Informacion'}, inplace=True) 
        data.rename(columns={'Los programas de vacunación limitan los derechos civiles': 'Vacunacion Limita'}, inplace=True) 
        data.rename(columns={'Cree que al vacunarse contra la Covid-19 le implantaran un microchip': 'Vacuna MicroChip'}, inplace=True) 
        data.rename(columns={'¿Considera que al vacunarse por COVID-19 puede tener efectos secundarios?': 'Efectos Secundarios'}, inplace=True) 
        data.rename(columns={'Ha sido vacunado contra COVID-19': 'Vacunado'}, inplace=True) 
        data.rename(columns={'Planeo vacunarme contra COVID-19': 'Se vacunara'}, inplace=True) 
        data.rename(columns={'Planea aplicarse nuevas dosis de refuerzo contra COVID-19': 'Reforzara'}, inplace=True) 
        data.rename(columns={'¿Cuantas dosis de la vacuna hacia el coronavirus ha recibido?': 'Cantidad Dosis'}, inplace=True) 
        data.rename(columns={'Tener poco interés o placer para hacer las actividades que antes disfrutaba': 'Desinteres Diversion'}, inplace=True) 
        data.rename(columns={'Sentirse triste, deprimido (a) o sin esperanzas': 'Deprimido'}, inplace=True) 
        data.rename(columns={'Dificultad para conciliar o mantener el sueño o dormir demasiado': 'No duerme'}, inplace=True) 
        data.rename(columns={'Sentirse cansado (a) o tener poca energía': 'Cansado'}, inplace=True) 
        data.rename(columns={'Tener poco apetito o comer en exceso': 'Poco Apetito'}, inplace=True) 
        data.rename(columns={'Sentirse mal con usted mismo-que es un fracaso, o que ha quedado mal con usted mismo o con su familia': 'Fracasado'}, inplace=True) 
        data.rename(columns={'Dificultad para concentrarse en actividades, como leer o ver televisión': 'Distraido'}, inplace=True) 
        data.rename(columns={'Moverse o hablar tan despacio que otras personas lo han notado o por el contrario, sentirse tan inquieto(a) que se ha movido mucho más de lo usual': 'Lento o Hiperactivo'}, inplace=True) 
        data.rename(columns={'Ha pensado que estaría mejor muerto (a) o ha tenido deseos de hacerse daño de alguna forma': 'Auto-Lesion'}, inplace=True) 
        data.rename(columns={'Se ha sentido nervioso(a), ansioso(a) o con los nervios de punta': 'Nervioso Ansioso'}, inplace=True) 
        data.rename(columns={'No ha sido capaz de parar o controlar su preocupación ': 'Siempre preocupado'}, inplace=True) 
        data.rename(columns={'Se ha preocupado demasiado por motivos diferentes': 'Preocupado sin motivos'}, inplace=True) 
        data.rename(columns={'Ha tenido dificultad para relajarse': 'No se relaja'}, inplace=True) 
        data.rename(columns={'Se ha sentido tan inquieto(a) que no ha podido quedarse quieto(a)': 'Inquieto'}, inplace=True) 
        data.rename(columns={'Se ha molestado o irritado fácilmente': 'Irritado'}, inplace=True) 
        data.rename(columns={'Ha tenido miedo de que algo terrible fuera a pasar': 'Miedo'}, inplace=True) 
        data.rename(columns={'Medios tradicionales': 'Medios tradicionales'}, inplace=True) 
        data.rename(columns={'Medios tecnológicos': 'Medios tecnologicos'}, inplace=True)
        data.rename(columns={'Personal de la salud': 'Personal salud'}, inplace=True)
        data.rename(columns={'Gobierno agencias': 'Gobierno agencias'}, inplace=True)
        data.rename(columns={'Familiares o amigos': 'Familiares amigos'}, inplace=True)
        data.rename(columns={'Las personas son unidas y generalmente se conocen entre sí': 'Personas Unidas'}, inplace=True)
        data.rename(columns={'Si tuviera que pedir prestado $10.000, en caso de emergencia, podría pedírselo prestado a un vecino': 'Prestan Dinero'}, inplace=True)
        data.rename(columns={'Se puede confiar en las personas': 'Confianza Personas'}, inplace=True)
        data.rename(columns={'Si estuviera enfermo podría contar con mis vecinos para que hiciera algunas compras por mí': 'Vecinos Compra'}, inplace=True)
        data.rename(columns={'Las personas comparten los mismos valores': 'Valores Compartidos'}, inplace=True)
        data.rename(columns={'El Gobierno Nacional están haciendo un buen trabajo en el control de la epidemia por COVID-19': 'Gob. Dedicado'}, inplace=True)
        data.rename(columns={'El Gobierno Nacional tiene recursos suficientes para hacer frente al COVID-19': 'Gob. Recursos'}, inplace=True)
        data.rename(columns={'El Gobierno Nacional está preparado para manejar las siguientes fases de la pandemia por COVID-19': 'Gob. Preparado'}, inplace=True)
        data.rename(columns={'Los alcaldes están preparados para el control de la COVID-19 en los próximos meses': 'Alcaldias Prep'}, inplace=True)

        data.columns

        data.info()
        print(data.shape)

        for colName in data.columns:        
            colOptions=data[colName].value_counts().sort_index(ascending=True).index.tolist()
            colCounts=data[colName].value_counts().sort_index(ascending=True)
            col = data[colName] 
            if colName in ["Deprimido","Auto-Lesion"]:        
                for i, value in enumerate(col):     
                    if value in ["-","Para Nada / Ningún día"]:
                        col[i] = 0
                    else:
                        col[i] = 1
            else:
                print(colName)
                for idOption,cantidad in enumerate(colCounts):                      
                    print(idOption,") ",colOptions[idOption], "=",cantidad)            
                for i, value in enumerate(col):     
                    index = colOptions.index(value)
                    col[i] = index    

        for colName in data.columns:        
            data[colName] = pd.to_numeric(data[colName]).copy()

        data.head()


        target1="Deprimido"
        target2="Auto-Lesion"

        print(data[target1].value_counts())
        print(data[target2].value_counts())

        target=target1

        print(data[target].value_counts())

        pipeline = Pipeline([
            ('normalizer', StandardScaler()),  # Step1 - normalize data
            ('clf', LogisticRegression())  # step2 - classifier
        ])
        pipeline.steps

        targets = data[target]
        data.drop([target1,target2], axis=1, inplace=True)

        data = data[['Desinteres Diversion', 'Fracasado', 'Irritado']]

        X_train, X_test, y_train, y_test = train_test_split(data.values,
                                                            targets,
                                                            test_size=0.10, random_state=42
                                                            )
        print(data.shape)
        print(X_train.shape)
        print(X_test.shape)
        print(y_train.shape)
        print(y_test.shape)

        scores = cross_validate(pipeline, X_train, y_train)
        print(scores)

        print(scores['test_score'].mean())

        clfs = []
        clfs.append(LogisticRegression())
        clfs.append(SVC())
        clfs.append(KNeighborsClassifier(n_neighbors=3))
        clfs.append(DecisionTreeClassifier())
        clfs.append(RandomForestClassifier())
        clfs.append(GradientBoostingClassifier())
        print("Ejecutando Clasificadores")
        for classifier in clfs:
            pipeline.set_params(clf = classifier)
            scores = cross_validate(pipeline, X_train, y_train)
            print('---------------------------------')
            print(str(classifier))
            print('-----------------------------------')
            for key, values in scores.items():
                    print(key,' mean ', values.mean())
                    print(key,' std ', values.std())

        pipeline.set_params(clf= GradientBoostingClassifier())
        pipeline.steps

        pipeline.get_params()

        print("\nBUSCANDO LOS MEJORES PARAMETROS PARA GradientBoostingClassifier")
        cv_grid = GridSearchCV(pipeline, param_grid = {
            'clf__min_samples_split': [2,5,10,20],
            #'clf__criterion': ['friedman_mse','gini','entropy','log_loss'],
            'clf__criterion': ['friedman_mse', 'squared_error'],    
            'clf__n_estimators': [50,100,150,200],
            'clf__max_features': ['sqrt','log2',None]   
        },error_score='raise')

        cv_grid.fit(X_train, y_train)

        print(cv_grid.best_params_)

        print(cv_grid.best_score_)

        y_predict = cv_grid.predict(X_test)
        accuracy = accuracy_score(y_test,y_predict)
        print('Accuracy of the best classifier after CV is %.3f%%' % (accuracy*100))

        df_cv_scores=pd.DataFrame(cv_grid.cv_results_).sort_values(by='rank_test_score')
        #selecting specific columns to create a view
        scores = df_cv_scores[['params','split0_test_score', 'split1_test_score', 'split2_test_score',\
            'split3_test_score', 'split4_test_score', 'mean_test_score',\
            'std_test_score', 'rank_test_score']]

        scores.head(50)

        confusion_matrix(y_test,y_predict)

        return cv_grid