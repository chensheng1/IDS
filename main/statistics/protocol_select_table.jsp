<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="statistics.protocol_table" %>
<%@ page import="java.util.*" %>
<%
String pro="";
pro=request.getParameter("protocol");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 

%>
<html lang="ch">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div style="width:100%;height:350px" align="center">


<table width="80%" height="300px" border="1" align="center" >
	<thead>
		<tr>
			<th width="20px">时间</th>
			<th width="20px">上行流量</th>
			<th width="20px">下行流量</th>
		</tr>
	</thead>
	
	<tbody id="sum">

<%    
		 String protocol=pro;
         protocol_table cs=new protocol_table();
         List<String> list=cs.select_protocol(protocol);
         	for(int i=0;i<list.size();i=i+3){
     %>
        <tr>
             <td width="20px"><%=list.get(i)%></td>
             <td width="20px"><%=list.get(i+1)%></td>
             <td width="20px"><%=list.get(i+2)%></td>
     	</tr>
     	 <%
          }
       %>
       
	
</tbody>
</table>
</div>
</body>
</html>