import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

a_data = np.genfromtxt('/Users/paula/Desktop/CTopo/Arizona_Edited.csv',delimiter=',')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(a_data[:,0],a_data[:,1],a_data[:,2])
plt.savefig("/Users/paula/Desktop/CTopo/Arizona.csv.png")
plt.show()

c_data = np.genfromtxt('/Users/paula/Desktop/CTopo/California_Edited.csv',delimiter=',')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(c_data[:,0],c_data[:,1],c_data[:,2])
plt.savefig("/Users/paula/Desktop/CTopo/California.csv.png")
plt.show()

n_data = np.genfromtxt('/Users/paula/Desktop/CTopo/NewMexico_Edited.csv',delimiter=',')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(n_data[:,0],n_data[:,1],n_data[:,2])
plt.savefig("/Users/paula/Desktop/CTopo/NewMexico.csv.png")
plt.show()

t_data = np.genfromtxt('/Users/paula/Desktop/CTopo/Texas_Edited.csv',delimiter=',')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(t_data[:,0],t_data[:,1],t_data[:,2])
plt.savefig("/Users/paula/Desktop/CTopo/Texas.csv.png")
plt.show()