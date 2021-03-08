<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.user_internet" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<%-- <% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    user_internet cs=new user_internet();
    out.println("<new_user>");
  	out.println(cs.current_new_user());
  	out.println("</new_user>"); 
  	out.println("<new2_user>");
  	out.println(cs.yesterday_new_user());
  	out.println("</new2_user>"); 
  	out.println("<online_user>");
  	out.println(cs.current_online_user());
  	out.println("</online_user>");
  	out.println("<online_user2>");
  	out.println(cs.yesterday_online_user());
  	out.println("</online_user2>");
  	out.println("<user>");
  	out.println(cs.current_user());
  	out.println("</user>");
  	out.println("<user2>");
  	out.println(cs.yesterday_user());
  	out.println("</user2>");
  	out.println("<time>");
  	out.println(cs.current_user_time());
  	out.println("</time>");
  	out.println("<time2>");
  	out.println(cs.yesterday_user_time());
  	out.println("</time2>");
  	out.println("<traff>");
  	out.println(cs.current_user_traff());
  	out.println("</traff>");
  	out.println("<traff2>");
  	out.println(cs.yesterday_user_traff());
  	out.println("</traff2>");
%>   --%>
<div style="width:100%;height:100px">

<table width="100%" height="100px"  align="center" >
	<thead>
		<tr>
			<th width="20px"></th>
			<th width="20px">新用户</th>
			<th width="20px">在线用户</th>
			<th width="20px">没上线用户</th>
			<th width="20px">平均在线时间(/分钟)</th>
			<th width="20px">平均上网流量(/kb)</th>
		</tr>
	</thead>
	
	<tbody align="center">

<%    
		 user_internet cs=new user_internet();
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