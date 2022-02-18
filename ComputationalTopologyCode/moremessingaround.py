from pylab import *
from mayavi import mlab
import numpy as np
from scipy.spatial import Delaunay, Voronoi, voronoi_plot_2d, ConvexHull
import matplotlib.pyplot as plt


v = 18
vertices = np.zeros((v,3))
vf = open("/Users/paula/Desktop/CTopo/hw4_5.txt","r")
my_list = vf.readlines()
vf.close()
for i in arange(v):  
    line = my_list[i].rstrip('\n')
    line = my_list[i].lstrip()
    line = line.split()
    line = [float(e) for e in line]
    vertices[i,:] = line

# print vertices
# x = vertices[:,0]
# y = vertices[:,1]
# z = vertices[:,2]
# mlab.points3d(x,y,z)
# show()

tet = Delaunay(vertices).simplices
# print Del.simplices

l = len(Del.simplices)
edges = np.zeros(((4*l),7))
j = 0
for i in arange(l):     #GET THE EDGES
    edges[j,0] = Del.simplices[i,0]
    edges[j,1] = Del.simplices[i,1]
    edges[j,2] = i
    j = j+1
    edges[j,0] = Del.simplices[i,1]
    edges[j,1] = Del.simplices[i,2]
    edges[j,2] = i
    j = j+1
    edges[j,0] = Del.simplices[i,2]
    edges[j,1] = Del.simplices[i,3]
    edges[j,2] = i
    j = j+1
    edges[j,0] = Del.simplices[i,3]
    edges[j,1] = Del.simplices[i,0]
    edges[j,2] = i
    j = j+1
#print edges

# count_edges = np.zeros((4*l))
# for i in arange(4*l):
#     for j in arange(3*t):
#         if edges[i,0] == edges[j,1]:
#             if edges[i,1] == edges[j,0]:
#                 count_edges[i] = count_edges[i] + 1
#         elif edges[i,0] == edges[j,0]:
#             if edges[i,1] == edges[j,1]:
#                 count_edges[i] = count_edges[i] + 1
# print count_edges

dummy = 0
for i in arange((4*l)):     #GET THE LENGTHS OF THE EDGES
    dummy = np.sqrt((vertices[int(edges[i,0]),0]-vertices[int(edges[i,1]),0])**2 + (vertices[int(edges[i,0]),1]-vertices[int(edges[i,1]),1])**2 + (vertices[int(edges[i,0]),2]-vertices[int(edges[i,1]),2])**2)
    edges[i,3] = dummy
#print edges

d1 = 1
d2 = np.sqrt(2)
d3 = np.sqrt(3)

tetra1 = np.zeros(58)
tetra2 = np.zeros(58)
tetra3 = np.zeros(58)
lst = arange(232)
#CHECK TO SEE IF EDGES WITHIN EACH TETRAHEDRA ARE LESS THAN OR EQUAL TO d1,d2,d3
for i in lst[::4]:
    a = int(edges[i,2])
    if edges[i,3]<=d1:
        if edges[i+1,3]<=d1:
            if edges[i+2,3]<=d1:
                if edges[i+3,3]<=d1:
                    if (tetra1[a] == 0):
                        tetra1[a] +=1               
print tetra1

for i in lst[::4]:
    a = int(edges[i,2])
    if edges[i,3]<=d2:
        if edges[i+1,3]<=d2:
            if edges[i+2,3]<=d2:
                if edges[i+3,3]<=d2:
                    if (tetra2[a] == 0):
                        tetra2[a] +=1
print tetra2

for i in lst[::4]:
    a = int(edges[i,2])
    if edges[i,3]<=d3:
        if edges[i+1,3]<=d3:
            if edges[i+2,3]<=d3:
                if edges[i+3,3]<=d3:
                    if (tetra3[a] == 0):
                        tetra3[a] +=1
print tetra3

sim1 = np.zeros((23,4))
j = 0
for i in arange(l):
    if tetra1[i] == 1:
        sim1[j] = tet[i,:]
        j += 1
    
#FILE PROCESSING

ts = "23 4 0\n"
for i in arange(23):
    ts = ts + str(i + 1) + " "
    ts = ts + str(int(sim1[i,0])+1) + " "
    ts = ts + str(int(sim1[i,1])+1) + " "
    ts = ts + str(int(sim1[i,2])+1) + " "
    ts = ts + str(int(sim1[i,3])+1) + " "
    ts = ts + "\n"
with open("/Users/paula/Desktop/CTopo/hw4_5_1.ele", "wt") as outfile:
    outfile.write(ts)
  
# fs = "12 0\n"
# for i in arange(12):
#     fs = fs + str(i + 1) + " "
#     fs = fs + str(int(hull.simplices[i,0])) + " "
#     fs = fs + str(int(hull.simplices[i,1])) + " "
#     fs = fs + str(int(hull.simplices[i,2])) + " "
#     fs = fs + "\n"
# with open("/Users/paula/Desktop/CTopo/hw4_5.face", "wt") as outfile:
#     outfile.write(fs)

ns = "18 3 0 0\n"
for i in arange(18):
    ns = ns + str(i + 1) + " "
    ns = ns + str((vertices[i,0])) + " "
    ns = ns + str((vertices[i,1])) + " "
    ns = ns + str((vertices[i,2])) + " "
    ns = ns + "\n"
with open("/Users/paula/Desktop/CTopo/hw4_5_1.node", "wt") as outfile:
    outfile.write(ns)