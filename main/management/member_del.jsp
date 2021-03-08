<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="management.member_del" %>
<% 
String name="";

name=request.getParameter("name");
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
    member_del cs =new member_del();
    String result=cs.del_username(name1);
    out.println("<del>");
    out.println(result);
    out.println("</del>");
%>  
</body>
</html>
