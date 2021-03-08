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
            var url = "main_select_ajax.jsp";  
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
        	//取得log文件的大小
            var select1 = XMLHttpReq.responseXML.getElementsByTagName("main_select");  
            var select2=select1[0].childNodes[0].nodeValue.replace("]","");
          		select2=select2.replace("[","");
          	 select=select2.split(",");
		
        // 基于准备好的dom，初始化echarts实例
       }
    </script>  
      
</head>
<body>  
   <div id="main" style="width: 800px;height:400px"></div>
   <script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
		var	option = {
				    title : {
				        text: '查询的数据',
				    },
				    tooltip : {
				        trigger: 'axis',
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
				            data :['日志文件','流量大小','连接数量'],
				           
				        },
				    ],
				    yAxis: {
				        type: 'value',
				        boundaryGap: [0, 0.01],
				    },
				    series : [
				         {
				            type:'bar',
				            data:select,
				        }
				    ]
				};
                    
	        myChart.setOption(option);
   </script>
    </body>  
</html>