#_*_coding:utf-8 _*_
#######   日志文件读取
#
'''@author: lucas
日志文件的读取,读取log文件或读取log.gz文件'''
#
#######  2016-01-21

import operator
from os import listdir
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import time


def getAllFieldValue(filename):
    '''
    读取log文件中所有字段值到二维列表。
    @param:
        filename:str,log文件的完整路径
    @return:
        list，二维列表
    '''
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
    
def getFieldName(filename):
    '''
        读取log文件中所有字段名。
        @param:
            filename:str,log文件的完整路径
        @return:
            list，字段名列表
    '''    
    fieldnamelist=[]
    fr=open(filename)
    for line in fr.readlines():
        line=line.strip()
        listFromLine=line.split('\t')
        if listFromLine[0]=='#fields':
            fieldnamelist=listFromLine[1:]
    return fieldnamelist
    
           
def getField(filename,fieldname):
    '''
        获得某个字段的所有值和userID对应的字典
        @param :
            filename:str,log文件的完整路径
            fieldname:str,log日志中的字段名
        @return:
            dict，字段与userID（key）组成的字典
    '''    
    fieldNameIndex=0
    try:
        fieldNameIndex=getFieldName(filename).index(fieldname)
    except ValueError:
        print "字段名不存在"
      #  print getFieldName(filename)
    fieldvalue=getAllFieldValue(filename)
    fv={}
    for i in range(len(fieldvalue)):
        fv[fieldvalue[i][1]]=fieldvalue[i][fieldNameIndex]
    return fv

def pandas_chunks(filename,chunk_size):
    '''
        通过pandas模块，分块读取日志压缩文件。
        @param :
            filename:str,log文件的完整路径
            chunk_size:long,分块的大小
        @return:
            dataframe,文件dataframe列表
    '''     
    chunks = pd.read_csv(filename,compression='gzip',sep='\t',skiprows=[0,1,2,3,4,5,6,7],header=None,
    na_filter=False,low_memory=False,chunksize=chunk_size)
    reader=chunk_fun()
    loop = True
    chunkSize = 100000
    chunks = []
    while loop:
        try:
            chunk = reader.get_chunk(chunkSize)
            chunks.append(chunk)
        except StopIteration:
            loop = False
            print "Iteration is stopped."
    df = pd.concat(chunks,ignore_index=True)    
    return df

def pandas_normal(filename):
    '''
        通过pandas模块，读取日志文件。
        @param :
            filename:str,log文件的完整路径
        @return:
            dataframe,文件dataframe列表
    '''   
    df = pd.read_csv(filename,sep='\t',skiprows=[0,1,2,3,4,5,6,7],header=None,
    na_filter=False,low_memory=False)
    return df     


def main():
    print 'this module run itself'
    print pandas_chunks.__doc__
if __name__=='__main__':
    main()