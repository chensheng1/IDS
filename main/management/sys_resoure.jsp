<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="management.sys_file" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/jPages.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jPages.js"></script>
    
    <script type="text/javascript" src="sorttable.js"></script>
    
	<style type="text/css">  
	.sort_able{cursor:pointer;padding:0 28px;background:url(small.gif) no-repeat right center;}
	.sort_asc{background:url(asc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}
	.sort_desc{background:url(desc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}
	</style>
	
</head>

<body>
<div style="width:100%;height:150px ;"align="center" >

<table width="80%" height="100px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
		<tr>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">硬盘</th>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><span class="sort_able">可用空间</th>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><span class="sort_able">已用空间</th>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><span class="sort_able">总容量</th>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><span class="sort_able">日志文件</th>
			<th width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><span class="sort_able">使用率</th>
		</tr>

<%    
        sys_file cs =new sys_file();
         List<String> list=cs.doubleFormat(0);
         for(int i=0;i<list.size();i=i+6){
     %>
        <tr>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i)%></td>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i+2)%></td>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i+1)%></td>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i+3)%></td>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i+4)%></td>
             <td width="200px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;text-align:center;font-size:15px;"><%=list.get(i+5)%></td>
     	</tr>
      <%
          }
       %>

</table>
</div>
</html>