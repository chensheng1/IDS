<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.ipv6_web" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String web1="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
web1=request.getParameter("user"); 
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
    ipv6_web web=new ipv6_web();
  	
  	String first=firsttime;
  	String last=lasttime;
    List<String> list6=web.select_time(first,last);
    List<String> list7 =new ArrayList<String>();
    List<String> list8=new ArrayList<String>();
    for(int i=0;i<list6.size();i=i+2){
    	list7.add(list6.get(i));
    	list8.add(list6.get(i+1));
    }
    out.println("<select_web_time>");
    out.println(list7);
    out.println("</select_web_time>");
    out.println("<select_values_time>");
  	out.println(list8);
  	out.println("</select_values_time>");
  	
   	String web2=web1;
    List<String> list=web.select_web(first,last,web2);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    List<String> list3 =new ArrayList<String>();
    List<String> list4 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+4){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    	list4.add(list.get(i+3));
    }
    out.println("<web_time>");
    out.println(list1);
    out.println("</web_time>");
    out.println("<web_browse>");
  	out.println(list2);
  	out.println("</web_browse>");
  	out.println("<web_member>");
    out.println(list3);
    out.println("</web_member>");
    out.println("<web_duration>");
  	out.println(list4);
  	out.println("</web_duration>");
  	
  	List<String> list9=web.select_time1(first,last);
    List<String> list10 =new ArrayList<String>();
    List<String> list11=new ArrayList<String>();
    for(int i=0;i<list9.size();i=i+2){
    	list10.add(list9.get(i));
    	list11.add(list9.get(i+1));
    }
    out.println("<select_web_time1>");
    out.println(list10);
    out.println("</select_web_time1>");
    out.println("<select_values_time1>");
  	out.println(list11);
  	out.println("</select_values_time1>");
%>  

 
</body>
</html>
