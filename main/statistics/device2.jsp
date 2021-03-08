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
            var url = "device_ajax.jsp";  
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
        	var name = XMLHttpReq.responseXML.getElementsByTagName("device_name1"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("device_member1"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
          	var device_name=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
          	var device_values=name3.split(",");
            // 基于准备好的dom，初始化echarts实例
             var myChart = echarts.init(document.getElementById('device'));
		
		        // 指定图表的配置项和数据
		       var option = {
				    title : {
				        text: '当前设备 Top 10(按人数统计)',
				        
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				    	top:60,
				        orient : 'vertical',
				        x : 'left',
				        data:device_name
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {
				                show: true, 
				                type: ['pie', 'funnel'],
				                
				            },
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    series : [
				        {
				            name:'当前设备 Top 10(/人数)',
				            type:'pie',
				            radius : '70%',
				            center: ['60%', '50%'],
				            data:[{value:device_values[0],name:device_name[0]},
				            	  {value:device_values[1],name:device_name[1]},
				            	  {value:device_values[2],name:device_name[2]},
				            	  {value:device_values[3],name:device_name[3]},
				            	  {value:device_values[4],name:device_name[4]},
				            	  {value:device_values[5],name:device_name[5]},
				            	  {value:device_values[6],name:device_name[6]},
				            	  {value:device_values[7],name:device_name[7]},
				            	  {value:device_values[8],name:device_name[8]},
				            	  {value:device_values[9],name:device_name[9]},
				            ],
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				            }
				        }
				    ]
				};
	        myChart.setOption(option);
        }  

    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="device" style="width: 100%;height:400px"></div>
    </body>  
</html>