#coding:utf-8
#!usr/bin/env python
'''
@author:lucas 1273085613@qq.com
@description:mysql数据库执行操作函数
@create date:2017/04/12

'''
import db_config
import pandas as pd
def execute_no_result(sql_string):
    '''
    执行无返回值sql
    '''
    db=db_config.get_connected_db()
    cursor=db.cursor()
    try:
        # 执行sql语句
        cursor.execute(sql_string)
        #results=cursor.fetchall()
        #print results
        # 提交到数据库执行
        db.commit()
    except:
        # Rollback in case there is any error
        db.rollback()
    # 关闭数据库连接
    db.close()

def execute_result(sql_string):
    '''
    执行sql并返回查询结果
    '''
    db=db_config.get_connected_db()
    cursor=db.cursor()
    results=''
    try:
        # 执行sql语句
        cursor.execute(sql_string)
        results=cursor.fetchall()
        #print results
        # 提交到数据库执行
        db.commit()
    except:
        # Rollback in case there is any error
        #return 'error'
        db.rollback()
    # 关闭数据库连接db
    db.close()
    return results
def get_sql_string(operation,tablename,):
    pass
def db_to_df(table_name,where,*table_field):
    '''
    @param db_name:数据库表名
    @param *table_field:字段名
    @return:相同结构的pd.dataframe
    @param where:string,制约条件
    '''
    #获取参数相关信息
    field_num=len(table_field)
    field_index=[i for i in xrange(field_num)]
    #根据参数生成sql语句
    sql="select "
    for field in table_field:
        sql=sql+field+','
    sql=sql[:-1]+" from "+table_name+' '+where
    #执行查询,获得结果
    sql_result=execute_result(sql)
    #将结果导入df，并返回
    np_list=[]
    for i in sql_result:
        _inner_list=[]
        for ii in i:
            _inner_list.append(ii)
        np_list.append(_inner_list)
    df=pd.DataFrame(np_list,columns=list(table_field))
    return df
def df_to_db(df,table_name,*table_field):
    '''
    @param df:待写入的df
    @param db_name:数据库表名
    @param *table_field:字段名,需要和df中字段名一一对应
    '''
    sql="insert into "+table_name+"("
    for i in table_field:
        sql=sql+i+','
    sql=sql[:-1]+") values"
    print sql
    return 
    for _index in df.index:
        for _columns in table_field:
             sql2=sql2+"('%s','%s','%s',%d)," %(time_data,_user,_webhost,_duration)
    sql1=sql1[:-1]
    db_base.execute_no_result(sql1)#批量插入

def df_to_update(table_name):
	sql1="select datediff(now(),date) from " +table_name +" ORDER BY date desc limit 1"
	sql1_result=execute_result(sql1)
	for i in sql1_result:
		time=str(i[0])
		sql="UPDATE "+table_name+" SET  date = DATE_ADD(date,INTERVAL "+ time +" DAY) ;"
		execute_no_result(sql)
		
if __name__=='__main__':
	print 'this module run itself'
	table=['anomaly_ip','file_download_analysis','file_type','main','my_app','my_device_test','origip','protocol','user_app','user_traff','user_web','video_flow_bytes','user_traff_ipv6']
	for i in table:
		df_to_update(i)
	print 'end'