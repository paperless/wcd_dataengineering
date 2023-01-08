import requests
import pandas as pd
import boto3

response = requests.get("https://www.themuse.com/api/public/jobs?page=50", verify=False)
resp_json = response.json()

print()
# print(resp['results'][0]['publication_date'])
# print(resp['results'][0]['name'])
# print(resp['results'][0]['type'])
# print(resp['results'][0]['locations'][0]['name'])
# print(resp['results'][0]['company']['name'])

data_dict = {'publication_date': [],
            'job_type': [],
            'job': [],
            'company': [],
            'city': [],
            'country': []            
            }

for j in range(len(resp_json['results'])):
    data_dict['company'].append(resp_json['results'][j]['company']['name'])
    country = resp_json['results'][j]['locations'][0]['name'].split(', ')
    location_country = country[-1]
    location_city = country[0]
    data_dict['country'].append(location_country)
    data_dict['city'].append(location_city)
    data_dict['job'].append(resp_json['results'][j]['name'])
    data_dict['job_type'].append(resp_json['results'][j]['type'])
    data_dict['publication_date'].append(resp_json['results'][j]['publication_date'][:10])

df = pd.DataFrame(data=data_dict)
file_name = 'job.csv'
file_to_upload = f'./temp_output/{file_name}'
df.to_csv(file_to_upload)
# print(df.head())

s3 = boto3.client('s3')
print("Initiating upload to S3...")
s3.upload_file(file_to_upload, 
                'dianaawsbucketwcd1',
                file_name)
# alternative example using AWS CLI:
# aws s3 cp file_to_upload 's3://dianaawsbucketwcd1/file_to_upload'
print("Done!")
