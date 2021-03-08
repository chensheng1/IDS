<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="statistics.device_count" %>
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
			<th width="20px">设备数量(/台)</th>
			<th width="20px">设备种类(/种)</th>
			<th width="20px">IP数(/个)</th>
			<th width="20px">使用平均时长(/分钟)</th>
		</tr>
	</thead>
	
	<tbody align="center">

<%    
		 device_count cs=new device_count();
     %>
     	<tr>
     		<td width="20px">今日</td>
     		 <td width="20px"><%=cs.current_browse()%></td>
     		 <td width="20px"><%=cs.current_kind()%></td>
     		 <td width="20px"><%=cs.current_IP()%></td>
     		 <td width="20px"><%=cs.current_device_time()%></td>
     	</tr>
        <tr>
        	 <td width="20px">昨日</td>
             <td width="20px" ><%=cs.yesterday_browse()%></td>
             <td width="20px" ><%=cs.yesterday_kind()%></td>
             <td width="20px" ><%=cs.yesterday_IP()%></td>
             <td width="20px" ><%=cs.yesterday_device_time()%></td>
     	</tr>
     	
       
	
</tbody>
</table>
</div>
</body>
</html>