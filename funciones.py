#cargar paquetes
import pandas as pd 
import sqlite3 as sql 
import sys 
from sklearn.impute import SimpleImputer

#Función que imputa datos para variables numéricas
def impute_columns(df, columns, strategy): 
  imputer = SimpleImputer(strategy=strategy)
  for column in columns:
    column_imputed = imputer.fit_transform(df[column].values.reshape(-1, 1))
    df[column] = column_imputed.flatten()
  return df
def categorias(pandas_db,sql_db):
    """pandas_db= Base de datos con el df de pandas.\n
       sql_db= nombre de la base de datos entre comillas "" de sql declarada en el .to_sql() """
    for i in range(pandas_db.shape[1]):
        db_name=sql_db
        column_name=pandas_db.columns.values[i]
        texto= f'select {column_name}, count(*) as "qty" from {db_name} group by {column_name}'   
        print(f"****Variable {column_name}****")
        print(pd.read_sql(texto, conn))

#Funcion uqe ejecuta sql en python        
def ejecutar_sql (nombre_archivo, cur):
  sql_file=open(nombre_archivo)
  sql_as_string=sql_file.read()
  sql_file.close
  cur.executescript(sql_as_string)