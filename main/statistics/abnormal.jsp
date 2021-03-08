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
            var url = "abnormal_ajax.jsp";  
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
        	//取得时间
        	var time = XMLHttpReq.responseXML.getElementsByTagName("abnormal_time");  
            var time2=time[0].childNodes[0].nodeValue.replace("]","");
          		time2=time2.replace("[","");
          		time2=time2.substring(1,time2.length);
          	var main_time=time2.split(",");
        	//取得log文件的大小
            var log = XMLHttpReq.responseXML.getElementsByTagName("abnormal_conn");  
            var log2=log[0].childNodes[0].nodeValue.replace("]","");
          		log2=log2.replace("[","");
          	var main_log=log2.split(",");
          	//取得流量的大小
          	var traff= XMLHttpReq.responseXML.getElementsByTagName("abnormal_high");  
            var traff2=traff[0].childNodes[0].nodeValue.replace("]","");
          		traff2=traff2.replace("[","");
          	var main_traff=traff2.split(",");
          	//取得连接数的次数
          	var conn= XMLHttpReq.responseXML.getElementsByTagName("abnormal_low");  
            var conn2=conn[0].childNodes[0].nodeValue.replace("]","");
          		conn2=conn2.replace("[","");
          	var main_conn=conn2.split(",");
          	
          	var flow= XMLHttpReq.responseXML.getElementsByTagName("abnormal_flow");  
            var flow2=flow[0].childNodes[0].nodeValue.replace("]","");
          		flow2=flow2.replace("[","");
          	var main_flow=flow2.split(",");
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main_sum'));
		var	option = {
				    title : {
				        text: '',
				    },
				    tooltip : {
				        trigger: 'axis',
				    },
				    legend: {
				        data:['连接数(单位：条)','上行流量(单位：kb)','下行流量(单位：kb)','流量大小(单位：kb)'],
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true},
				        },
				    },
				    calculable : true,
				    grid: {
				        left: '3%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true,
				    },
				    xAxis : [
				        {
				            type : 'category',
				            data :main_time,
				           
				        },
				    ],
				    yAxis: {
				        type: 'value',
				        boundaryGap: [0, 0.01],
				    },
				    series : [
				         {
				            name:'连接数(单位：条)',
				            type:'bar',
				            data:main_log,
				        },
				        {
				            name:'上行流量(单位：kb)',
				            type:'bar',
				            data:main_traff,
				        	},
				        {
				            name:'下行流量(单位：kb)',
				            type:'bar',
				            data:main_conn,
				            },
				       {
				            name:'流量大小(单位：kb)',
				            type:'bar',
				            data:main_flow,
				            }
				    ]
				};
                    
	        myChart.setOption(option);
	        }
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="main_sum" style="width: 100%;height:400px"></div>
    </body>  
</html>