import numpy as np

import matplotlib.pyplot as plt

plt.figure(1) # ����ͼ��1

plt.figure(2) # ����ͼ��2

ax1 = plt.subplot(211) # ��ͼ��2�д�����ͼ1

ax2 = plt.subplot(212) # ��ͼ��2�д�����ͼ2

x = np.linspace(0, 3, 100)

for i in xrange(5):

    plt.figure(1)  #? # ѡ��ͼ��1

    plt.plot(x, np.exp(i*x/3))

    plt.sca(ax1)   #? # ѡ��ͼ��2����ͼ1

    plt.plot(x, np.sin(i*x))

    plt.sca(ax2)  # ѡ��ͼ��2����ͼ2

    plt.plot(x, np.cos(i*x))

plt.show()
