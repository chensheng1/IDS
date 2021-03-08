<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.OriginIPtop" %>
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
    OriginIPtop origin=new OriginIPtop();
    List<String> list5=origin.orig_five();
    List<String> list3 =new ArrayList<String>();
	List<String> list4=new ArrayList<String>();
	for(int i=0;i<list5.size();i=i+2){
		    	list3.add(list5.get(i));
		    	list4.add(list5.get(i+1));
		    }
    out.println("<origin_values>");
  	out.println(list4);
  	out.println("</origin_values>"); 
  	out.println("<originIP>");
  	out.println(list3);
  	out.println("</originIP>"); 
 
%>  
</body>
</html>