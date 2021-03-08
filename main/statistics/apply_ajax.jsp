<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.apply" %>
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
    apply cs=new apply();
    List<String> list=cs.apply_total();
    List<String> list1=new ArrayList<String>();
    List<String> list2=new ArrayList<String>();
	List<String> list3=new ArrayList<String>();
    /*List<String> list4=new ArrayList<String>();
    List<String> list5=new ArrayList<String>();
    List<String> list6=new ArrayList<String>();
    List<String> list7=new ArrayList<String>();
    List<String> list8=new ArrayList<String>();
    List<String> list9=new ArrayList<String>();
    List<String> list10=new ArrayList<String>();
    List<String> list11=new ArrayList<String>();
    List<String> list12=new ArrayList<String>();
    List<String> list13=new ArrayList<String>();
    List<String> list14=new ArrayList<String>();
    List<String> list15=new ArrayList<String>();
    List<String> list16=new ArrayList<String>();
    List<String> list17=new ArrayList<String>();
    List<String> list18=new ArrayList<String>();
    List<String> list19=new ArrayList<String>();
    List<String> list20=new ArrayList<String>();
    List<String> list21=new ArrayList<String>();
    List<String> list22=new ArrayList<String>();
    List<String> list23=new ArrayList<String>();
    List<String> list24=new ArrayList<String>();
    List<String> list25=new ArrayList<String>();
    List<String> list26=new ArrayList<String>();
    List<String> list27=new ArrayList<String>();
    List<String> list28=new ArrayList<String>(); */
    for(int i=0;i<list.size();i=i+3){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
   /* 	list4.add(list.get(i+3));
    	list5.add(list.get(i));
    	list6.add(list.get(i+1));
    	list7.add(list.get(i+2));
    	list8.add(list.get(i+3));
    	list9.add(list.get(i));
    	list10.add(list.get(i+1));
    	list11.add(list.get(i+2));
    	list12.add(list.get(i+3));
    	list13.add(list.get(i));
    	list14.add(list.get(i+1));
    	list15.add(list.get(i+2));
    	list16.add(list.get(i+3));
    	list17.add(list.get(i));
    	list18.add(list.get(i+1));
    	list19.add(list.get(i+2));
    	list20.add(list.get(i+3));
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    	list4.add(list.get(i+3)); */
    }
    out.println("<protocol>");
    out.println(list1);
    out.println("</protocol>");
    out.println("<incoming>");
    out.println(list2);
    out.println("</incoming>");
    out.println("<outgoing>");
	out.println(list3);
    out.println("</outgoing>");
%>  
</body>
</html>
