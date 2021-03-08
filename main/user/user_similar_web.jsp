<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.user_similar_web" %> 
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
           user_similar_web cs = new user_similar_web();
           String result=cs.exec(ip);
           String select="00";
            if(result.equals(select)){
                //   out.println("<ip_result>");
				  //  out.println(result);
				  out.println("您查询的用户不存在！");
				 //   out.println("</ip_result>");
           }else{
           
 %>
<cs>
<div  style="width:100%;" align="center">
<table width="60%"  border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
	<thead>
		<tr>
		    <th width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;">推荐的网页 </th>
		</tr>
	</thead>
	
	<tbody id="sum">
<%           
           
       String state = result.substring(result.indexOf("[")+1,result.indexOf("]"));
        String[] list1=state.split(",");
        List<String> list= new ArrayList<String>();
        for (String str : list1){
             str=str.replaceAll("'","");
             String str1="";
             String str2="";
             int i=0;
            while(i<str.length()){
            	 if(str.charAt(i)=='\\'){ 
                  str1=str.substring(i+2,i+4)+str.substring(i+6,i+8)+str.substring(i+10,i+12);
                  str2=str2+cs.hexToStringGBK(str1);
                  i=i+12;
             }
            else{
            	str1=str.substring(i,i+1);
            	str2+=str1;
            	i++;
            }
        }
			  list.add(str2);
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
<div  style="width:100%;" align="center">
<table width="60%"   border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;" >
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
             <td width="80px" height="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;text-align:center;font-size:15px;"><%= new Formatter().format("%.2f", value).toString() %></td>
     	</tr>
     	 <%
          }
       %>
       </tbody>
</table>
</div> 
</cc>
 <%
          }
       %>
</body>
</html>