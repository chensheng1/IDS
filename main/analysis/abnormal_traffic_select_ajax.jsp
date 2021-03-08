<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="analysis.abnormal_traffic" %>
<%@ page import="java.util.*" %>
<%
String first="";
String last="";
String user="";
first=request.getParameter("start");
last=request.getParameter("end");
user=request.getParameter("ip");
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
    String firsttime=first;
    String lasttime=last;
   abnormal_traffic cs =new abnormal_traffic();
   List<String> list =cs.abnormal_select(firsttime,lasttime);
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
        list1.add(list.get(i));
   // 	list2.add(list.get(i+1));
    	list3.add(list.get(i+2));
   //     list4.add(list.get(i+4));
        list5.add(list.get(i+5));
   //     list6.add(list.get(i+7));
        list7.add(list.get(i+8));
   //     list8.add(list.get(i+10));
        list9.add(list.get(i+11));
        list10.add(list.get(i+14));
    }
    out.println("<abnormal_time>");
    out.println(list1);
    out.println("</abnormal_time>");
    out.println("<abnormal_d>");
  	out.println(list10);
  	out.println("</abnormal_d>");
    out.println("<abnormal_c>");
  	out.println(list9);
  	out.println("</abnormal_c>");
  	out.println("<abnormal_l>");
  	out.println(list7);
  	out.println("</abnormal_l>");
  	out.println("<abnormal_h>");
  	out.println(list5);
  	out.println("</abnormal_h>");
    out.println("<abnormal_m>");
  	out.println(list3);
  	out.println("</abnormal_m>");
  	

%>  

<cs>
<div  style="width:100%;" align="center">

<table width="40%"  border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
	<thead>
	<tr>
		<th scope="col" colspan="9" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:20px;">IP异常流量</th>
		</tr>
		<tr>
			<th width="30px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">时间</th>
			<th width="30px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">异常类型</th>
			<th width="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">流量大小</th>
		</tr>
	</thead>
	
	<tbody id="sum">

<%    
		String orig_ip=user;
         List<String> list11=cs.abnormal_select_ip(firsttime,lasttime,orig_ip);
         	for(int i=0;i<list11.size();i=i+3){
     %>
        <tr>
             <td width="30px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list10.get(i)%></td>
             <td width="30px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list10.get(i+1)%></td>
             <td width="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list10.get(i+2)%></td>
     	</tr>
     	 <%
          }
       %>
       </tbody>
</table>
</div> 
</cs> 

</body>
</html>
