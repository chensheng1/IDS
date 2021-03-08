<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.resp_ip" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
    resp_ip resp = new resp_ip();
    out.println("<resphour>");
  	out.println(resp.gethourValue());
  	out.println("</resphour>"); 
  	out.println("<respsecond>");
  	out.println(resp.getsecondValue());
  	out.println("</respsecond>"); 
  	out.println("<respIP>");
  	out.println(resp.gettopIP());
  	out.println("</respIP>"); 
  	out.println("<respflow>");
  	out.println(resp.gettopFlow());
  	out.println("</respflow>"); 
%>  
</body>
</html>