<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.ipv6_user" %> 
<%@ page import="java.util.*" %>
<% 
String begintime="";
String endtime="";
String user="";
begintime=request.getParameter("firsttime");
endtime=request.getParameter("lasttime");
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
    String time1=begintime;
    String time2=endtime;
    String user_ip=user;
    ipv6_user cs=new ipv6_user();
    List<String> list=cs.user_condition(time1,time2,user_ip);
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
    out.println("<user_out>");
    out.println(list1);
    out.println("</user_out>");
    out.println("<user_in>");
  	out.println(list2);
  	out.println("</user_in>");  
  	out.println("<user_date>");
    out.println(list3);
    out.println("</user_date>");
    out.println("<user_time>");
  	out.println(list4);
  	out.println("</user_time>");  
  	
%>  
</body>
</html>
