<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.file_class" %>
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
    String first=firsttime;
  	String last=lasttime;
   file_class cs=new file_class();
    List<String> list=cs.select_time(first,last);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<file>");
    out.println(list1);
    out.println("</file>");
    out.println("<file_values>");
  	out.println(list2);
  	out.println("</file_values>");

  	List<String> list3=cs.select_classtime(first,last);
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+2){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
    out.println("<file_class>");
    out.println(list4);
    out.println("</file_class>");
    out.println("<file_class_values>");
  	out.println(list5);
  	out.println("</file_class_values>");
%>  

</body>
</html>
