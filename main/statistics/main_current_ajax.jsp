<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="statistics.main_select_total" %>
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
	     main_select_total cc=new main_select_total();
	     List<String> list=cc.select_current();
         List<String> list1=new ArrayList<String>();
         List<String> list2=new ArrayList<String>();
         List<String> list3=new ArrayList<String>();
         List<String> list4=new ArrayList<String>();
          for(int i=0;i<list.size();i=i+4){
         		list1.add(list.get(i+3));
         		list2.add(list.get(i+2));
         		list3.add(list.get(i+1));
         		list4.add(list.get(i));
         }
			    out.println("<Mainsum_time>");
			    out.println(list1);
			    out.println("</Mainsum_time>");
			    out.println("<Mainsum_conn>");
			    out.println(list2);
			    out.println("</Mainsum_conn>");
			    out.println("<Mainsum_in>");
			    out.println(list3);
			    out.println("</Mainsum_in>");
			    out.println("<Mainsum_out>");
			    out.println(list4);
			    out.println("</Mainsum_out>");
			    
			   
%>

</body>
</html>