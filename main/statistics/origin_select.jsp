<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.origin_select" %>
<% 
String firsttime="";
String lasttime="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");

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
    origin_select cs = new origin_select();
    out.println("<select_origin>");
  	out.println(cs.selectIP(first,last));
  	out.println("</select_origin>"); 
  	out.println("<select_value>");
  	out.println(cs.sum(first,last));
  	out.println("</select_value>"); 
  	      
%>  
</body>
</html>