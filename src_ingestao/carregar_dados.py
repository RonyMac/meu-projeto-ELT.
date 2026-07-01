import pandas as pd
from sqlalchemy import create_engine

# Extract
df = pd.read_csv('data/clientes_brutos.csv')

# Load (Injeta o dado bruto na tabela 'raw_clientes')
engine = create_engine('sqlite:///../empresa.db')
df.to_sql('raw_clientes', con=engine, if_exists='replace', index=False)

print("Etapa de Extract e Load concluída!")
