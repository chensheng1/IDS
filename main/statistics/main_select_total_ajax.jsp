<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="statistics.main_select" %>
<%@ page import="statistics.main_select_total" %>
<%@ page import="java.util.*" %>
<%
String firsttime="";
String lasttime="";
firsttime=request.getParameter("time1");
lasttime=request.getParameter("time2");
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
	     String firstdate=firsttime;
	     String lastdate=lasttime;
         main_select cs=new main_select();
         List<String> list=cs.selectdate(firstdate,lastdate);
         List<String> list1=new ArrayList<String>();
         List<String> list2=new ArrayList<String>();
         List<String> list3=new ArrayList<String>();
         List<String> list4=new ArrayList<String>();
         	for(int i=0;i<list.size();i=i+4){
         		list1.add(list.get(i));
         		long l=Long.parseLong(list.get(i+1));
				long x=l/1048576;
				String values = String.valueOf(x);
         		list2.add(values);
         		long cc=Long.parseLong(list.get(i+2));
				long y=cc/100;
				String conn = String.valueOf(y);
         		list3.add(conn);
         		long zz=Long.parseLong(list.get(i+3));
				long k=zz/1048576;
				String traff = String.valueOf(k);
         		list4.add(traff);
			}
			    out.println("<Mainsum_time>");
			    out.println(list1);
			    out.println("</Mainsum_time>");
			    out.println("<Mainsum_log>");
			    out.println(list2);
			    out.println("</Mainsum_log>");
			    out.println("<Mainsum_conn>");
			    out.println(list3);
			    out.println("</Mainsum_conn>");
			    out.println("<Mainsum_traff>");
			    out.println(list4);
			    out.println("</Mainsum_traff>");
			    
			    
	     main_select_total cc=new main_select_total();
	     List<String> list5=cc.select(firstdate,lastdate);
         List<String> list6=new ArrayList<String>();
         List<String> list7=new ArrayList<String>();
         List<String> list8=new ArrayList<String>();
         List<String> list9=new ArrayList<String>();
         for(int y=0;y<list5.size();y=y+4){
         		list6.add(list5.get(y));
         		list7.add(list5.get(y+1));
         		list8.add(list5.get(y+2));
         		list9.add(list5.get(y+3));
         }
                out.println("<time>");
			    out.println(list6);
			    out.println("</time>");
			    out.println("<conn>");
			    out.println(list7);
			    out.println("</conn>");
			    out.println("<resp_traff>");
			    out.println(list8);
			    out.println("</resp_traff>");
			    out.println("<orig_traff>");
			    out.println(list9);
			    out.println("</orig_traff>");
%>

</body>
</html>