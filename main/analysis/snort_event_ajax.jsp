<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="analysis.snort_abnormal" %> 
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
    snort_abnormal cs=new snort_abnormal();
    List<String> list=cs.snort_count();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<time>");
    out.println(list1);
    out.println("</time>");
    out.println("<values>");
  	out.println(list2);
  	out.println("</values>");
  	
  	
 	List<String> list3=cs.snort_type();
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+2){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
    out.println("<type>");
    out.println(list4);
    out.println("</type>");
    out.println("<number>");
  	out.println(list5);
  	out.println("</number>");
  	
  	List<String> list6=cs.snort_abnor();
    List<String> list7 =new ArrayList<String>();
    List<String> list8 =new ArrayList<String>();
    for(int i=0;i<list6.size();i=i+2){
    	list7.add(list6.get(i));
    	list8.add(list6.get(i+1));
    }
    out.println("<abn>");
    out.println(list7);
    out.println("</abn>");
    out.println("<number1>");
  	out.println(list8);
  	out.println("</number1>");
%>  
</body>
</html>
