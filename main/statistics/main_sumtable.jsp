<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="statistics.main_select" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/jPages.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jPages.js"></script>
</head>
<body>
</head>
<body>
<div style="width:100%;height:350px" align="center">


<table width="100%" height="300px" border="1" align="center" >
	<thead>
		<tr>
			<th width="200px">时间</th>
			<th width="200px">日志大小</th>
			<th width="200px">连接数</th>
			<th width="200px">流量大小</th>
			<th width="200px">上行流量</th>
			<th width="200px">下行流量</th>
		</tr>
	</thead>
	
	<tbody id="sum">

<%    
         main_select cs=new main_select();
         List<String> list=cs.selectdata();
         	for(int i=0;i<list.size();i=i+6){
     %>
        <tr>
             <td width="200px"><%=list.get(i)%></td>
             <td width="200px"><%=list.get(i+1)%></td>
             <td width="200px"><%=list.get(i+2)%></td>
             <td width="200px"><%=list.get(i+3)%></td>
             <td width="200px"><%=list.get(i+4)%></td>
             <td width="200px"><%=list.get(i+5)%></td>
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
    containerID : "sum"
  });
});
	</script>
</html>