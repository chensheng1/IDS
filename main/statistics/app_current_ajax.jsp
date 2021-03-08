<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.app" %>
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
    app cs=new app();
    List<String> list=cs.current_app();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<app>");
    out.println(list1);
    out.println("</app>");
    out.println("<app_values>");
  	out.println(list2);
  	out.println("</app_values>");
 
 
    List<String> list3=cs.select_total();
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
    out.println("<app_time>");
    out.println(list7);
    out.println("</app_time>");
    out.println("<app_browse>");
  	out.println(list6);
  	out.println("</app_browse>");
  	out.println("<app_member>");
    out.println(list5);
    out.println("</app_member>");
    out.println("<app_duration>");
  	out.println(list4);
  	out.println("</app_duration>");
  	
  	List<String> list8=cs.current_app1();
    List<String> list9 =new ArrayList<String>();
    List<String> list10 =new ArrayList<String>();
    for(int i=0;i<list8.size();i=i+2){
    	list9.add(list8.get(i));
    	list10.add(list8.get(i+1));
    }
    out.println("<app1>");
    out.println(list9);
    out.println("</app1>");
    out.println("<app_values1>");
  	out.println(list10);
  	out.println("</app_values1>");
 
%>  
</body>
</html>
