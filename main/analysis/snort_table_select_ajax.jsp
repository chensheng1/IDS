<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="analysis.snort_ip" %>
<%@ page import="java.util.*" %>
<%
String ip="";
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
<div style="width:100%;height:450px" align="center">
<p>用户异常</p>
<table id="chen" width="100%" height="450px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
	<thead>
		<tr>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">时间</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">异常类型</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">异常攻击</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">报警优先级</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">源IP</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">目标IP</th>
		</tr>
	</thead>
	
	<tbody id="movies">


<%    
         snort_ip ud=new snort_ip();
         List<String> list=ud.snort_select_user(ip);
         for(int i=0;i<list.size();i=i+6){
     %>
        <tr>
            <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+1)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+2)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+3)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+4)%></td>
              <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+5)%></td>
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
