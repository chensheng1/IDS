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
            var url = "main_current_ajax.jsp";  
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
            var conn1 = XMLHttpReq.responseXML.getElementsByTagName("Mainsum_time");  
            var conn2=conn1[0].childNodes[0].nodeValue.replace("]","");
          		conn2=conn2.replace("[","");
          		conn2=conn2.substring(1,conn2.length);
          	var time=conn2.split(",");
          	
          	var traff1 = XMLHttpReq.responseXML.getElementsByTagName("Mainsum_in");  
            var traff2=traff1[0].childNodes[0].nodeValue.replace("]","");
          		traff2=traff2.replace("[","");
          	var traffresult=traff2.split(",");
          	
          	var myChart = echarts.init(document.getElementById('main'));
	        var option = {
		        		title: {
				        text: '下行流量图(每小时)'
				   	 },
					    tooltip : {
					        trigger: 'axis',
					    },
					    legend: {
					        data:['下行流量(M)']
					    },
					    toolbox: {
					        show : true,
					        feature : {
					            mark : {show: true},
					            dataView : {show: true, readOnly: false},
					            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
					            restore : {show: true},
					            saveAsImage : {show: true}
					        }
					    },
					    calculable : true,
					    xAxis : [
					        {
					            type : 'category',
					            boundaryGap : false,
					            data : time
					        }
					    ],
					    yAxis : [
					        {
					        	
					            type : 'value',
					        }
					    ],
					    series : [
					        {
					            name:'下行流量(M)',
					            type:'line',
					            stack: '总量',
					            itemStyle: {normal: {areaStyle:{
					            								type: 'default',
					            								color:'#0080FF',
					            								}
					            							}},
					            data: traffresult,
					        },
					    ]
					};
					myChart.setOption(option);
        }
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="main" style="width: 100%;height:400px"></div>
    </body>  
</html>