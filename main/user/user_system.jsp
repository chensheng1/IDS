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
            var url = "user_like_ajax.jsp";  
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
        	 var system = XMLHttpReq.responseXML.getElementsByTagName("system_name"); 
            var system1 = XMLHttpReq.responseXML.getElementsByTagName("system_values"); 
          	var system2=system[0].childNodes[0].nodeValue.replace("]","");
          	system2=system2.replace("[","");
          	system2=system2.substring(1,system2.length);
            var system_name=system2.split(",");
          	
      		var system3=system1[0].childNodes[0].nodeValue.replace("]","");
          	system3=system3.replace("[","");
            var system_values=system3.split(",");
		
		        // 指定图表的配置项和数据
		    var myChart1 = echarts.init(document.getElementById('system'));
		
		        // 指定图表的配置项和数据
		       var option1 = {
				    title : {
				        text: '用户使用的系统',
				        x:'40%',
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				    	top:60,
				        orient : 'vertical',
				        x : 'left',
				        data:system_name
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
				            name:'系统使用(次数)',
				            type:'pie',
				            radius : '70%',
				            center: ['60%', '50%'],
				            data:[{value:system_values[0],name:system_name[0]},
				            	  {value:system_values[1],name:system_name[1]},
				            	  {value:system_values[2],name:system_name[2]},
				            	  {value:system_values[3],name:system_name[3]},
				            	  /* {value:system_values[4],name:system_name[4]},
				            	  {value:system_values[5],name:system_name[5]},
				            	  {value:system_values[6],name:system_name[6]},
				            	  {value:system_values[7],name:system_name[7]},
				            	  {value:system_values[8],name:system_name[8]},
				            	  {value:system_values[9],name:system_name[9]}, */
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
	        myChart1.setOption(option1);
        }  

    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="system" style="width:550px;height:400px"></div>
    </body>  
</html>