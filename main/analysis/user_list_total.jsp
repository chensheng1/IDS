<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
	  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
	  
	  <script src="../../js/excellentexport.min.js"></script>

	<style type="text/css">
	#select{
		width:100%;
		height:30px;
		position: relative;
		padding-top: 20px;
		padding-bottom: 15px;
		z-index: 2;
		color: #323437;
	}
	#select_html1{
	    width:100%;
		height:550px;
	}
  
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
	var XMLHttpReq;
    var url; 
        //创建XMLHttpRequest对象         
        function createXMLHttpRequest() {  
            if(window.XMLHttpRequest) { //Mozilla 浏览器  
                XMLHttpReq = new XMLHttpRequest();  
            }  
            else if (window.ActiveXObject) { // IE浏览器  
                try {  
                    XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");  
                } catch (e) {  
                    try {  
                        XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");  
                    } catch (e) {}  
                }  
            }  
        }  


 		function send() {
            createXMLHttpRequest(); 
            var url = "user_select_list.jsp?user="+document.getElementById('pro').value;
            XMLHttpReq.open("GET", url, true);  
            XMLHttpReq.onreadystatechange = process;//指定响应函数  
            XMLHttpReq.send(null);
        } 
        
        // 处理返回信息函数  
        function process() {  
            if (XMLHttpReq.readyState == 4) { // 判断对象状态  
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息  
                    Display();   
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function Display() { 
          	
        var select_table = XMLHttpReq.responseText;
		cs_index=select_table.indexOf("<cs>", 0);
		cs_index2=select_table.indexOf("</cs>", 0);
		select_table=select_table.substring(cs_index, cs_index2);
        document.getElementById("select_html1").innerHTML=select_table;
		
	
	return ExcellentExport.excel(this, 'chen', 'Sheet Name Here');
 }	  
	</script>
  
  </head>
  
  <body>
  	<div id="select">
  		 	&nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;
		   <span >选择名单类型：</span>
	       <select  name="pro"  id="pro" style="width:8%;height:25px;">
	    		   <option value="*">名单</option>
				   <option value="white">白名单</option>
				   <option value="gray">灰名单</option>
				   <option value="black">黑名单</option>
	    	 </select>
	    	  &nbsp;&nbsp;&nbsp;&nbsp;
		    &nbsp;&nbsp;&nbsp;&nbsp;
	    	 <input type="submit" name="select" value="查询" onClick="send()" >
	    	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <a download="用户名单情况表.xls" href="#" onclick="return ExcellentExport.excel(this, 'chen', 'Sheet Name Here');">导出Excel</a>
  	</div>
   <div id="select_html1">
         <iframe src="user_list_table.jsp" width=100% height=100% scrolling="no" frameborder="0"> </iframe>
   </div>
  </body>
</html>
