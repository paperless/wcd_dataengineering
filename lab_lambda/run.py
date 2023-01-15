import sqlalchemy
from dotenv import load_dotenv
import os
import json

load_dotenv()
my_id = os.getenv("DBUSER")
my_password = os.getenv("PASSWORD")

eng = sqlalchemy.create_engine(f'mysql+pymysql://{my_id}:{my_password}@database-n.cfvun1nyryw5.eu-central-1.rds.amazonaws.com:3306/superstore') 
# print(eng.table_names())
query = """SELECT
c.CustomerID, sum(o.Sales) as SumSales
FROM superstore.customers c join superstore.orders o on c.CustomerID = o.CustomerID
group by c.CustomerID
order by SumSales desc
limit 10
"""
mystr = "{"
with eng.connect() as con:
    rs = con.execute(query)
    # id_count = rs.first()[0]
    for row in rs:
        mystr += ('"' + str(row["CustomerID"]) + '": ' + str(row["SumSales"]) + ', ')

mystr = mystr[:-2] + '}'
result = json.loads(mystr)
with open('result.json', 'w') as f:
    json.dump(result, f)
