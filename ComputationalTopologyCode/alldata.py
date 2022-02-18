from pylab import *
import numpy as np
import csv

# Code List -- Same for all states
gpsTrack = open("/Users/paula/Desktop/CTopo/msncodes_table_2.csv", "r")
csvReader = csv.reader(gpsTrack)
header = csvReader.next()
varIndex = header.index("Variable")
inIndex = header.index("Index")
codesList = []
for row in csvReader:
    var = row[varIndex]
    ind = row[inIndex]
    codesList.append([var,ind])
# State List
stateList = [['AZ','1'],['CA','2'],['NM','3'],['TX','4']]
# Data List
gpsTrack1 = open("/Users/paula/Desktop/CTopo/Copy-Table2.csv", "r")
csvReader1 = csv.reader(gpsTrack1)
header = csvReader1.next()
msnIndex = header.index("MSN")
stateIndex = header.index("StateCode")
yearIndex = header.index("Year")
dataIndex = header.index("Data")
dataList = []
for row in csvReader1:
    msn = row[msnIndex]
    state = row[stateIndex]
    year = row[yearIndex]
    data = row[dataIndex]
    if data != '0':
        dataList.append([msn,state,year,data])
    
for i in range(len(dataList)):
    for j in range(len(codesList)):
        if dataList[i][0] == codesList[j][0]:
            dataList[i][0] = codesList[j][1]
for i in range(len(dataList)):
    for j in range(len(stateList)):
        if dataList[i][1] == stateList[j][0]:
            dataList[i][1] = stateList[j][1]
with open("/Users/paula/Desktop/CTopo/All_Data_Edited.csv", 'w') as myfile:
    wr = csv.writer(myfile)
    for i in range(len(dataList)):
        wr.writerow(dataList[i])