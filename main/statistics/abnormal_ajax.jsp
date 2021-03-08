<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.abnormal_flow" %>
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
    abnormal_flow cs=new abnormal_flow();
    List<String> list=cs.abnormal();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    List<String> list3 =new ArrayList<String>();
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+5){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    	list4.add(list.get(i+3));
    	list5.add(list.get(i+4));
    	
    }
    out.println("<abnormal_time>");
    out.println(list1);
    out.println("</abnormal_time>");
    out.println("<abnormal_conn>");
  	out.println(list2);
  	out.println("</abnormal_conn>");
	out.println("<abnormal_high>");
    out.println(list3);
    out.println("</abnormal_high>");
    out.println("<abnormal_low>");
  	out.println(list4);
  	out.println("</abnormal_low>");
    out.println("<abnormal_flow>");
  	out.println(list5);
  	out.println("</abnormal_flow>");  


    List<String> list6=cs.abnormal_high();
    List<String> list7 =new ArrayList<String>();
    List<String> list8 =new ArrayList<String>();
    for(int i=0;i<list6.size();i=i+2){
    	list7.add(list6.get(i));
    	list8.add(list6.get(i+1));
    }
    out.println("<time>");
    out.println(list7);
    out.println("</time>");
    out.println("<high>");
  	out.println(list8);
  	out.println("</high>");
  	
  	List<String> list9=cs.abnormal_low();
    List<String> list10 =new ArrayList<String>();
    List<String> list11=new ArrayList<String>();
    for(int i=0;i<list9.size();i=i+2){
    	list10.add(list9.get(i));
    	list11.add(list9.get(i+1));
    }
    out.println("<time1>");
    out.println(list10);
    out.println("</time1>");
    out.println("<low>");
  	out.println(list11);
  	out.println("</low>");
  	
  	List<String> list12=cs.abnormal_low();
    List<String> list13 =new ArrayList<String>();
    List<String> list14=new ArrayList<String>();
    for(int i=0;i<list12.size();i=i+2){
    	list13.add(list12.get(i));
    	list14.add(list12.get(i+1));
    }
    out.println("<time2>");
    out.println(list13);
    out.println("</time2>");
    out.println("<conn>");
  	out.println(list14);
  	out.println("</conn>");
%>  

</body>
</html>
