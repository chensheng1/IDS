<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.ipv6_number" %> 
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
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
    ipv6_number cs=new ipv6_number();
    String first=firsttime;
	String last=lasttime;
    List<String> list=cs.select_number(first,last);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<select_date>");
  	out.println(list1);
  	out.println("</select_date>"); 
    out.println("<select_number>");
  	out.println(list2);
  	out.println("</select_number>");       
  %> 
</body>
</html>
