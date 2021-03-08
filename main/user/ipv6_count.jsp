<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.ipv6_count" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<div style="width:100%;height:100px">

<table width="100%" height="100px"  align="center" >
	<thead>
		<tr>
			<th width="20px">IPv6</th>
			<th width="20px">新用户</th>
			<th width="20px">在线用户</th>
			<th width="20px">没上线用户</th>
			<th width="20px">平均在线时间(/分钟)</th>
			<th width="20px">平均上网流量(/kb)</th>
		</tr>
	</thead>
	
	<tbody align="center">

<%    
		 ipv6_count cs=new ipv6_count();
     %>
     	<tr>
     		<td width="20px">今日</td>
     		 <td width="20px"><%=cs.current_new_user()%></td>
     		 <td width="20px"><%=cs.current_online_user()%></td>
     		 <td width="20px"><%=cs.current_user()%></td>
     		 <td width="20px"><%=cs.current_user_time()%></td>
     		 <td width="20px"><%=cs.current_user_traff()%></td>
     	</tr>
        <tr>
        	 <td width="20px">昨日</td>
             <td width="20px" ><%=cs.yesterday_new_user()%></td>
             <td width="20px" ><%=cs.yesterday_online_user()%></td>
             <td width="20px" ><%=cs.yesterday_user()%></td>
             <td width="20px" ><%=cs.yesterday_user_time()%></td>
             <td width="20px" ><%=cs.yesterday_user_traff()%></td>
     	</tr>
     	
       
	
</tbody>
</table>
</div>
</body>
</html>