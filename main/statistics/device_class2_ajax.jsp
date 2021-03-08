<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.device_class" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache");
			    device_class cs=new device_class();
			    List<String> list6=cs.look_device();
			    List<String> list7 =new ArrayList<String>();
			    List<String> list8 =new ArrayList<String>();
			    for(int i=0;i<list6.size();i=i+2){
			    	list7.add(list6.get(i));
			    	list8.add(list6.get(i+1));
			    }
			    out.println("<device_name>");
			    out.println(list7);
			    out.println("</device_name>");
			    out.println("<device_values>");
			  	out.println(list8);
			  	out.println("</device_values>");  
    
%>  

 
</body>
</html>
