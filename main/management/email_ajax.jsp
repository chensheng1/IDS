<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="management.email_python" %>
<%@ page import="java.util.*" %>

<%
String user="";
String pwd="";
String username="";
String subject="";
String content="";
user=request.getParameter("user");
pwd=request.getParameter("pwd");
username=request.getParameter("username");
subject=request.getParameter("subject");
content=request.getParameter("content"); 
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
		String user1=user;
		String pwd1=pwd;
		String username1=username;
		String subject1=subject;
		String content1=content;
           email_python cs = new email_python();
           String result=cs.exec(user1,pwd1,username1,subject1,content1);
    out.println("<email>");
    out.println(result);
    out.println("</email>");
          
     %>
</body>
</html>