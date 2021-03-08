#coding:utf-8
#!usr/bin/env python
'''
@author:lucas 1273085613@qq.com
@description:mysql数据库连接配置文件
@create date:2017/03/09

'''
import MySQLdb
import pandas

def get_connected_db():
    '''
    创建并返回一个有用连接
    '''
    db = MySQLdb.connect(host='127.0.0.1',
          port=3306,
          user='root',
          passwd='*fiber123',
          db='hubutraff',)
    return db
def get_pattern():
    return '10\.185\.'
def filter_ip_df(df,n):
    pattern=get_pattern()
    df=df[df.iloc[:,n].str.match(pattern)]
    return df
if __name__=="__main__":
    print 'this module run itself!!'