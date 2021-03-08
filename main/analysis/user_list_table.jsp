<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="analysis.user_list" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/jPages.css" type="text/css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jPages.js"></script>
    
    <script type="text/javascript" src="/js/sorttable.js"></script>
    
	<style type="text/css">  
	#pageStyle{
	 display:inline-block;
	 width:32px;
	 height:32px;
	 border:1px solid #CCC;
	 line-height:32px;
	 text-align:center;
	 color:#999;
	 margin-top:20px;
	 text-decoration:none;
 
	 }
  #pageStyle:hover{
	  background-color:#CCC;
	  }
  #pageStyle .active{
	  background-color:#0CF;
	  color:#ffffff;
	  }	
	</style>
	
		<script>
		$(function(){
	 var $table = $('table');
	 var currentPage = 0;//当前页默认值为0
	 var pageSize = 5;//每一页显示的数目
	 $table.bind('paging',function(){
		 $table.find('tbody tr').hide().slice(currentPage*pageSize,(currentPage+1)*pageSize).show();
	 });	 
	 var sumRows = $table.find('tbody tr').length;
	 var sumPages = Math.ceil(sumRows/pageSize);//总页数
	 
	 var $pager = $('<div class="page"></div>');  //新建div，放入a标签,显示底部分页码
	 for(var pageIndex = 0 ; pageIndex<sumPages ; pageIndex++){
		 $('<a href="#" id="pageStyle" onclick="changCss(this)"><span>'+(pageIndex+1)+'</span></a>').bind("click",{"newPage":pageIndex},function(event){
			 currentPage = event.data["newPage"];
			 $table.trigger("paging");
			   //触发分页函数
			 }).appendTo($pager);
			 $pager.append(" ");
		 }	 
		 $pager.insertAfter($table);
		 $table.trigger("paging");
		 
		 //默认第一页的a标签效果
		 var $pagess = $('#pageStyle');
		 $pagess[0].style.backgroundColor="#006B00";
		 $pagess[0].style.color="#ffffff";
});
 
//a链接点击变色，再点其他回复原色
        
      function changCss(obj){
	var arr = document.getElementsByTagName("a");
	for(var i=0;i<arr.length;i++){	
	 if(obj==arr[i]){       //当前页样式
	  obj.style.backgroundColor="#006B00";
	  obj.style.color="#ffffff";
	}
	 else
	 {
	   arr[i].style.color="";
	   arr[i].style.backgroundColor="";
	 }
	}
 }	  
	
	</script>
	
</head>

<body>
<div style="width:100%;height:450px" align="center">
<p align="center"  style="font-size:20px;"><strong>用&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;&nbsp;&nbsp;情&nbsp;&nbsp;&nbsp;&nbsp;况&nbsp;&nbsp;&nbsp;&nbsp;表</strong></p>


<table width="1200px" height="400px" border="1" align="center" style="font-family: verdana,arial,sans-serif;font-size:11px;color:#333333;border-width: 1px;border-color: #666666;border-collapse: collapse;">
	<thead>
		<tr>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">白名单</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;">灰名单</th>
			<th width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #dedede;"><span class="sort_able">黑名单</th>
		</tr>
	</thead>
	
	<tbody id="movies">

<%    
         user_list ud=new user_list();
         List<String> list=ud.list();
         for(int i=0;i<list.size();i=i+3){
     %>
        <tr>
        	<td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+1)%></td>
             <td width="200px" style="border-width: 1px;padding: 8px;border-style: solid;border-color: #666666;background-color: #ffffff;"><%=list.get(i+2)%></td>
             
     	</tr>
      <%
          }
       %>

</tbody>
</table>
</div>

</body>

</html>