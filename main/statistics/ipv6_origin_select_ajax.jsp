<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.ipv6_origin" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String origin_ip="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
origin_ip=request.getParameter("ip");
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
    String first=firsttime;
	String last=lasttime;
	String ip=origin_ip;
    ipv6_origin cs = new ipv6_origin();
    List<String> list =cs.origin_select( first,last,ip);
    List<String> list2 =new ArrayList<String>();
    List<String> list3 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
           list2.add(list.get(i));
           list3.add(list.get(i+1));
    }
    out.println("<select_origin>");
  	out.println(list2);
  	out.println("</select_origin>"); 
  	out.println("<select_value>");
  	out.println(list3);
  	out.println("</select_value>"); 
  	
  	List<String> list4 =cs.orig_select(first,last);
    List<String> list5 =new ArrayList<String>();
    List<String> list6 =new ArrayList<String>();
    for(int i=0;i<list4.size();i=i+2){
           list5.add(list4.get(i));
           list6.add(list4.get(i+1));
    }
    out.println("<select_origin1>");
  	out.println(list5);
  	out.println("</select_origin1>"); 
  	out.println("<select_value1>");
  	out.println(list6);
  	out.println("</select_value1>"); 
  	     
%>  
</body>
</html>