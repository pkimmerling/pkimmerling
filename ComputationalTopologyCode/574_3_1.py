from pylab import *
import numpy as np

#Code to make the vertices and triangles files into matrices
#Vertices
v = 1932
vertices = np.zeros((v,3))
vf = open("/Users/paula/Desktop/Paula's/vertices.txt","r")
my_list = vf.readlines()
vf.close()
for i in arange(1932):  
    line = my_list[i].rstrip('\n')
    line = my_list[i].lstrip()
    line = line.split()
    line = [float(e) for e in line]
    vertices[i,:] = line
print vertices
#Triangles
t = 3856
triangles = np.zeros((t,3))
tf = open("/Users/paula/Desktop/Paula's/triangles.txt","r")
my_second_list = tf.readlines()
tf.close()
for i in arange(t):  
    line = my_second_list[i].rstrip('\n')
    line = my_second_list[i].lstrip()
    line = line.split()
    line = [int(e) for e in line]
    triangles[i,:] = line
print triangles    

#Next item on the agenda is to figure out a list of edges...
edges = np.zeros(((3*t),2))
j = 0
# for i in arange(t):
#     edges[j,0] = triangles[i,0]
#     edges[j,1] = triangles[i,1]
#     j = j+1
#     edges[j,0] = triangles[i,1]
#     edges[j,1] = triangles[i,2]
#     j = j+1
#     edges[j,0] = triangles[i,2]
#     edges[j,1] = triangles[i,0]
#     j = j+1
# print edges 
# count_edges = np.zeros((3*t))
# for i in arange(3*t):
#     for j in arange(3*t):
#         if edges[i,0] == edges[j,1]:
#             if edges[i,1] == edges[j,0]:
#                 count_edges[i] = count_edges[i] + 1
#         elif edges[i,0] == edges[j,0]:
#             if edges[i,1] == edges[j,1]:
#                 count_edges[i] = count_edges[i] + 1
# # print count_edges
# # for i in arange(3*t):
# #     if count_edges[i] < 1:
# #         print "shit"
# doubles = 0
# singles = 0
# for i in arange(3*t):
#     if count_edges[i] == 1:
#         singles = singles + 1
#         #print edges[i,:]
#     elif count_edges[i] == 2:
#         doubles = doubles + 1
        
#Now we need to orient the triangles
triangles2 = np.zeros((t,5))
triangles2[:,:3] = triangles[:,:]
triangles2[:,3] = triangles[:,0]


# triangles2[0,4] = 1
# dt = np.zeros(5)
# d = 1
# while(d>0): #While we do not have conditions to leave the loop
#   d = 0  
#   for i in arange(t): #Loop through the triangles2 array
#     if triangles2[i,4] == 0: #If the marker is 0, we'll check this triangle
#       d += 1
#       for j in arange(t): #We need to check each row in triangles2 for shared edges.
#         if triangles2[j,4] == 1: #Check if such a triangle exists
#             if (triangles2[i,0:1] == triangles2[j,0:1]): #Check if they share the 1st edge in 1st pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1   #Flag it to know that we already oriented
#             elif (triangles2[i,1:2] == triangles2[j,0:1]): #Check if they share 1st edge in 2nd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1  #Flag it to know that we already oriented
#             elif (triangles2[i,2:3] == triangles2[j,0:1]):#Check if they share 1st edge in 3rd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1   #Flag it to know that we already oriented 
#             elif (triangles2[i,0:1] == triangles2[j,1:2]): #Check if they share 2nd edge in 1st pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1  #Flag it to know that we already oriented
#             elif (triangles2[i,1:2] == triangles2[j,1:2]):#Check if they share 2nd edge in 2nd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1   #Flag it to know that we already oriented        
#             elif (triangles2[i,2:3] == triangles2[j,1:2]): #Check if they share 2nd edge in 3rd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1  #Flag it to know that we already oriented
#             elif (triangles2[i,0:1] == triangles2[j,2:3]):#Check if they share 3rd edge in 1st pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1   #Flag it to know that we already oriented 
#             elif (triangles2[i,1:2] == triangles2[j,2:3]): #Check if they share 3rd edge in 2nd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1  #Flag it to know that we already oriented
#             elif (triangles2[i,2:3] == triangles2[j,2:3]):#Check if they share 3rd edge in 3rd pos
#                 dt[:] = triangles2[i,:]
#                 triangles2[i,0] = dt[2]
#                 triangles2[i,1] = dt[1]
#                 triangles2[i,2] = dt[0]
#                 triangles2[i,3] = dt[2]
#                 triangles2[i,4] += 1   #Flag it to know that we already oriented    
# print triangles2      
# for i in arange(t):
#     if triangles2[i,4] != 1:
#         print triangles2[i,:]

# vs = ""
# for i in arange(v):
#     vs = vs + str(i + 1) + " "
#     vs = vs + str(vertices[i,0]) + " "
#     vs = vs + str(vertices[i,1]) + " "
#     vs = vs + str(vertices[i,2]) + " "
#     vs = vs + "\n"
#     
# with open("hw3.node", "wt") as outfile:
#     outfile.write(vs)
    
ts = "3856 0\n"
for i in arange(t):
    ts = ts + str(i + 1) + " "
    ts = ts + str(int(triangles[i,0])) + " "
    ts = ts + str(int(triangles[i,1])) + " "
    ts = ts + str(int(triangles[i,2])) + " "
    ts = ts + "\n"
with open("hw3.face", "wt") as outfile:
    outfile.write(ts)