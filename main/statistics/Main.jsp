<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>Insert title here</title>
<script language="javascript"> 
	var connresult; 
    var traffresult;
    var outputresult; 
    var inputresult;
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
            var url = "Main_ajax.jsp";  
            XMLHttpReq.open("GET", url, true);  
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数  
            XMLHttpReq.send(null);  // 发送请求  
        }  
        // 处理返回信息函数  
        function processResponse() {  
            if (XMLHttpReq.readyState == 4) { // 判断对象状态  
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息  
                    DisplayHot();  
                    setTimeout("sendRequest()", 10000);  
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function DisplayHot() {  
            //读取Main_ajax.jsp里面的连接数的值
            var conn1 = XMLHttpReq.responseXML.getElementsByTagName("Main_conn");  
            var conn2=conn1[0].childNodes[0].nodeValue.replace("]","");
          		conn2=conn2.replace("[","");
          	var conn3=conn2.split(",");
          	var result1=Number(conn3[1])-Number(conn3[0]);
          	//读取Main_ajax.jsp里面流量的大小
          	var traff1 = XMLHttpReq.responseXML.getElementsByTagName("Main_traff");  
            var traff2=traff1[0].childNodes[0].nodeValue.replace("]","");
          		traff2=traff2.replace("[","");
          	var traff3=traff2.split(",");
          	var result2=Number(traff3[1])-Number(traff3[0]);
          	//读取Main_ajax.jsp里面的上行流量
          	var output1 = XMLHttpReq.responseXML.getElementsByTagName("Main_output");  
            var output2=output1[0].childNodes[0].nodeValue.replace("]","");
          		output2=output2.replace("[","");
          	var output3=output2.split(",");
          	var result3=Number(output3[1])-Number(output3[0]);
            //读取Main_ajax.jsp里面的下行流量
            var input1 = XMLHttpReq.responseXML.getElementsByTagName("Main_input");  
            var input2=input1[0].childNodes[0].nodeValue.replace("]","");
          		input2=input2.replace("[","");
          	var input3=input2.split(",");
          	var result4=Number(input3[1])-Number(input3[0]);
            //计算连接数，流量，上下行流量大小
            connresult=(result1)/2;
            traffresult=(result2)/2048;
            outputresult=(result3)/2048;
            inputresult=(result4)/2048;
            //window.alert(connresult);
        }
        //window.alert(connresult);
    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="main" style="width: 100%;height:400px"></div>
<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		var	option = {
			    title: {
			        text: '实时流量'
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
			        data:['上行流量(单位:Kbps)','下行流量(单位:Kbps)','流量大小(单位:kbps)','连接数(单位:条数/s)']
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
		                var len = 50;  
		                while (len--) {  
		                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));  
		                    now = new Date(now - 10000);  
		                }  
		                return res;  
		            })()  
			    },
			    yAxis: {
			       type: 'value'
			      
			    },
			    series: [
			        {
			            name:'上行流量(单位:Kbps)',
			            type:'line',
			            data:(function (){  
			                var res = [];  
			                var len = 0;  
			                while (len < 50) {  
			                    res.push(0);  
			                    len++;  
			                }  
			                return res;  
			            })(),  
			            },
			            {
			            name:'下行流量(单位:Kbps)',
			            type:'line',
			            data:(function (){  
			                var res = [];  
			                var len = 0;  
			                while (len < 50) {  
			                    res.push(0);  
			                    len++;  
			                }  
			                return res;  
			            })(),  
			            },
			        {
			            name:'流量大小(单位:kbps)',
			            type:'line',
			            data:(function (){  
			                var res = [];  
			                var len = 0;  
			                while (len < 50) {  
			                    res.push(0);  
			                    len++;  
			                }  
			                return res;  
			            })(),  
			            },
			        {
			            name:'连接数(单位:条数/s)',
			            type:'line',
			            data:(function (){  
			                var res = [];  
			                var len = 0;  
			                while (len < 50) {  
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
			  
			    var data0 = option.series[0].data;  
			    data0.shift();  
			    data0.push(outputresult);  
			    
			    var data1=option.series[1].data;
			    data1.shift();
			    data1.push(inputresult);
			    
			    var data2=option.series[2].data;
			    data2.shift();
			    data2.push(traffresult);
				
				var data3=option.series[3].data;
			    data3.shift();
			    data3.push(connresult);
			  
			    option.xAxis.data.shift();  
			    option.xAxis.data.push(axisData);  
			      
			    
			    myChart.setOption(option);  
			}, 10000);
					myChart.setOption(option);
</script>
    </body>  
</html>