<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.protocol" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    protocol cs=new protocol();
    out.println("<pro_name>");
  	out.println(cs.protocol_name());
  	out.println("</pro_name>"); 
  	out.println("<pro_value>");
  	out.println(cs.sum());
  	out.println("</pro_value>"); 
  	      
%>  
</body>
</html>