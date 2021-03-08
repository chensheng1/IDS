#!usr/bin/env python
#coding:cp936
'''
@version:$1.0$

@author: Shi Zhikai

@copyright:hubu1411

Create Date:2017-03-07

文件名信息
'''
def get_name_list(log_file_pre):
    '''
    @param log_file_pre:log 文件前缀，conn，http等
    @return:完整文件名列表(:分割)
    '''
    full_name_list=[]
    time_list=['00','01','02','03','04','05','06','07','08','09',
    '10','11','12','13','14','15','16','17','18','19','20','21','22','23','00']
    for i in xrange(24):
        full_name_list.append(log_file_pre+'.'+time_list[i]+':00:00-'+time_list[i+1]+':00:00.log.gz')
    return full_name_list
def get_name_list2(log_file_pre):
    '''
    @param log_file_pre:log 文件前缀，conn，http等
    @return:完整文件名列表(_分割)
    '''
    full_name_list=[]
    time_list=['00','01','02','03','04','05','06','07','08','09',
    '10','11','12','13','14','15','16','17','18','19','20','21','22','23','00']
    for i in xrange(24):
        full_name_list.append(log_file_pre+'.'+time_list[i]+'_00_00-'+time_list[i+1]+'_00_00.log.gz')
    return full_name_list


def run_function():
    '''
    运行函数，实现模块功能
    '''
    pass  
def test():
    '''
    test function
    '''
    pass

if __name__=='__main__':
    test()
