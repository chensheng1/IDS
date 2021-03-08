#-*- coding: utf-8 -*-
#######   日志文件读取
#
'''@author: cs
日志文件的读取,读取log文件或读取log.gz文件'''
#
#######  2016-08-26

from pylab import *

mpl.rcParams['font.sans-serif'] = ['SimHei']
mpl.rcParams['axes.unicode_minus'] = False



import sys
import matplotlib.pyplot as plt
import numpy as np



###取得所有字段及其值
def getAllFieldValue(filename):
    fieldvalue=[]
    fr=open(filename)
    for line in fr.readlines():
        line=line.strip()
        listFromLine=line.split('\t')
        if listFromLine[0].find('#')==0:
            continue
        else:
            fieldvalue.append(listFromLine)
    return fieldvalue
	
	

###从文件中取得协议
pro=[]
values=getAllFieldValue('F:\\data\\2016-06-20\\conn.16_34_20-17_00_00.log')
for i in xrange(len(values)):
    pro.append(values[i][7])
	
	
###统计协议并存入字典中
dic={}
for item in pro:
    if item in dic.keys():
        dic[item]+=1
    else :
        dic[item]=1
dic.pop('-')
	
####第四步：作图

labels=dic.keys()
quants=dic.values()
			
###	plt.figure(1, figsize=(6,6))

colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral','coral','red']
explode = (0.2, 0, 0, 0.2,0,0)
plt.pie(quants, explode=explode, colors=colors, labels=labels,autopct='%1.1f%%',pctdistance=0.8, shadow=True, startangle=180)

plt.legend(loc='upper right',bbox_to_anchor=(1,1.1),ncol=1,fancybox=True,shadow=True)
plt.title(u"协议统计",bbox={'facecolor':'0.8', 'pad':5})

 
plt.axis('equal')
##plt.show()
plt.savefig('F:\\tomcat\\apache-tomcat-8.0.23\\webapps\\HubuTraff\\images\propie.png')

###标题的位子需要改动，图例大小需要改变！！！
