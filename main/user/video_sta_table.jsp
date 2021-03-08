<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.video_sta" %> 
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<div style="width:100%;height:100px">

<table width="100%" height="100px"  align="center" >
	<thead>
		<tr>
			<th width="20px"></th>
			<th width="20px">浏览用户</th>
			<th width="20px">服务数</th>
			<th width="20px">频道数</th>
			<th width="20px">新用户</th>
			<th width="20px">平均观看时长(/小时)</th>
		</tr>
	</thead>
	
	<tbody align="center">

<%    
         video_sta ud=new video_sta();
         List<String> list=ud.M_table();
         for(int i=0;i<list.size();i=i+5){
     %>
     	<tr>
     		<td width="20px">早高峰</td>
     		 <td width="20px"><%=list.get(i)%></td>
     		 <td width="20px"><%=list.get(i+1)%></td>
     		 <td width="20px"><%=list.get(i+2)%></td>
     		 <td width="20px"><%=list.get(i+3)%></td>
     		 <td width="20px"><%=list.get(i+4)%></td>
     	</tr>
<%
	}
 %>
 
 <%    
         List<String> list1=ud.A_table();
         for(int i=0;i<list1.size();i=i+5){
     %>
 
        <tr>
        	 <td width="20px">午高峰</td>
             <td width="20px"><%=list1.get(i)%></td>
     		 <td width="20px"><%=list1.get(i+1)%></td>
     		 <td width="20px"><%=list1.get(i+2)%></td>
     		 <td width="20px"><%=list1.get(i+3)%></td>
     		 <td width="20px"><%=list1.get(i+4)%></td>
     	</tr>
     	<%
	}
 %>
 
 <%    
         List<String> list2=ud.E_table();
         for(int i=0;i<list2.size();i=i+5){
     %>
     	 <tr>
        	 <td width="20px">晚高峰</td>
             <td width="20px"><%=list2.get(i)%></td>
     		 <td width="20px"><%=list2.get(i+1)%></td>
     		 <td width="20px"><%=list2.get(i+2)%></td>
     		 <td width="20px"><%=list2.get(i+3)%></td>
     		 <td width="20px"><%=list2.get(i+4)%></td>
     	</tr>
<%
	}
 %>	
       
	
</tbody>
</table>
</div>
</body>
</html>