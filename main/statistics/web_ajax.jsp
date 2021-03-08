<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.Web_pie" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String web1="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
web1=request.getParameter("user"); 
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
    Web_pie web=new Web_pie();
 /*   List<String> list=web.day_web();
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<web_day>");
    out.println(list1);
    out.println("</web_day>");
    out.println("<web_values>");
  	out.println(list2);
  	out.println("</web_values>");  */
         
   /*  String user_ip=user;
    List<String> list3=web.select_user(user_ip);
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+2){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
    out.println("<select_web>");
    out.println(list4);
    out.println("</select_web>");
    out.println("<select_values>");
  	out.println(list5);
  	out.println("</select_values>"); */
  	
  	String first=firsttime;
  	String last=lasttime;
    List<String> list6=web.select_time(first,last);
    List<String> list7 =new ArrayList<String>();
    List<String> list8=new ArrayList<String>();
    for(int i=0;i<list6.size();i=i+2){
    	list7.add(list6.get(i));
    	list8.add(list6.get(i+1));
    }
    out.println("<select_web_time>");
    out.println(list7);
    out.println("</select_web_time>");
    out.println("<select_values_time>");
  	out.println(list8);
  	out.println("</select_values_time>");
  	
   	String web2=web1;
/*  List<String> list9=web.select_table(first,last,web2);
    out.println("<select_browse>");
    out.println(list9);
    out.println("</select_browse>");  */
    List<String> list=web.select_web(first,last,web2);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    List<String> list3 =new ArrayList<String>();
    List<String> list4 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+4){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
    	list4.add(list.get(i+3));
    }
    out.println("<web_time>");
    out.println(list1);
    out.println("</web_time>");
    out.println("<web_browse>");
  	out.println(list2);
  	out.println("</web_browse>");
  	out.println("<web_member>");
    out.println(list3);
    out.println("</web_member>");
    out.println("<web_duration>");
  	out.println(list4);
  	out.println("</web_duration>");
  	
  	List<String> list9=web.select_time1(first,last);
    List<String> list10 =new ArrayList<String>();
    List<String> list11=new ArrayList<String>();
    for(int i=0;i<list9.size();i=i+2){
    	list10.add(list9.get(i));
    	list11.add(list9.get(i+1));
    }
    out.println("<select_web_time1>");
    out.println(list10);
    out.println("</select_web_time1>");
    out.println("<select_values_time1>");
  	out.println(list11);
  	out.println("</select_values_time1>");
%>  

<%-- <cs>
<div  style="width:100%;height:350px" align="center">

<table width="80%" height="300px" border="1" align="center" >
	<thead>
		<tr>
			<th width="20px">时间</th>
			<th width="20px">用户</th>
			<th width="20px">浏览的网站</th>
			<th width="20px">浏览的时间</th>
		</tr>
	</thead>
	
	<tbody id="sum">

<%    
         List<String> list9=web.select_table(first,last,user);
         	for(int i=0;i<list9.size();i=i+4){
     %>
        <tr>
             <td width="20px"><%=list9.get(i)%></td>
             <td width="20px"><%=list9.get(i+1)%></td>
             <td width="20px"><%=list9.get(i+2)%></td>
             <td width="20px"><%=list9.get(i+3)%></td>
     	</tr>
     	 <%
          }
       %>
       </tbody>
</table>
</div> 
</cs> 
    --%>
	
 
</body>
</html>
