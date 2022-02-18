from pylab import *
#from mayavi import mlab
import numpy as np
from scipy.spatial import Delaunay, Voronoi, voronoi_plot_2d
#from scipy.spatial import Delaunay, ConvexHull
import matplotlib.pyplot as plt


v=8
vertices = np.zeros((v,2))
vertices[0,:] = [0.5,0]
vertices[1,:] = [0.1,1.6]
vertices[2,:] = [1.2,1.5]
vertices[3,:] = [-1.1,1.4]
vertices[4,:] = [-1.1,-1.3]
vertices[5,:] = [-0.2,-1.4]
vertices[6,:] = [-0.5,0]
vertices[7,:] = [1.2,-1.2]
print vertices

vor = Voronoi(vertices, furthest_site=False)
vor1 = Voronoi(vertices, furthest_site=True)
Del = Delaunay(vertices)
Del1 = Delaunay(vertices, furthest_site = True)
#plt.triplot(vertices[:,0], vertices[:,1], Del.simplices)
plt.triplot(vertices[:,0], vertices[:,1], Del1.simplices)
#voronoi_plot_2d(vor)
voronoi_plot_2d(vor1)
show()
