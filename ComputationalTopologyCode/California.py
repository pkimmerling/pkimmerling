import numpy as np
import sklearn
import kmapper as km

data = np.genfromtxt('/Users/paula/Desktop/CTopo/California_Edited.csv',delimiter=',')

mapper = km.KeplerMapper(verbose=2)

lens = mapper.fit_transform(data,[1])

graph = mapper.map(lens,
                   data,
                   sklearn.cluster.AgglomerativeClustering(3),
                   coverer=km.Cover(nr_cubes=15, overlap_perc=0.2))
                   
mapper.visualize(graph,custom_tooltips = data[:,0],
                path_html="California_keplermapper_output.html")
                
#print(graph["nodes"])