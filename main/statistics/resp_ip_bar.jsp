<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>Insert title here</title>
<script language="javascript">  
    var XMLHttpReq;
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
        //发送请求函数  
        function sendRequest() {  
            createXMLHttpRequest();  
            var url = "resp_ip_ajax.jsp";  
            XMLHttpReq.open("GET", url, true);  
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数  
            XMLHttpReq.send(null);  // 发送请求  
        }  
        // 处理返回信息函数  
        function processResponse() {  
            if (XMLHttpReq.readyState == 4) { // 判断对象状态  
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息  
                    DisplayHot();  
                    setTimeout("sendRequest()", 3600000);  
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function DisplayHot() {  
            var nameIP = XMLHttpReq.responseXML.getElementsByTagName("resphour");  
            var nameIP2=nameIP[0].childNodes[0].nodeValue.replace("]","");
          		nameIP2=nameIP2.replace("[","");
          	var resp_some=nameIP2.split(",");
                // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('res_hour'));
		var option = {
				    title: {
				        text: '目标IP实时图(每小时)',
				        x:'40%'
				    },
				    tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'shadow'
				        }
				    },
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				     xAxis: {
				        type: 'category',
				    	data: (function (){  
		                var now = new Date(); 
		                var h=now.getHours();
		                var res = [];  
		                var len = 5;  
		                while (len--) {  
		                    res.unshift(h+':00'); 
		                    h = h - 1; 
		                }  
		                return res;  
		            })() ,
				    	},
				    yAxis: {
				        type: 'value',
				        boundaryGap: [0, 0.01]
				    },
				  
				    series: [
				        {	
				        	name:'流量大小(单位:KB)',
				            type: 'bar',
				            data: resp_some,
				        },
				    ]
				};
	        myChart.setOption(option);
      
        }
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="res_hour" style="width: 100%;height:400px"></div>
    </body>  
</html>