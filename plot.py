import matplotlib
#matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from numpy import genfromtxt
my_data = genfromtxt('log.csv', delimiter=',')
rx1rx2 = my_data[:,1]
rx1rx3 = my_data[:,2]
rx1rx5 = my_data[:,3]

#data = np.loadtxt("1.txt", delimiter="\n")
#jesd = np.reshape(data,(-1,16))

plt.figure(1)
plt.plot(rx1rx2, label="Chan1-2 SOM A")
plt.plot(rx1rx3, label="Chan1-3 SOM A")
plt.plot(rx1rx5, label="Chan1 SOM A-B")

plt.legend()
plt.draw()
#plt.figure(2)

#plt.plot(jesd[:,0], label="SOM A 0")
#plt.plot(jesd[:,2], label="SOM A 1")
#plt.plot(jesd[:,4], label="SOM A 2")
#plt.plot(jesd[:,6], label="SOM A 3")
#plt.plot(jesd[:,8], label="SOM B 0")
#plt.plot(jesd[:,10], label="SOM B 1")
#plt.plot(jesd[:,12], label="SOM B 2")
#plt.plot(jesd[:,14], label="SOM B 3")

#plt.legend()
#plt.draw()
#plt.figure(3)

#plt.plot(jesd[:,1], label="SOM A 0")
#plt.plot(jesd[:,3], label="SOM A 1")
#plt.plot(jesd[:,5], label="SOM A 2")
#plt.plot(jesd[:,7], label="SOM A 3")
#plt.plot(jesd[:,9], label="SOM B 0")
#plt.plot(jesd[:,11], label="SOM B 1")
#plt.plot(jesd[:,13], label="SOM B 2")
#plt.plot(jesd[:,15], label="SOM B 3")
#plt.legend()
#plt.draw()
plt.show()

