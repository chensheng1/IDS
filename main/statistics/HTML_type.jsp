<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts-all.js"></script>
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
            var url = "HTML_ajax.jsp";  
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
        
		function createRandomItemStyle() {
		    return {
		        normal: {
		            color: 'rgb(' + [
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160)
		            ].join(',') + ')'
		        }
		    };
		}
		
		function key(){
			for(var i=0;i<app_name.length;i++){
				return app_name[i];
			}
		}
		
		function values(){
			for(var i=0;i<app_values.length;i++){
				return app_values[i];
			}
		}
		var app_name;
		var app_values;
        function DisplayHot() {  
        	var name = XMLHttpReq.responseXML.getElementsByTagName("html_type"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("html_values"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
           app_name=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
           app_values=name3.split(",");
            // 基于准备好的dom，初始化echarts实例
             var myChart = echarts.init(document.getElementById('app'));
		
		        // 指定图表的配置项和数据
		       var option = {
							    title:{
							        text: '舆情词云图',
							    },
							    tooltip: {
							        show: true
							    },
							    series: [
							    {
							        name: '舆情词云图',
							        type: 'wordCloud',
							        size: ['80%', '80%'],
							        textRotation : [0, 45, 90, -45],
							        textPadding: 0,
							        autoSize: {
							            enable: true,
							            minSize: 14
							        },
							        data: (function(){
		                                var res = [];
		                                var len = 0;
		                                for(var i=0,size=app_name.length;i<size;i++) {
		                                res.push({
		                                name: app_name[i],
		                                value: app_values[i],
		                                itemStyle: createRandomItemStyle()
		                                });
		                                }
		                                return res;
		                                })()
		                            }
				            ]
			};
	        myChart.setOption(option);
        }  

    </script>  
      
</head>
<body onload =sendRequest()>  
   <div id="app" style="width:100%;height:400px"></div>
    </body>  
</html>