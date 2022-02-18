from pylab import *
import numpy as np
from SNF import *

v = 1932
e = 3*3856
f = 3856

vertices = np.zeros((v,1))
edges = np.zeros((e,2))
faces = np.zeros((f,3))

D1 = np.zeros((v,e))
D2 = np.zeros((e,f))

#Filling in the vertices array
for i in arange(v):
    vertices[i,0] = i+1

#Filling in the faces array from file
ff = open("/Users/paula/Desktop/CTopo/triangles.txt","r")
my_list = ff.readlines()
ff.close()

for i in arange(f):  
    line = my_list[i].rstrip('\n')
    line = my_list[i].lstrip()
    line = line.split()
    line = [float(j) for j in line]
    faces[i,:] = line
#print faces

#Using faces array to make the edges array
j = 0
for i in arange(f):     #GET THE EDGES
    edges[j,0] = faces[i,0]
    edges[j,1] = faces[i,1]
    j = j+1
    edges[j,0] = faces[i,1]
    edges[j,1] = faces[i,2]
    j = j+1
    edges[j,0] = faces[i,2]
    edges[j,1] = faces[i,0]
    j = j+1
temp = 0
for i in arange(3*f):
    if edges[i,0]>edges[i,1]:
        temp = edges[i,0]
        edges[i,0] = edges[i,1]
        edges[i,1] = temp

new_edges = np.unique(edges,axis=0) ### The number of unique edges
v = 1932
e = 5784
f = 3856

#Fill in D1
# for i in arange(v):
#     for j in arange(e):
#         if (vertices[i,0] == new_edges[j,0]) or (vertices[i,0] == new_edges[j,1]):
#             D1[i,j] = 1
#Fill in D2
for i in arange(e):
    for j in arange(f):
        if (new_edges[i,0] == faces[j,0]) or (new_edges[i,0] == faces[j,1]) or (new_edges[i,0] == faces[j,2]):
            if (new_edges[i,1] == faces[j,0]) or (new_edges[i,1] == faces[j,1]) or (new_edges[i,1] == faces[j,2]):
                D2[i,j] = 1
#reduced_D1 = snf(D1,v,e)
#count1 = betti(reduced_D1,v,e)
reduced_D2 = snf(D2,e,f)
count2 = betti(reduced_D2,e,f)

#print ('count1 =',count1)
print (count2)