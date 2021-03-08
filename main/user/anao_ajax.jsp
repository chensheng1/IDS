<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="user.abnormal" %>
<%@ page import="java.util.*" %>
<%
String starttime="";
String endtime="";
String ip="";
starttime=request.getParameter("start");
endtime=request.getParameter("end");
ip=request.getParameter("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ch">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
    <title>Title</title>
    
	<style type="text/css">  
	.sort_able{cursor:pointer;padding:0 28px;background:url(small.gif) no-repeat right center;}
	.sort_asc{background:url(asc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}
	.sort_desc{background:url(desc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}	 
	</style>
</head>
<body>
<cs>
<div style="width:100%;height:350px" align="center">
<p>本时间段用户异常</p>
<table id="chen" width="100%" height="350px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
	<thead>
		<tr>
			<th width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">开始时间</th>
			<th width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">结束时间</th>
			<th width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">源端口</th>
			<th width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">目标IP</th>
			<th width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">目标端口</th>
			<th width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">异常原因</th>
			<th width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">异常次数</th>
		</tr>
	</thead>
	
	<tbody id="movies">


<%    
         abnormal ud=new abnormal();
         List<String> list=ud.anom(starttime,endtime,ip);
         for(int i=0;i<list.size();i=i+7){
     %>
        <tr>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i)%></td>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+1)%></td>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+2)%></td>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+3)%></td>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+4)%></td>
             <td width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+5)%></td>
              <td width="150px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i+6)%></td>
     	</tr>
      <%
          }
       %>

</tbody>
</table>
</div>
</cs>
</body>
</html>
