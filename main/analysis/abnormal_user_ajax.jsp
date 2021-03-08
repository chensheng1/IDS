<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="analysis.abnormal_user" %>
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
   abnormal_user cs =new abnormal_user();
   List<String> list =cs.abnormal_int();
    List<String> list1 =new ArrayList<String>();
    List<String> list2=new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
        list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<abnormal_time>");
    out.println(list1);
    out.println("</abnormal_time>");
    out.println("<abnormal_c>");
  	out.println(list2);
  	out.println("</abnormal_c>");
  	
  	List<String> list3=cs.abnormal_sta();
  	List<String> list4=new ArrayList<String>();
    List<String> list5=new ArrayList<String>();
  	for(int i=0;i<list3.size();i=i+2){
        list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
  	out.println("<abnormal_s>");
  	out.println(list4);
  	out.println("</abnormal_s>");
  	out.println("<abnormal>");
  	out.println(list5);
  	out.println("</abnormal>");
%>  

</body>
</html>
