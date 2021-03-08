<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
        function login(form){
            if(form.username.value == ""){
                alert("用户不能为空！");
                return false;
            }
            if(form.password.value == ""){
                alert("密码不能为空！");
                return false;
            }

        }
    </script>
    
<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
   alert("登录失败,用户名或密码错误!");
  }
</script>
	<style type="text/css">
	#container{
		margin:0px auto;
		<%--background-image:url(images/login.jpg);--%>
		
	}

	#space{
		margin:0px auto;
		margin-top:15px;
		margin-left:140px;
		text-align:center;
		<%--border:1px solid #a1a1a1;
		padding:5px  3px; 
		width:50px;
		border-radius:100px;--%>
		<%--background-image:url(images/login.jpg);--%>
	}
	input[type="text"]{
		broder:2px solid #a1a1a1 ;
		width:130px;
		dispaly:block;
		border-radius:5px;
		border-color:black;
	}
	input[type="password"]{
		broder:2px solid #a1a1a1 ;
		width:130px;
		dispaly:block;
		border-radius:5px;
		border-color:black;
	}
	#logo{
	margin:0px auto;
	margin-top:180px;
	padding:10px;
	height:100px;
	width:120px;
	<%--box-shadow: 1px 1px 1px  blue;--%>
	}
	#distance{
		margin:0px auto;
		margin-top:15px;	
	}
	</style>
  </head>
  



  <body bgcolor="#5B5B5B">
  <div id="container" >
 
    	<form action="login" method="post" onSubmit="return login(this);">
   		<div id="logo">
   		<img src="images/ruqin.png" >
   		</div>
   		
   		<div id="distance" align='center'  >
    	<label><b>用&nbsp;户&nbsp;名&nbsp;&nbsp;</b></label>
    	<input type="text" name="username" value="">
    	</div>
  		
  		<div id="distance" align='center'>
    	<label><b>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;</b></label>
    	<input type="password" name="password" value="">
    	</div>
    	
    	<div id="space" align="justify">
    	<input type="submit" value="登录" >
    
    	</div>
    	</form>

   </div>
  </body>
</html>

