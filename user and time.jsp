<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user and time.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  <script language="javascript">
  function get_time()
  {
    var date=new Date();
    var year="",month="",day="",week="",hour="",minute="",second="";
    year=date.getFullYear();     
    month=add_zero(date.getMonth()+1);
    day=add_zero(date.getDate());
    week=date.getDay();
    switch (date.getDay()) {
    case 0:val="星期天";break;
    case 1:val="星期一";break;
    case 2:val="星期二";break;
    case 3:val="星期三";break;
    case 4:val="星期四";break;
    case 5:val="星期五";break;
    case 6:val="星期六";break;
      }
    hour=add_zero(date.getHours());
    minute=add_zero(date.getMinutes());
    second=add_zero(date.getSeconds());
    timetable.innerText=""+year+"年"+month+"月"+day+"日"+hour+":"+minute+":"+second+val;
  }

  function add_zero(temp)
  {
    if(temp<10) return "0"+temp;
    else return temp;
  }
setInterval("get_time()",1000);
  </script>


  </head>
  
  <body>
       <%
           session.setAttribute("username","admin");
           session.setMaxInactiveInterval(60);
        %>
  <p dir="rtl">
  <%=session.getAttribute("username") %>&nbsp;<img src="images/admin.png" width="20" height="20"/>&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="images/clock.png" width="20" height="20"/>&nbsp;<b id="timetable"></b>
   </p>
  </body>
</html>
