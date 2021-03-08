<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.device_system" %>
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
		  	 device_system cs=new device_system();
    List<String> list=cs.select_system(first,last);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    List<String> list3 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+3){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    }
    out.println("<system_name>");
    out.println(list1);
    out.println("</system_name>");
    out.println("<system_values>");
  	out.println(list2);
  	out.println("</system_values>");
    out.println("<system_member>");
  	out.println(list3);
  	out.println("</system_member>");
			  	
%>  

</body>
</html>
