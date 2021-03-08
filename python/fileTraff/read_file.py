#_*_coding:cp936 _*_
#######   ��־�ļ���ȡ
#
'''@author: lucas
��־�ļ��Ķ�ȡ,��ȡlog�ļ����ȡlog.gz�ļ�'''
#
#######  2016-01-21

import operator
from os import listdir
import pandas as pd
import numpy as np
import time
import gzip


def getAllFieldValue(filename):
    '''
    ��ȡlog�ļ��������ֶ�ֵ����ά�б�
    @param:
        filename:str,log�ļ�������·��
    @return:
        list����ά�б�
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
        ��ȡlog�ļ��������ֶ�����
        @param:
            filename:str,log�ļ�������·��
        @return:
            list���ֶ����б�
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
        ���ĳ���ֶε�����ֵ��userID��Ӧ���ֵ�
        @param :
            filename:str,log�ļ�������·��
            fieldname:str,log��־�е��ֶ���
        @return:
            dict���ֶ���userID��key����ɵ��ֵ�
    '''    
    fieldNameIndex=0
    try:
        fieldNameIndex=getFieldName(filename).index(fieldname)
    except ValueError:
        print "�ֶ���������"
      #  print getFieldName(filename)
    fieldvalue=getAllFieldValue(filename)
    fv={}
    for i in range(len(fieldvalue)):
        fv[fieldvalue[i][1]]=fieldvalue[i][fieldNameIndex]
    return fv

def pandas_chunks(filename,chunk_size=100000):
    '''
        ͨ��pandasģ�飬�ֿ��ȡ��־ѹ���ļ���
        @param :
            filename:str,log�ļ�������·��
            chunk_size:long,�ֿ�Ĵ�С
        @return:
            dataframe,�ļ�dataframe�б�
    '''     
    chunks = pd.read_csv(filename,compression='gzip',sep='\t',skiprows=[0,1,2,3,4,5,6,7],header=None,
    na_filter=False,low_memory=False,chunksize=chunk_size)
    reader=chunk_fun()
    loop = True
    #chunkSize = 100000
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
        ͨ��pandasģ�飬��ȡ��־�ļ���
        @param :
            filename:str,log�ļ�������·��
        @return:
            dataframe,�ļ�dataframe�б�
    ''' 
    skip_list=['-','#']  
    df = pd.read_csv(filename,sep='\t',skiprows=[0,1,2,3,4,5,6,7],header=None,
    na_filter=True,na_values=skip_list,low_memory=False)
    return df
def pandas_csv(filename):
    '''
        ͨ��pandasģ�飬��ȡcsv�ļ���
        @param :
            filename:str,log�ļ�������·��
        @return:
            dataframe,�ļ�dataframe�б�
    ''' 
    df = pd.read_csv(filename,sep=',',skiprows=[0],header=None)
    return df
    
def pandas_normal_gz(filename):
    '''
        ͨ��pandasģ�飬��ȡѹ����־�ļ����ٶ�һ�㣬engineΪpython
        @param filename: str,logѹ���ļ�����·��
        @return:datafrme,�ļ�dataframe�б�
    '''
    skip_list=['-','#']  
    df = pd.read_csv(filename,compression='gzip',sep='\t',skipfooter=1,na_filter=True,na_values=skip_list,
    skiprows=[0,1,2,3,4,5,6,7],header=None,engine='python')
    return df 
def pandas_fast_gz(filename):
    '''
        ͨ��pandasģ�飬��ȡѹ����־�ļ�,�ٶȽϿ죬engineΪc
        @param filename: str,logѹ���ļ�����·��
        @return:datafrme,�ļ�dataframe�б����һ��Ϊ��Ч���ݣ�
    '''
    skip_list=['-','#']  
    df = pd.read_csv(filename,compression='gzip',sep='\t',skiprows=[0,1,2,3,4,5,6,7],header=None,low_memory=False)
    return df
   
def getAllFieldValue_zip(filename):
    '''
        ��ȡgz��ʽ��ѹ���ļ�
        @param filename:�����ļ�·�����ļ���
        @return:list ��ά�б�
    '''
    with gzip.open(filename, 'rb') as f:
        file_content = f.read()    
    return file_content
    
def main():
    print 'this module run itself'
    print __doc__
if __name__=='__main__':
    main()
