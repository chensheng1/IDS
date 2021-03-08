<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.user_app" %>
<%@ page import="user.user_device" %> 
<%@ page import="user.user_web" %>
<%@ page import="user.user_system" %>
<%@ page import="java.util.*" %>
<% 
String firsttime="";
String lasttime="";
String user="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
user=request.getParameter("user"); 
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
  	String ip=user; 
  	if(first.length()>0&&last.length()>0&& ip.length()>0){
			    user_web web=new user_web();
			    List<String> list=web.select_time_web(first,last,user);
			    List<String> list1 =new ArrayList<String>();
			    List<String> list2 =new ArrayList<String>();
			    for(int i=0;i<list.size();i=i+2){
			    	list1.add(list.get(i));
			    	list2.add(list.get(i+1));
			    }
			    out.println("<web_name>");
			    out.println(list1);
			    out.println("</web_name>");
			    out.println("<web_values>");
			  	out.println(list2);
			  	out.println("</web_values>");  
         
			  	 user_app app=new user_app();
			    List<String> list3=app.select_time_app(first,last,user);
			    List<String> list4 =new ArrayList<String>();
			    List<String> list5 =new ArrayList<String>();
			    for(int i=0;i<list3.size();i=i+2){
			    	list4.add(list3.get(i));
			    	list5.add(list3.get(i+1));
			    }
			    out.println("<app_name>");
			    out.println(list4);
			    out.println("</app_name>");
			    out.println("<app_values>");
			  	out.println(list5);
			  	out.println("</app_values>");  
			  	
			   user_device device=new user_device();
			    List<String> list6=device.select_time_device(first,last,user);
			    List<String> list7 =new ArrayList<String>();
			    List<String> list8 =new ArrayList<String>();
			    for(int i=0;i<list6.size();i=i+2){
			    	list7.add(list6.get(i));
			    	list8.add(list6.get(i+1));
			    }
			    out.println("<device_name>");
			    out.println(list7);
			    out.println("</device_name>");
			    out.println("<device_values>");
			  	out.println(list8);
			  	out.println("</device_values>"); 
			  	
			  	
			  	user_system system=new user_system();
                List<String> list9=system.select_time_system(first,last,user);
			    List<String> list10 =new ArrayList<String>();
			    List<String> list11 =new ArrayList<String>();
			    for(int i=0;i<list9.size();i=i+2){
			    	list10.add(list9.get(i));
			    	list11.add(list9.get(i+1));
			    }
			    out.println("<system_name>");
			    out.println(list10);
			    out.println("</system_name>");
			    out.println("<system_values>");
			  	out.println(list11);
			  	out.println("</system_values>");
  		}else
  		{
  				user_web web=new user_web();
			    List<String> list=web.select_web(ip);
			    List<String> list1 =new ArrayList<String>();
			    List<String> list2 =new ArrayList<String>();
			    for(int i=0;i<list.size();i=i+2){
			    	list1.add(list.get(i));
			    	list2.add(list.get(i+1));
			    }
			    out.println("<web_name>");
			    out.println(list1);
			    out.println("</web_name>");
			    out.println("<web_values>");
			  	out.println(list2);
			  	out.println("</web_values>");  
         
			  	 user_app app=new user_app();
			    List<String> list3=app.select_app(ip);
			    List<String> list4 =new ArrayList<String>();
			    List<String> list5 =new ArrayList<String>();
			    for(int i=0;i<list3.size();i=i+2){
			    	list4.add(list3.get(i));
			    	list5.add(list3.get(i+1));
			    }
			    out.println("<app_name>");
			    out.println(list4);
			    out.println("</app_name>");
			    out.println("<app_values>");
			  	out.println(list5);
			  	out.println("</app_values>");  
			  	
			   user_device device=new user_device();
			    List<String> list6=device.select_device(ip);
			    List<String> list7 =new ArrayList<String>();
			    List<String> list8 =new ArrayList<String>();
			    for(int i=0;i<list6.size();i=i+2){
			    	list7.add(list6.get(i));
			    	list8.add(list6.get(i+1));
			    }
			    out.println("<device_name>");
			    out.println(list7);
			    out.println("</device_name>");
			    out.println("<device_values>");
			  	out.println(list8);
			  	out.println("</device_values>");  
			  	
			  	
			  	user_system system=new user_system();
                List<String> list9=system.select_system(ip);
			    List<String> list10 =new ArrayList<String>();
			    List<String> list11 =new ArrayList<String>();
			    for(int i=0;i<list9.size();i=i+2){
			    	list10.add(list9.get(i));
			    	list11.add(list9.get(i+1));
			    }
			    out.println("<system_name>");
			    out.println(list10);
			    out.println("</system_name>");
			    out.println("<system_values>");
			  	out.println(list11);
			  	out.println("</system_values>");
  		}
   
%>  

 
</body>
</html>
