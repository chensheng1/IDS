<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Main_sum2" %>
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
    Main_sum2 cs=new Main_sum2();
    List<String> list=cs.Mainsum2();
    List<String> list1 =new ArrayList<String>();
    List<String> list2=new ArrayList<String>();
    List<String> list3=new ArrayList<String>();
    List<String> list4=new ArrayList<String>();
    for(int i=0;i<list.size();i=i+4){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    	list4.add(list.get(i+3));
    }
    List<String> connlist =new ArrayList<String>();
			for(int i=0;i<list3.size();i++){
				long l=Long.parseLong(list3.get(i));
				long x=l/100;
				String values = String.valueOf(x);
				connlist.add(values);
			}
	List<String> trafflist =new ArrayList<String>();
		for(int i=0;i<list4.size();i++){
			long l=Long.parseLong(list4.get(i));
			long x=l/(1024*1024);
			String values = String.valueOf(x);
			trafflist.add(values);
		}
    List<String> loglist =new ArrayList<String>();
		for(int i=0;i<list2.size();i++){
			long l=Long.parseLong(list2.get(i));
			long x=l/1024;
			String values = String.valueOf(x);
			loglist.add(values);
		}
	 Collections.reverse(list1);
	  Collections.reverse(connlist);
	   Collections.reverse(trafflist);
	    Collections.reverse(loglist);
    out.println("<Mainsum_time>");
    out.println(list1);
    out.println("</Mainsum_time>");
    out.println("<Mainsum_conn>");
    out.println(connlist);
    out.println("</Mainsum_conn>");
    out.println("<Mainsum_traff>");
    out.println(trafflist);
    out.println("</Mainsum_traff>");
    out.println("<Mainsum_log>");
    out.println(loglist);
    out.println("</Mainsum_log>");
%>  
</body>
</html>
