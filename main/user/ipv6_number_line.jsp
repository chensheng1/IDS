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
    var select;
    var number;
    var date;
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
            var url = "ipv6_number_line_ajax.jsp"; 
            XMLHttpReq.open("GET", url, true);  
            XMLHttpReq.onreadystatechange = processResponse;//指定响应函数  
            XMLHttpReq.send(null);  // 发送请求  
        }  
        // 处理返回信息函数  
        function processResponse() {  
            if (XMLHttpReq.readyState == 4) { // 判断对象状态  
                if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息  
                    show(); 
                } else { //页面不正常  
                 //   window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function show() {  
        	//取出web_ajax.jsp里面画这段是时间top10的饼状图
            var name = XMLHttpReq.responseXML.getElementsByTagName("number"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("date"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
            number=name2.split(",");
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
            date=name3.split(",");
            
            var myChart = echarts.init(document.getElementById('all'));
		        // 指定图表的配置项和数据
		       var	option = {
			    title: {
			        text: '(IPv6)用户在线情况图'
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
			        data:['用户数量']
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
			        data: date
			    },
			    yAxis: {
			       type: 'value'
			      
			    },
			    series: [
			        {
			            name:'用户数量',
			            type:'line',
			            itemStyle: {normal: {areaStyle: {type: 'default'}}},
			            data:number,
			            },
			     
			    ]
			 };  

	        myChart.setOption(option);
      }
</script>
</head>
<body onload =sendRequest()>  
   <div id="all" style="width: 100%;height:400px"></div>
    </body>  
</html>