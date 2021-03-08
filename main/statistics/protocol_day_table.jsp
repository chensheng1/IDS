<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="statistics.protocol_table" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ch">
<head>
    
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/jPages.css" type="text/css" rel="stylesheet"></link>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jPages.js"></script>
    
     <script type="text/javascript" src="sorttable.js"></script>
    
	<style type="text/css">  
	.sort_able{cursor:pointer;padding:0 28px;background:url(small.gif) no-repeat right center;}
	.sort_asc{background:url(asc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}
	.sort_desc{background:url(desc.png) no-repeat right center;color:#ffffff;cursor:pointer;padding:0 28px;}
	</style>
</head>
<body>

<div style="width:100%;height:380px" align="center">
<p align="center"  style="font-size:15px;"><strong>当&nbsp;&nbsp;&nbsp;&nbsp;天&nbsp;&nbsp;&nbsp;&nbsp;协&nbsp;&nbsp;&nbsp;&nbsp;议&nbsp;&nbsp;&nbsp;&nbsp;统&nbsp;&nbsp;&nbsp;&nbsp;计&nbsp;&nbsp;&nbsp;&nbsp;表</strong></p>

<table width="90%" height="350px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
	<thead>
		<tr>
			<th width="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">协议</th>
			<th width="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">上行流量(单位:字节)</th>
			<th width="50px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">下行流量(单位:字节)</th>
		</tr>
	</thead>
	
	<tbody id="movies">

<%    
         protocol_table cs=new protocol_table();
         List<String> list=cs.protocol();
         	for(int i=0;i<list.size();i=i+3){
     %>
        <tr>
             <td width="50px" style="border-width: 1px;padding: 6px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i)%></td>
             <td width="50px" style="border-width: 1px;padding: 6px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+1)%></td>
             <td width="50px" style="border-width: 1px;padding: 6px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+2)%></td>
     	</tr>
     	 <%
          }
       %>
</tbody>
</table>
</div>
<div class="holder" align="center">
    <a class="jp-previous jp-disabled">← previous</a>
    <a class="jp-current">1</a>
    <span class="jp-hidden">...</span>
    <a>2</a>
    <a>3</a>
    <a>4</a>
    <a>5</a>
    <a class="jp-hidden">6</a>
    <a class="jp-hidden">7</a>
    <a class="jp-hidden">8</a>
    <a class="jp-hidden">9</a>
    <span>...</span>
    <a>10</a>
    <a class="jp-next">next →</a>
</div>
</body>
<script type="text/javascript">
	$(function(){
  $("div.holder").jPages({
    containerID : "movies"
  });
});
	</script>
</body>
</html>