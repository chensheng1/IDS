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
            var url = "MAC_number_ajax.jsp";  
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
            //读取Main_ajax.jsp里面的连接数的值
            var conn1 = XMLHttpReq.responseXML.getElementsByTagName("MAC");  
            var conn2=conn1[0].childNodes[0].nodeValue.replace("]","");
          		conn2=conn2.replace("[","");
          	var conn3=conn2.split(",");
          	//读取Main_ajax.jsp里面流量的大小
          	var traff1 = XMLHttpReq.responseXML.getElementsByTagName("number");  
            var traff2=traff1[0].childNodes[0].nodeValue.replace("]","");
          		traff2=traff2.replace("[","");
          	var traff3=traff2.split(",");
          	//读取Main_ajax.jsp里面的上行流量
   
   			var myChart = echarts.init(document.getElementById('main'));
		var option = {
				    title: {
				        text: '路   由   层    数   Top  图',
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
				     yAxis: {
				        type: 'category',
				    	data:conn3 ,
				    	},
				    xAxis: {
				        type: 'value',
				        boundaryGap: [0, 0.01]
				    },
				  
				    series: [
				        {	
				        	name:'层数',
				            type: 'bar',
				            data:traff3 ,
				        },
				        
				    ]
				};
		myChart.setOption(option);
        }
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="main" style="width: 100%;height:800px"></div>
    </body>  
</html>