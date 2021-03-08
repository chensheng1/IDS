<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.app_class" %>
<%@ page import="java.util.*" %>
<% 
String app_type="";
String app_select="";
app_type=request.getParameter("type");
app_select=request.getParameter("select");
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
   app_class cs=new app_class();
   String app_class=app_type;
    String inquire=app_select;
    String select1="月度覆盖人数";
    String select2="当天覆盖人数";
    String name="全部";
    String name1="undefined";
  if(inquire.equals(select1)){
	 if(app_class.equals(name1)||app_class.equals(name)){
		   	List<String> list3=cs.month_app_member();
		    List<String> list4 =new ArrayList<String>();
		    List<String> list5 =new ArrayList<String>();
		    for(int i=0;i<list3.size();i=i+2){
		    	list4.add(list3.get(i));
		    	list5.add(list3.get(i+1));
		    }
		    out.println("<select_app>");
		    out.println(list4);
		    out.println("</select_app>");
		    out.println("<select_values>");
		  	out.println(list5);
		  	out.println("</select_values>");
   }else{
	    List<String> list=cs.month_app_user(app_class);
	    List<String> list1 =new ArrayList<String>();
	    List<String> list2 =new ArrayList<String>();
	    for(int i=0;i<list.size();i=i+2){
	    	list1.add(list.get(i));
	    	list2.add(list.get(i+1));
	    }
	    out.println("<select_app>");
	    out.println(list1);
	    out.println("</select_app>");
	    out.println("<select_values>");
	  	out.println(list2);
	  	out.println("</select_values>");  
	  	}
	 }else if(inquire.equals(select2)){
	 		 if(app_class.equals(name1)||app_class.equals(name)){
	 		 	List<String> list3=cs.day_app_member();
			    List<String> list4 =new ArrayList<String>();
			    List<String> list5 =new ArrayList<String>();
			    for(int i=0;i<list3.size();i=i+2){
			    	list4.add(list3.get(i));
			    	list5.add(list3.get(i+1));
			    }
			    out.println("<select_app>");
			    out.println(list4);
			    out.println("</select_app>");
			    out.println("<select_values>");
			  	out.println(list5);
			  	out.println("</select_values>");
			 }else{
			 	 List<String> list=cs.day_app_user(app_class);
			    List<String> list1 =new ArrayList<String>();
			    List<String> list2 =new ArrayList<String>();
			    for(int i=0;i<list.size();i=i+2){
			    	list1.add(list.get(i));
			    	list2.add(list.get(i+1));
			    }
			    out.println("<select_app>");
			    out.println(list1);
			    out.println("</select_app>");
			    out.println("<select_values>");
			  	out.println(list2);
			  	out.println("</select_values>");
		      }
		  }else{
		        if(app_class.equals(name1)||app_class.equals(name)){
		                	List<String> list3=cs.month_app();
						    List<String> list4 =new ArrayList<String>();
						    List<String> list5 =new ArrayList<String>();
						    for(int i=0;i<list3.size();i=i+2){
						    	list4.add(list3.get(i));
						    	list5.add(list3.get(i+1));
						    }
						    out.println("<select_app>");
						    out.println(list4);
						    out.println("</select_app>");
						    out.println("<select_values>");
						  	out.println(list5);
						  	out.println("</select_values>");
		        }else{
		        			List<String> list=cs.month_class(app_class);
						    List<String> list1 =new ArrayList<String>();
						    List<String> list2 =new ArrayList<String>();
						    for(int i=0;i<list.size();i=i+2){
						    	list1.add(list.get(i));
						    	list2.add(list.get(i+1));
						    }
						    out.println("<select_app>");
						    out.println(list1);
						    out.println("</select_app>");
						    out.println("<select_values>");
						  	out.println(list2);
						  	out.println("</select_values>");  
		        }
		    }
	 	
  
%>  
</body>
</html>
