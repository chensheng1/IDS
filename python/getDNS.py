#coding:gbk
import urllib
import sys
import time
def getDNS():
    ip=sys.argv[1]
    ip=str(ip)
    url="http://site.ip138.com/"+ip+"/"
    page = urllib.urlopen(url)
    html = page.read()    
    html=html.decode('utf-8').encode('gbk')
    if html.find('暂无结果')!=-1:
        return 'no domain found'
    body_html=html[html.find('<body>'):]
    content_html=body_html[body_html.find('<li class="title">'):]
    result_dns=content_html[content_html.find('a href="/')+len('a href="/'):content_html.find('/" target')]
    return result_dns
if __name__=="__main__":
    print getDNS()