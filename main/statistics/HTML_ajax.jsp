<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.HTML_file" %>
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
    HTML_file cs=new HTML_file();
    List<String> list=cs.HTMLtype();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<html_type>");
    out.println(list1);
    out.println("</html_type>");
    out.println("<html_values>");
  	out.println(list2);
  	out.println("</html_values>");
 
 
    List<String> list3=cs.HTMLkey();
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+2){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
  	out.println("<html_key>");
    out.println(list4);
    out.println("</html_key>");
    out.println("<html_count>");
  	out.println(list5);
  	out.println("</html_count>");
  	
%>  
</body>
</html>
