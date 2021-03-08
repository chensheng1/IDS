<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Main_sum" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    Main_sum maintest=new Main_sum();
    out.println("<Mainsum_time>");
    out.println(maintest.currentdate());
    out.println("</Mainsum_time>");
    out.println("<Mainsum_conn>");
    out.println(maintest.Mainsum_conn());
    out.println("</Mainsum_conn>");
    out.println("<Mainsum_traff>");
    out.println(maintest.Mainsum_traff());
    out.println("</Mainsum_traff>");
    out.println("<Mainsum_log>");
    out.println(maintest.Mainsum_log());
    out.println("</Mainsum_log>");
%>  
</body>
</html>
