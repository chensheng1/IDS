<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.browser_bar" %>
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
   browser_bar cs=new browser_bar();
    List<String> list=cs.browser();
    List<String> list1 =new ArrayList<String>();
    for(int i=0;i<list.size();i++){
    	list1.add(list.get(i));
    }
    out.println("<browser>");
    out.println(list1);
    out.println("</browser>");

 %>
</body>
</html>
