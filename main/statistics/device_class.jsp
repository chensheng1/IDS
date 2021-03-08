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
            var url = "device_class2_ajax.jsp";  
            XMLHttpReq.open("GET", url, true);  
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数  
            XMLHttpReq.send(null);  // 发送请求  
        }  
        // 处理返回信息函数  
        function processResponse() {  
            if (XMLHttpReq.readyState == 4) { // 判断对象状态  
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息  
                    DisplayHot();   
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function DisplayHot() {  
        	 var device = XMLHttpReq.responseXML.getElementsByTagName("device_name"); 
            var device1 = XMLHttpReq.responseXML.getElementsByTagName("device_values"); 
          	var device2=device[0].childNodes[0].nodeValue.replace("]","");
          	device2=device2.replace("[","");
          	device2=device2.substring(1,device2.length);
            var device_name=device2.split(",");
          	
      		var device3=device1[0].childNodes[0].nodeValue.replace("]","");
          	device3=device3.replace("[","");
            var device_values=device3.split(",");
		        // 指定图表的配置项和数据
		     var myChart = echarts.init(document.getElementById('device'));
		
		         // 指定图表的配置项和数据
		      var option = {
				    title: {
				        text: '终端设备统计',
				        x:'40%'
				    },
				    
				    tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'shadow'
				        }
				    },
				    grid: {
				        y2:140
				    },
				     xAxis: {
				        type: 'category',
				    	data: device_name,
				    	 axisLabel: {
							            interval: 0,
							            rotate: -30
							        },
							        splitLine: {
							            show: true
							        }
				    	},
				    yAxis: {
				        type: 'value',
				        boundaryGap: [0, 0.01]
				    },
				  
				    series: [
				        {	
				        	name:'使用人数',
				            type: 'bar',
				            data: device_values,
				        },
				    ]
				};
	        myChart.setOption(option);
        }  

    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="device" style="width: 100%;height:500px"></div>
    </body>  
</html>