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

# Arizona 
gpsTrack1 = open("/Users/paula/Desktop/CTopo/allfourstates/AZ-Table 1.csv", "r")
csvReader1 = csv.reader(gpsTrack1)
header = csvReader1.next()
msnIndex = header.index("MSN")
yrIndex = header.index("Year")
dtIndex = header.index("Data")
stateList = []
for row in csvReader1:
    msn = row[msnIndex]
    year = row[yrIndex]
    data = row[dtIndex]
    stateList.append([msn,year,data])
for i in range(len(stateList)):
    for j in range(len(codesList)):
        if stateList[i][0] == codesList[j][0]:
            stateList[i][0] = codesList[j][1]
with open("/Users/paula/Desktop/CTopo/Arizona_Edited.csv", 'w') as myfile:
    wr = csv.writer(myfile)
    for i in range(len(stateList)):
        wr.writerow(stateList[i])
        
# California
gpsTrack2 = open("/Users/paula/Desktop/CTopo/allfourstates/CA-Table 1.csv", "r")
csvReader2 = csv.reader(gpsTrack2)
header = csvReader2.next()
msnIndex = header.index("MSN")
yrIndex = header.index("Year")
dtIndex = header.index("Data")
stateList = []
for row in csvReader2:
    msn = row[msnIndex]
    year = row[yrIndex]
    data = row[dtIndex]
    stateList.append([msn,year,data])
for i in range(len(stateList)):
    for j in range(len(codesList)):
        if stateList[i][0] == codesList[j][0]:
            stateList[i][0] = codesList[j][1]
with open("/Users/paula/Desktop/CTopo/California_Edited.csv", 'w') as myfile:
    wr = csv.writer(myfile)
    for i in range(len(stateList)):
        wr.writerow(stateList[i])

# New Mexico
gpsTrack3 = open("/Users/paula/Desktop/CTopo/allfourstates/NM-Table 1.csv", "r")
csvReader3 = csv.reader(gpsTrack3)
header = csvReader3.next()
msnIndex = header.index("MSN")
yrIndex = header.index("Year")
dtIndex = header.index("Data")
stateList = []
for row in csvReader3:
    msn = row[msnIndex]
    year = row[yrIndex]
    data = row[dtIndex]
    stateList.append([msn,year,data])
for i in range(len(stateList)):
    for j in range(len(codesList)):
        if stateList[i][0] == codesList[j][0]:
            stateList[i][0] = codesList[j][1]
with open("/Users/paula/Desktop/CTopo/NewMexico_Edited.csv", 'w') as myfile:
    wr = csv.writer(myfile)
    for i in range(len(stateList)):
        wr.writerow(stateList[i])

#Texas
gpsTrack4 = open("/Users/paula/Desktop/CTopo/allfourstates/TX-Table 1.csv", "r")
csvReader4 = csv.reader(gpsTrack4)
header = csvReader4.next()
msnIndex = header.index("MSN")
yrIndex = header.index("Year")
dtIndex = header.index("Data")
stateList = []
for row in csvReader4:
    msn = row[msnIndex]
    year = row[yrIndex]
    data = row[dtIndex]
    stateList.append([msn,year,data])
for i in range(len(stateList)):
    for j in range(len(codesList)):
        if stateList[i][0] == codesList[j][0]:
            stateList[i][0] = codesList[j][1]
with open("/Users/paula/Desktop/CTopo/Texas_Edited.csv", 'w') as myfile:
    wr = csv.writer(myfile)
    for i in range(len(stateList)):
        wr.writerow(stateList[i])
