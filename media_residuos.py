import numpy as np
import matplotlib.pyplot as plt

data=[]

f = open('temp.txt', 'r')
header1 = f.readline() # ignora primeira linha
for line in f:
    line = line.strip()
    #print(repr(line))
    columns = line.split()
    data.append(float(columns[7])) # pega apenas linha de residuos
f.read()

residuals=np.array(data)
residuals.mean()
media = residuals.mean()

print(media)




