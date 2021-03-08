<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.web_class" %>
<%@ page import="statistics.web_class_month" %>
<%@ page import="statistics.web_class_day" %>
<%@ page import="java.util.*" %>
<% 
//String time="";
String web_type="";
String web_select="";
//time=request.getParameter("start");
web_type=request.getParameter("type");
web_select=request.getParameter("select");
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
    String web_class=web_type;
    String inquire=web_select;
    String select1="月度覆盖人数";
    String select2="日均覆盖人数";
    String name="全部";
    String name1="undefined";
    if(inquire.equals(select1)){
   		   web_class_month cs=new web_class_month();
		   if(web_class.equals(name1)||web_class.equals(name)){
				    List<String> list3=cs.month_web_user();
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
				  	out.println("</select_values>");
				      
		   		   }else{
				    List<String> list=cs.month_class_user(web_class);
				    List<String> list1 =new ArrayList<String>();
				    List<String> list2 =new ArrayList<String>();
				    for(int i=0;i<list.size();i=i+2){
					    	list1.add(list.get(i));
					    	list2.add(list.get(i+1));
				    }
				    out.println("<select_web>");
				    out.println(list1);
				    out.println("</select_web>");
				    out.println("<select_values>");
				  	out.println(list2);
				  	out.println("</select_values>");  
				  }
   }else if(inquire.equals(select2)){
   		   web_class_day cs=new web_class_day();
		   if(web_class.equals(name1)||web_class.equals(name)){
				    List<String> list3=cs.day_web_user();
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
				  	out.println("</select_values>");
				      
		   		   }else{
				    List<String> list=cs.day_class_user(web_class);
				    List<String> list1 =new ArrayList<String>();
				    List<String> list2 =new ArrayList<String>();
				    for(int i=0;i<list.size();i=i+2){
					    	list1.add(list.get(i));
					    	list2.add(list.get(i+1));
				    }
				    out.println("<select_web>");
				    out.println(list1);
				    out.println("</select_web>");
				    out.println("<select_values>");
				  	out.println(list2);
				  	out.println("</select_values>");  
				  }
				  	
   }
   else{
		   web_class cs=new web_class();
		   if(web_class.equals(name1)||web_class.equals(name)){
				    List<String> list3=cs.month_web();
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
				  	out.println("</select_values>");
				      
		   		   }else{
				    List<String> list=cs.month_class(web_class);
				    List<String> list1 =new ArrayList<String>();
				    List<String> list2 =new ArrayList<String>();
				    for(int i=0;i<list.size();i=i+2){
					    	list1.add(list.get(i));
					    	list2.add(list.get(i+1));
				    }
				    out.println("<select_web>");
				    out.println(list1);
				    out.println("</select_web>");
				    out.println("<select_values>");
				  	out.println(list2);
				  	out.println("</select_values>");  
				  }
				  	
  	}
%>  
</body>
</html>
