<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.file" %>
<%@ page import="java.util.*" %>
<%
String firsttime="";
String lasttime="";
String user_ip="";
firsttime=request.getParameter("start");
lasttime=request.getParameter("end");
user_ip=request.getParameter("ip");
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
    file cs=new file();
    List<String> list=cs.time_file(first,last);
    List<String> list1 =new ArrayList<String>();
    List<String> list2 =new ArrayList<String>();
    for(int i=0;i<list.size();i=i+2){
    	list1.add(list.get(i));
    	list2.add(list.get(i+1));
    }
    out.println("<file>");
    out.println(list1);
    out.println("</file>");
    out.println("<file_values>");
  	out.println(list2);
  	out.println("</file_values>");

  	List<String> list3=cs.time_hashfile(first,last);
    List<String> list4 =new ArrayList<String>();
    List<String> list5 =new ArrayList<String>();
    for(int i=0;i<list3.size();i=i+2){
    	list4.add(list3.get(i));
    	list5.add(list3.get(i+1));
    }
    out.println("<file_name>");
    out.println(list4);
    out.println("</file_name>");
    out.println("<hash_values>");
  	out.println(list5);
  	out.println("</hash_values>");
%>  

<cs>
<div  style="width:100%;" align="center">
<table width="80%"  border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
	<thead>
	<tr>
		<th scope="col" colspan="9" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:20px;">用户文件</th>
		</tr>
		<tr>
		    <th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">源IP</th>
			<th width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">目标IP</th>
			<th width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">文件类型</th>
			<th width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">文件名</th>
			<th width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">下载次数</th>
		</tr>
	</thead>
	
	<tbody id="sum">

<%    
           String user=user_ip;
		  	List<String> list6=cs.file_select_user(first,last,user);
		  	 for(int i=0;i<list6.size();i=i+5){
     %>
        <tr>
             <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list6.get(i) %></td>
             <td width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list6.get(i+1)%></td>
             <td width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list6.get(i+2)%></td>
             <td width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list6.get(i+3)%></td>
             <td width="30px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list6.get(i+4)%></td>
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