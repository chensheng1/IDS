<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>Insert title here</title>
<script language="javascript">  
    var result;
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
                    setTimeout("sendRequest()", 5000);  
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function DisplayHot() {  
            var name = XMLHttpReq.responseXML.getElementsByTagName("respsecond");  
          	
            var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	var name22=name2.split(",");
            
            var resp=Number(name22[1])-Number(name22[0]);
            result=(resp)/5120;
           
       
            // 基于准备好的dom，初始化echarts实例
        }
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="respsecond" style="width: 100%;height:400px"></div>


<script type="text/javascript">
var myChart = echarts.init(document.getElementById('respsecond'));
		var	option = {
			    title: {
			        text: '目标IP实时流量图'
			    },
			    tooltip: {
			        trigger: 'axis'
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

			    legend: {
			        data:['流量大小(单位:kbps)']
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: (function (){  
		                var now = new Date();  
		                var res = [];  
		                var len = 10;  
		                while (len--) {  
		                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));  
		                    now = new Date(now - 5000);  
		                }  
		                return res;  
		            })()  
			    },
			    yAxis: {
			       type: 'value'
			      
			    },
			    series: [
			        {
			            name:'流量大小(单位:kbps)',
			            type:'line',
			            data:(function (){  
			                var res = [];  
			                var len = 0;  
			                while (len < 10) {  
			                    res.push(0);  
			                    len++;  
			                }  
			                return res;  
			            })(),  
			            },
			     
			    ]
			 };  
			 
			 
			setInterval(function (){  
			    axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');  
			    
			    var data2=option.series[0].data;
			    data2.shift();
			    data2.push(result);
			 
			    option.xAxis.data.shift();  
			    option.xAxis.data.push(axisData);  
			      
			    
			    myChart.setOption(option);  
			},5000);
					myChart.setOption(option);
            
      
      
</script>
    </body>  
</html>