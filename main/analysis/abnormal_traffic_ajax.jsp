<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="analysis.abnormal_traffic" %>
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
   abnormal_traffic cs =new abnormal_traffic();
   List<String> list =cs.abnormal();
    List<String> list1 =new ArrayList<String>();
    List<String> list2=new ArrayList<String>();
    List<String> list3=new ArrayList<String>();
    List<String> list4=new ArrayList<String>();
    List<String> list5=new ArrayList<String>();
    List<String> list6=new ArrayList<String>();
    List<String> list7=new ArrayList<String>();
    List<String> list8=new ArrayList<String>();
    List<String> list9=new ArrayList<String>();
    List<String> list10=new ArrayList<String>();
    for(int i=0;i<list.size();i=i+15){
        list1.add(list.get(i+2));
   // 	list2.add(list.get(i+1));
    	list3.add(list.get(i));
   //     list4.add(list.get(i+4));
        list5.add(list.get(i+3));
   //     list6.add(list.get(i+7));
        list7.add(list.get(i+6));
   //     list8.add(list.get(i+10));
        list9.add(list.get(i+9));
        list10.add(list.get(i+12));
    }
    out.println("<abnormal_time>");
    out.println(list1);
    out.println("</abnormal_time>");
    out.println("<abnormal_c>");
  	out.println(list3);
  	out.println("</abnormal_c>");
  	out.println("<abnormal_l>");
  	out.println(list5);
  	out.println("</abnormal_l>");
  	out.println("<abnormal_h>");
  	out.println(list7);
  	out.println("</abnormal_h>");
    out.println("<abnormal_m>");
  	out.println(list9);
  	out.println("</abnormal_m>");
  	out.println("<abnormal_d>");
  	out.println(list10);
  	out.println("</abnormal_d>");
%>  

</body>
</html>
