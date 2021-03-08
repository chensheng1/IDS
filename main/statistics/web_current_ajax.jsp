<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Web_pie" %>
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
    Web_pie web=new Web_pie();
    List<String> list=web.day_web();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<web_day>");
    out.println(list1);
    out.println("</web_day>");
    out.println("<web_values>");
  	out.println(list2);
  	out.println("</web_values>");  
  	
  	List<String> list3=web.select_total();
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    List<String> list6 =new ArrayList<String>();
    List<String> list7 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+4){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    	list6.add(list3.get(i+2));
    	list7.add(list3.get(i+3));
    }
    out.println("<web_time>");
    out.println(list7);
    out.println("</web_time>");
    out.println("<web_browse>");
  	out.println(list6);
  	out.println("</web_browse>");
  	out.println("<web_member>");
    out.println(list5);
    out.println("</web_member>");
    out.println("<web_duration>");
  	out.println(list4);
  	out.println("</web_duration>");
 
 
    List<String> list8=web.day_web1();
    List<String> list9 =new ArrayList<String>();
    List<String> list10 =new ArrayList<String>();
    for(int i=0;i<list8.size();i=i+2){
    	list9.add(list8.get(i));
    	list10.add(list8.get(i+1));
    }
    out.println("<web_day1>");
    out.println(list9);
    out.println("</web_day1>");
    out.println("<web_values1>");
  	out.println(list10);
  	out.println("</web_values1>");  
%>  
</body>
</html>
