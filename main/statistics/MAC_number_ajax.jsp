<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.MAC_table" %>
<%@ page import="java.util.*" %>
<%
String user="";
user=request.getParameter("ip");
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
    String[] array=user.split("or");
    MAC_table cs=new MAC_table();
    List<String> list=cs.lu_num(array);
    List<String> list1=new ArrayList<String>();
    List<String> list2=new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
   
    }
    out.println("<MAC>");
    out.println(list1);
    out.println("</MAC>");
    out.println("<number>");
    out.println(list2);
    out.println("</number>");
%>  
</body>
</html>
