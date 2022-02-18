from pylab import *
#from mayavi import mlab
import numpy as np
#from scipy.spatial import Delaunay, Voronoi, voronoi_plot_2d
#from scipy.spatial import Delaunay, ConvexHull
#import matplotlib.pyplot as plt

v = 10
vertices = np.zeros((v,2))
vf = open("/Users/paula/Desktop/CTopo/hw4_4.txt","r")
my_list = vf.readlines()
vf.close()
for i in arange(v):  
    line = my_list[i].rstrip('\n')
    line = my_list[i].lstrip()
    line = line.split()
    line = [float(e) for e in line]
    vertices[i,:] = line

print vertices
# x = vertices[:,0]
# y = vertices[:,1]
# mlab.points3d(x,y,0)
# show()