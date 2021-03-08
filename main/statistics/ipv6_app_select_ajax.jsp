<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.ipv6_app" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String user="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
user=request.getParameter("user");
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
    ipv6_app cs=new ipv6_app();
  	String first=firsttime;
  	String last=lasttime;
    List<String> list6=cs.select_time_app(first,last);
    List<String> list7 =new ArrayList<String>();
    List<String> list8=new ArrayList<String>();
    for(int i=0;i<list6.size();i=i+2){
    	list7.add(list6.get(i));
    	list8.add(list6.get(i+1));
    }
    out.println("<select_app_time>");
    out.println(list7);
    out.println("</select_app_time>");
    out.println("<select_values_time>");
  	out.println(list8);
  	out.println("</select_values_time>");

  	
  	String user_app=user;
   /*  List<String> list3=cs.select_table(first,last,user_app);
    out.println("<select_app>");
    out.println(list3);
    out.println("</select_app>"); */


    List<String> list=cs.select_app_total(first,last,user_app);
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
    out.println("<app_time>");
    out.println(list1);
    out.println("</app_time>");
    out.println("<app_browse>");
  	out.println(list2);
  	out.println("</app_browse>");
  	out.println("<app_member>");
    out.println(list3);
    out.println("</app_member>");
    out.println("<app_duration>");
  	out.println(list4);
  	out.println("</app_duration>");
  	
  	
  	List<String> list9=cs.select_time_app1(first,last);
    List<String> list10 =new ArrayList<String>();
    List<String> list11=new ArrayList<String>();
    for(int i=0;i<list9.size();i=i+2){
    	list10.add(list9.get(i));
    	list11.add(list9.get(i+1));
    }
    out.println("<select_app_time1>");
    out.println(list10);
    out.println("</select_app_time1>");
    out.println("<select_values_time1>");
  	out.println(list11);
  	out.println("</select_values_time1>");
%>  

</body>
</html>
