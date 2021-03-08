<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
String resp_ip="";
resp_ip=request.getParameter("ip");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<% 
     String ip=resp_ip;
     int index=ip.lastIndexOf(".");
     int a=Integer.parseInt(ip.substring(index+1,ip.length()));
      String result="";
	        if(a%3==0){
	        	result="['辽宁卫视', '陕西卫视', '武汉文艺频道', '宁夏卫视', '内蒙古卫视'][('10.185.152.10', 1.00), ('10.185.171.19', 1.00), ('10.185.139.77', 1.00), ('10.185.174.254', 1.00), ('10.185.183.109', 1.00), ('10.185.132.119', 1.00), ('10.185.186.100', 1.00), ('10.185.190.89', 1.00), ('10.185.155.248', 1.00), ('10.185.141.220', 1.00), ('10.185.138.140', 1.00), ('10.185.138.142', 1.00), ('10.185.166.55', 1.00), ('10.185.153.232', 1.00), ('10.185.161.157', 1.00)]";
	        }else if(a%3==1){
	        	result="['贵州卫视', '湖北职业指南', '武汉科教生活', '武汉教育频道'][('10.185.148.2', 1.00), ('10.185.181.15', 1.00), ('10.185.155.236', 1.00), ('10.185.193.252', 1.00), ('10.185.182.48', 1.00), ('10.185.139.117', 1.00), ('10.185.172.102', 1.00), ('10.185.157.9', 1.00), ('10.185.125.247', 1.00), ('10.185.197.210', 1.00), ('10.185.148.27', 1.00), ('10.185.154.141', 1.00), ('10.185.177.93', 1.00), ('10.185.183.231', 1.00), ('10.185.164.153', 1.00)]";
	        }else{
	        	result="['甘肃卫视', '湖北综合频道', '广西卫视', '延边卫视', '新疆卫视'][('10.185.150.13', 1.00), ('10.185.121.19', 1.00), ('10.185.147.234', 1.00), ('10.185.114.27', 1.00), ('10.185.246.99', 1.00), ('10.185.192.123', 1.00), ('10.185.194.105', 1.00), ('10.185.126.15', 1.00), ('10.185.193.267', 1.00), ('10.185.129.87', 1.00), ('10.185.197.48', 1.00), ('10.185.119.81', 1.00), ('10.185.138.285', 1.00), ('10.185.161.51', 1.00), ('10.185.134.60', 1.00)]";
	        }
            String regex = "^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\."+
	                      "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."+
	                      "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\."+
	                      "(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$";
            if(ip.matches(regex)){
           
 %>
<cs>
<div  style="width:100%;height:100px ;" align="center">
<table width="60%";height="700px"  border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
	<thead>
		<tr>
		    <th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">推荐的APP</th>
		</tr>
	</thead>
	
	<tbody id="sum">
<%          
         
          String state = result.substring(result.indexOf("[")+1,result.indexOf("]"));
           String[] list1=state.split(",");
           List<String> list= new ArrayList<String>();
           for (String str : list1){
                str=str.replaceAll("'","");
					list.add(str);
					} 
		  	for(int i=0;i<list.size();i++){
     %>
        <tr>
             <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list.get(i) %></td>
     	</tr>
     	 <%
          }
       %>
       </tbody>
</table>
</div> 
</cs> 
<cc>
<div  style="width:100%;height:100px ;" align="center">
<table width="60%";height="700px"  border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
	<thead>
		<tr>
			<th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">用户名</th>
		    <th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">相似用户IP</th>
		    <th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">相似系数</th>
		</tr>
	</thead>
	
	<tbody id="sum">
<%           
          String user_ip = result.substring(result.indexOf("[(")+1,result.indexOf(")]"));
           String[] list2=user_ip.split(","); 
           List<String> list3= new ArrayList<String>();
           for (String str : list2){
                   str=str.replaceAll("(\\(')*(\\))*'*","");
					list3.add(str);
					} 
		  	for(int i=0;i<list3.size();i=i+2){
		  	 double value=Double.parseDouble(list3.get(i+1));
     %>
        <tr>
        	 <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">用户<%=(i/2)+1 %></td>
             <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=list3.get(i) %></td>
             <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%=new Formatter().format("%.2f", value).toString() %></td>
     	</tr>
     	 <%
          }
       %>
       </tbody>
</table>
</div> 
</cc>
<%
           }else{
				  out.println("您查询的用户不存在！");
				 }
 %>
</body>
</html>