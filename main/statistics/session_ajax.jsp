<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.session" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    session cs=new session();
    out.println("<session_IP>");
  	out.println(cs.session_IP());
  	out.println("</session_IP>"); 
  	out.println("<session_orig>");
  	out.println(cs.session_orig());
  	out.println("</session_orig>"); 
  	out.println("<session_resp>");
  	out.println(cs.session_resp());
  	out.println("</session_resp>");
  	out.println("<session_value>");
  	out.println(cs.session_values());
  	out.println("</session_value>");
  	      
%>  
</body>
</html>