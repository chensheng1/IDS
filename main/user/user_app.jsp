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
        	 var app = XMLHttpReq.responseXML.getElementsByTagName("app_name"); 
            var app1 = XMLHttpReq.responseXML.getElementsByTagName("app_values"); 
          	var app2=app[0].childNodes[0].nodeValue.replace("]","");
          	app2=app2.replace("[","");
          	app2=app2.substring(1,app2.length);
            var app_name=app2.split(",");
          	
      		var app3=app1[0].childNodes[0].nodeValue.replace("]","");
          	app3=app3.replace("[","");
            var app_values=app3.split(",");
		
		        // 指定图表的配置项和数据
		    var myChart1 = echarts.init(document.getElementById('app'));
		
		        // 指定图表的配置项和数据
		       var option1 = {
				    title : {
				        text: '用户使用app Top 10',
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
				        data:app_name
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
				            name:'app使用(次数)',
				            type:'pie',
				            radius : '70%',
				            center: ['60%', '50%'],
				            data:[{value:app_values[0],name:app_name[0]},
				            	  {value:app_values[1],name:app_name[1]},
				            	  {value:app_values[2],name:app_name[2]},
				            	  {value:app_values[3],name:app_name[3]},
				            	  {value:app_values[4],name:app_name[4]},
				            	  {value:app_values[5],name:app_name[5]},
				            	  {value:app_values[6],name:app_name[6]},
				            	  {value:app_values[7],name:app_name[7]},
				            	  {value:app_values[8],name:app_name[8]},
				            	  {value:app_values[9],name:app_name[9]},
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
   <div id="app" style="width: 550px;height:400px"></div>
    </body>  
</html>