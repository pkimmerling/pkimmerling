from pylab import *
import numpy as np
from SNF import *

#Initializations
v = 9
e = 27
f = 18
j = 0

vertices = np.zeros((v,1))
edges = np.zeros((e,2))
faces = np.zeros((f,3))

D1 = np.zeros((9,27))
D2 = np.zeros((27,18))

#Filling in the vertices array
for i in arange(v):
    vertices[i,0] = i+1
    
#Filling in the edges array from file
ef = open("/Users/paula/Desktop/CTopo/HW5_4edges.txt","r")
my_list1 = ef.readlines()
ef.close()

for i in arange(e):  
    line = my_list1[i].rstrip('\n')
    line = my_list1[i].lstrip()
    line = line.split()
    line = [float(k) for k in line]
    edges[i,:] = line
#print edges

#Filling in the faces array from file
ff = open("/Users/paula/Desktop/CTopo/HW5_4faces.txt","r")
my_list = ff.readlines()
ff.close()

for i in arange(f):  
    line = my_list[i].rstrip('\n')
    line = my_list[i].lstrip()
    line = line.split()
    line = [float(j) for j in line]
    faces[i,:] = line
#print faces

v = 9
e = 27
f = 18

#Fill in D1
for i in arange(9):
    for j in arange(27):
        if (vertices[i,0] == edges[j,0]) or (vertices[i,0] == edges[j,1]):
            D1[i,j] = 1
#Fill in D2
for i in arange(27):
    for j in arange(18):
        if (edges[i,0] == faces[j,0]) or (edges[i,0] == faces[j,1]) or (edges[i,0] == faces[j,2]):
            D2[i,j] = 1
reduced_D1 = snf(D1,v,e)
count1 = betti(reduced_D1,v,e)
reduced_D2 = snf(D2,e,f)
count2 = betti(reduced_D2,e,f)

print count1
print count2