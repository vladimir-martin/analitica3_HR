#cargar paquetes
import pandas as pd 
import sqlite3 as sql 
import sys 
from sklearn.impute import SimpleImputer

#funcion que muestra categorias
def categorias(pandas_db,sql_db):
    """pandas_db= Base de datos con el df de pandas.\n
       sql_db= nombre de la base de datos entre comillas "" de sql declarada en el .to_sql() """
    #conn= sql.connect("db_empleados.db")
    for i in range(pandas_db.shape[1]):
        db_name=sql_db
        column_name=pandas_db.columns.values[i]
        texto= f'select {column_name}, count(*) as "qty" from {db_name} group by {column_name}'   
        print(f"****Variable {column_name}****")
        print(pd.read_sql(texto, sql.connect("db_empleados.db")))

#Función que imputa datos para variables numéricas
def impute_columns(df, columns, strategy): 
  imputer = SimpleImputer(strategy=strategy)
  for column in columns:
    column_imputed = imputer.fit_transform(df[column].values.reshape(-1, 1))
    df[column] = column_imputed.flatten()
  return df

#Funcion uqe ejecuta sql en python        
def ejecutar_sql (nombre_archivo, cur):
  sql_file=open(nombre_archivo)
  sql_as_string=sql_file.read()
  sql_file.close
  cur.executescript(sql_as_string)

#funcion para comparar los desempeños de modelos
def sel_variables(modelos,X,y,threshold):
    
    var_names_ac=np.array([])
    for modelo in modelos:
        #modelo=modelos[i]
        modelo.fit(X,y)
        sel = SelectFromModel(modelo, prefit=True,threshold=threshold)
        var_names= sel.get_feature_names_out(modelo.feature_names_in_)
        var_names_ac=np.append(var_names_ac, var_names)
        var_names_ac=np.unique(var_names_ac)
    
    return var_names_ac