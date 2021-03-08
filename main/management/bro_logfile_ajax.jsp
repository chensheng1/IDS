<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="management.bro_logfile" %>
<%@ page import="java.util.*" %>
<% 
String begin="";
String endtime="";
//String file="";
begin=request.getParameter("start");
endtime=request.getParameter("end");
//file=request.getParameter("log");
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
    String starttime=begin;
    String lasttime=endtime;
   // String logfile=file;
      bro_logfile cs =new bro_logfile();
       String result=cs.remove(starttime,lasttime);
		out.println("<results>");
		out.println(result);
		out.println("</results>");
			  
%>  
</body>
</html>
