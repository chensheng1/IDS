<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.device" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String device="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
device=request.getParameter("device");
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
		  	    device cs = new device();
		    List<String> list=cs.device_duration(first,last);
		    List<String> list1 =new ArrayList<String>();
		    List<String> list2 =new ArrayList<String>();
		    for(int i=0;i<list.size();i=i+2){
		    	list1.add(list.get(i));
		    	list2.add(list.get(i+1));
		    }
		    out.println("<select_device>");
		    out.println(list1);
		    out.println("</select_device>");
		    out.println("<select_values>");
		  	out.println(list2);
		  	out.println("</select_values>");  
		  	
		  	
		  	List<String> list3=cs.device_member(first,last);
		    List<String> list4 =new ArrayList<String>();
		    List<String> list5=new ArrayList<String>();
		    for(int i=0;i<list3.size();i=i+2){
		    	list4.add(list3.get(i));
		    	list5.add(list3.get(i+1));
		    }
		    out.println("<device_name1>");
		    out.println(list4);
		    out.println("</device_name1>");
		    out.println("<device_member1>");
		  	out.println(list5);
		  	out.println("</device_member1>");
		  	
		  	    String term=device;
			    List<String> list6=cs.select_device_total(first,last,term);
			    List<String> list7 =new ArrayList<String>();
			    List<String> list8 =new ArrayList<String>();
			    List<String> list9 =new ArrayList<String>();
			    List<String> list10 =new ArrayList<String>();
			    for(int i=0;i<list6.size();i=i+4){
			    	list7.add(list6.get(i));
			    	list8.add(list6.get(i+1));
			    	list9.add(list6.get(i+2));
			    	list10.add(list6.get(i+3));
			    }
			    out.println("<device_time>");
			    out.println(list7);
			    out.println("</device_time>");
			    out.println("<device_browse>");
			  	out.println(list8);
			  	out.println("</device_browse>");
			  	out.println("<device_member>");
			    out.println(list9);
			    out.println("</device_member>");
			    out.println("<device_duration>");
			  	out.println(list10);
			  	out.println("</device_duration>");
			  	
%>  

</body>
</html>
