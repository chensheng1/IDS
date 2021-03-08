<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.protocol_select" %>
<%@ page import="statistics.protocol_table" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String protocol="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
protocol=request.getParameter("pro");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
	response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    String first=firsttime;
	String last=lasttime;
	String pro=protocol;
    protocol_select cs = new protocol_select();
    out.println("<select_name>");
  	out.println(cs.protocol_name(first,last));
  	out.println("</select_name>"); 
  	out.println("<select_value>");
  	out.println(cs.sum(first,last));
  	out.println("</select_value>"); 
  	out.println("<select_date>");
  	out.println(cs.select_date(first,last,pro));
  	out.println("</select_date>");   
  	out.println("<select_out>");
  	out.println(cs.select_outgoing(first,last,pro));
  	out.println("</select_out>");       
  	out.println("<select_in>");
  	out.println(cs.select_incoming(first,last,pro));
  	out.println("</select_in>");           
%>  
<cs>
<div  style="width:100%;height:350px" align="center">

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
		 String pro1=protocol;
         protocol_table ss=new protocol_table();
         List<String> list1=ss.select_protocol(pro1);
         	for(int i=0;i<list1.size();i=i+3){
     %>
        <tr>
             <td width="20px"><%=list1.get(i)%></td>
             <td width="20px"><%=list1.get(i+1)%></td>
             <td width="20px"><%=list1.get(i+2)%></td>
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