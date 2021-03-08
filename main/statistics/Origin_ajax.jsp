<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Origin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    Origin origin=new Origin();
    out.println("<origin>");
  	out.println(origin.test());
  	out.println("</origin>"); 
  	out.println("<originIP>");
  	out.println(origin.originIP());
  	out.println("</originIP>"); 
  	      
%>  
</body>
</html>