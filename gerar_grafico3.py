import numpy as np
import pylab as py
import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np


#Abertura de arquivos

f= np.genfromtxt(fname='temp1.txt',delimiter=",")
print(f)
print(f[0])
print(f[1])

w_0=f[0]
w_f=f[1]


#f =open('temp1.txt','r')
#data = f.read()
#print(data)

#w_0f = f




#for line in f:
	#line = line.strip()
	#columns = line.split()	
	
	
	#limite_w=np.loadtxt(w_0f,unpack=True)

	#w_0=limite_w[0,:]
	#w_f=limite_w[1,:]
	
	#print(w_0)
	#print(w_f)
	#print('Hello World 1')
#f.read()



f = open('temp.txt', 'r')

specfile1 = f


for line in f:
	line = line.strip()
	columns = line.split()
		

	spec1=np.loadtxt(specfile1,unpack=True,skiprows=1)

	wavel1=spec1[0,:]
	fluxo1=spec1[1,:]

	wavelw=spec1[0,:]
	fluxow=spec1[2,:]
	
	print('Hello World 2')
	print(wavelw)
	print(fluxo1)
	print(fluxow)

#Plotagem dos spectros
	fig = plt.plot(figsize=(14,8))

	indice_x =np.where((wavel1> w_0) & (wavel1< w_f))
	print(indice_x)

	

	plt.plot(wavel1[indice_x],fluxo1[indice_x])
	plt.plot(wavelw[indice_x],fluxow[indice_x])



	plt.savefig("obj_temp.png")

f.read()	

