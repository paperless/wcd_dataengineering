#!/usr/bin/env python3

import pandas as pd
import os

mylist = []
mypath = '/home/development/Documents/debootcamp/mini_project1/downloadedfiles'
for filename in os.listdir(mypath):
    if filename != 'all_years.csv' and filename.endswith('.csv'):
        mylist.append(pd.read_csv((mypath + '/' + filename)))

resulting_frame = pd.concat(mylist, axis=0, ignore_index=True)
output_file = '/home/development/Documents/debootcamp/mini_project1/output_result/all_years.csv'
resulting_frame.to_csv(output_file)

