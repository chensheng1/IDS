<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Main" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    Main maintest=new Main();
    out.println("<Main_conn>");
    out.println(maintest.Main_conn());
    out.println("</Main_conn>");
    out.println("<Main_traff>");
    out.println(maintest.Main_traff());
    out.println("</Main_traff>");
    out.println("<Main_output>");
    out.println(maintest.Main_output());
    out.println("</Main_output>");
    out.println("<Main_input>");
    out.println(maintest.Main_input());
    out.println("</Main_input>");
%>  
</body>
</html>
