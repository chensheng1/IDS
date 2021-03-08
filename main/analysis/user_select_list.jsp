<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="analysis.user_list" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<% 
String user="";
user=request.getParameter("user");
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
<h>用户名单情况表</h>
<table id="chen" width="50%" height="450px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
	<thead>
		<tr>
			<th width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;">用户IP</th>
		</tr>
	</thead>
	
	<tbody id="movies">


<%    	
         user_list cs =new user_list();
         List<String> list=cs.select_list(user);
         for(int i=0;i<list.size();i=i+1){
     %>
        <tr>
             <td width="50px" height="20px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:10px;"><%=list.get(i)%></td>
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