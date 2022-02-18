from pylab import *
import numpy as np

#Reduction algorithm to SNF
def snf(B,m,n):
    if m>n:
        z = n
    else: 
        z = m
    # fs = ""
    # for a in arange(m):
    #     for b in arange(n):
    #         fs = fs + str(int(B[a,b])) + " "
    #     fs = fs + "\n"
    # fs = fs + "\n\n_________________________________________________\n\n"
    # with open("/Users/paula/Desktop/CTopo/HW5_4.txt", "wt") as outfile:
    #     outfile.write(fs)
    for i in arange(z):
        print(i)
        mlist = arange(i+1,m)
        nlist = arange(i+1,n)
        if B[i,i] == 1:
            for j in mlist:
                if B[j,i] == 1:
                    B[j,:] = (B[i,:] + B[j,:])%2
            for k in nlist:
                if B[i,k] == 1:
                    B[:,k] = (B[:,i] + B[:,k])%2
        if B[i,i] == 0:
            for j in mlist:
                if B[j,i] == 1:
                    temp = 0
                    for b in arange(n):
                        temp = B[i,b]
                        B[i,b] = B[j,b]
                        B[j,b] = temp
            for k in nlist:
                if B[i,k] == 1:
                    temp = 0
                    for a in arange(m):
                        temp = B[a,i]
                        B[a,i] = B[a,k]
                        B[a,k] = temp
            if B[i,i] == 1:
                for j in mlist:
                    if B[j,i] == 1:
                        B[j,:] = (B[i,:] + B[j,:])%2
                for k in nlist:
                    if B[i,k] == 1:
                        B[:,k] = (B[:,i] + B[:,k])%2
        # for a in arange(m):
        #     for b in arange(n):
        #         fs = fs + str(int(B[a,b])) + " "
        #     fs = fs + "\n"
        # fs = fs + "\n\n_________________________________________________\n\n"
        # with open("/Users/paula/Desktop/CTopo/HW5_4.txt", "wt") as outfile:
        #     outfile.write(fs)
    return B

#Function that takes a reduced matrix and returns a count variable
# so we can compute the Betti numbers ourselves!

def betti(B,m,n):
    count = 0
    if m>n:
        z = n
    else: 
        z = m
    for i in arange(z):
        if B[i,i] == 1:
            count += 1
    return count