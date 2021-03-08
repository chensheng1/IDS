<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="management.member_add" %>
<% 
String name="";
String pwd="";
String admin="";
name=request.getParameter("name");
pwd=request.getParameter("pwd");
admin=request.getParameter("admin");
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
    String name1=name;
    String pwd1=pwd;
    String admin1=admin;
    member_add cs =new member_add();
    String result=cs.add_user(name1,pwd1,admin1);
    out.println("<add>");
    out.println(result);
    out.println("</add>");
%>  
</body>
</html>
