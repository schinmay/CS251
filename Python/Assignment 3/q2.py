#!/usr/bin/python
import os
import sys
import numpy as np
import matplotlib.pyplot as plt
import math

#Step 1
mode = 'r'
filename = 'train.csv'
fo = open(filename, mode)
line=fo.readline()
n_train=10000
i=0
X_train=np.random.rand(n_train,1)
y_train=np.random.rand(n_train,1)
for line in fo:
	X_train[i],y_train[i]=line.split(",")
	i+=1
X_train=np.insert(X_train, 0, 1, axis=1)
fo.close()

#Step 2
w=np.random.rand(2,1)

#Step 3
plt.plot(X_train[:,1],y_train,'b.',label='Label vs Feature')
wt=w.transpose()
xt=X_train.transpose()
y=np.dot(wt,xt)
plt.plot(X_train[:,1],y.transpose(),'-r',label="w^T*x' vs x")
plt.legend()
plt.show()

#Step 4
X_train=np.matrix(X_train)
y_train=np.matrix(y_train)
w_direct=(np.linalg.inv(X_train.transpose() * X_train))*X_train.transpose()*y_train
plt.plot(X_train[:,1],y_train,'b.',label='Label vs Feature')
wt_direct=w_direct.transpose()
xt=X_train.transpose()
y=np.dot(wt_direct,xt)
plt.plot(X_train[:,1],y.transpose(),'-r',label="w_direct^T*x' vs x")
plt.legend()
plt.show()

#Step 5
for nepoch in range(1,2):
	for j in range(0,n_train-1):
		x=X_train.item((j,1))
		y=y_train.item((j,0))
		xt=X_train[j].transpose()
		eta=0.00000001
		w=w-(eta*(np.dot(w.transpose(),xt)-y)).item(0)*xt
		
		if j%1000==0:
			plt.plot(X_train[:,1],y_train,'b.',label='Label vs Feature')
			wt=w.transpose()
			xt=X_train.transpose()
			y=np.dot(wt,xt)
			plt.plot(X_train[:,1],y.transpose(),'-r',label="w^T*x' vs x")
			plt.legend()
			plt.show()

#Step 6
plt.plot(X_train[:,1],y_train,'b.',label='Label vs Feature')
wt=w.transpose()
xt=X_train.transpose()
y=np.dot(wt,xt)
plt.plot(X_train[:,1],y.transpose(),'-r',label="w^T*x' vs x")
plt.legend()
plt.show()

#Step 7
mode = 'r'
filename = 'test.csv'
fo = open(filename, mode)
line=fo.readline()
n_test=1000
i=0
X_test=np.random.rand(n_test,1)
y_test=np.random.rand(n_test,1)
for line in fo:
	X_test[i],y_test[i]=line.split(",")
	i+=1
	if i==n_test:
		break
X_test=np.insert(X_test, 0, 1, axis=1)
fo.close()

X_test=np.matrix(X_test)
y_test=np.matrix(y_test)

y_pred1=X_test*w
y_pred2=X_test*w_direct

se_w=0
for i in range(0,n_test-1):
	se_w+=(y_pred1[i] - y_test[i]) ** 2	

rmse_w=math.sqrt(se_w/n_test)
print "Root mean squared error for w is " + str(rmse_w)

se_w_direct=0
for i in range(0,n_test-1):
	se_w_direct+=(y_pred2[i] - y_test[i]) ** 2	

rmse_w_direct=math.sqrt(se_w_direct/n_test)
print "Root mean squared error for w_direct is " + str(rmse_w_direct)

exit(0)





