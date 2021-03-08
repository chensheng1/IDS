<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.device_month_day_class" %>
<%@ page import="java.util.*" %>
<% 
String type="";
String device_select="";
type=request.getParameter("type");
device_select=request.getParameter("select");
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
    String device_class=type;
    String inquire=device_select;
    String select1="月度使用时长";
    String select2="当天覆盖人数";
    String name="全部";
    String name1="undefined";
    device_month_day_class cs=new device_month_day_class();
    if(inquire.equals(select1)){
		   if(device_class.equals(name1)||device_class.equals(name)){
				    List<String> list3=cs.month_device_duration();
				    List<String> list4 =new ArrayList<String>();
				    List<String> list5 =new ArrayList<String>();
				    for(int i=0;i<list3.size();i=i+2){
					    	list4.add(list3.get(i));
					    	list5.add(list3.get(i+1));
		            }
				    out.println("<select_device>");
				    out.println(list4);
				    out.println("</select_device>");
				    out.println("<select_values>");
				  	out.println(list5);
				  	out.println("</select_values>");
				      
		   		   }else{
				    List<String> list=cs.month_device_duration(device_class);
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
				   
				  }
   }else if(inquire.equals(select2)){
		   if(device_class.equals(name1)||device_class.equals(name)){
				    List<String> list3=cs.day_device_member();
				    List<String> list4 =new ArrayList<String>();
				    List<String> list5 =new ArrayList<String>();
				    for(int i=0;i<list3.size();i=i+2){
					    	list4.add(list3.get(i));
					    	list5.add(list3.get(i+1));
		            }
				    out.println("<select_device>");
				    out.println(list4);
				    out.println("</select_device>");
				    out.println("<select_values>");
				  	out.println(list5);
				  	out.println("</select_values>");
				      
		   		   }else{
				    List<String> list=cs.day_device_member(device_class);
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
				  }
				  	
   }
   else{
				 if(device_class.equals(name1)||device_class.equals(name)){
				  List<String> list3=cs.month_device_member();
				    List<String> list4 =new ArrayList<String>();
				    List<String> list5 =new ArrayList<String>();
				    for(int i=0;i<list3.size();i=i+2){
					    	list4.add(list3.get(i));
					    	list5.add(list3.get(i+1));
		            }
				    out.println("<select_device>");
				    out.println(list4);
				    out.println("</select_device>");
				    out.println("<select_values>");
				  	out.println(list5);
				  	out.println("</select_values>");  
		    }else{
				List<String> list=cs.month_device_member(device_class);
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
  	} 
}		 
		%>  
</body>
</html>
