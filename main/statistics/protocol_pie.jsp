<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>protocol</title>
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
            var url = "protocol_ajax.jsp";  
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
        	var name = XMLHttpReq.responseXML.getElementsByTagName("pro_name"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("pro_value"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
          	var pro_name=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
          	var pro_value=name3.split(",");
            // 基于准备好的dom，初始化echarts实例
             var myChart = echarts.init(document.getElementById('pro'));
		
		        // 指定图表的配置项和数据
		       var option = {
				    title : {
				        text: 'Top10 协议分布',
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
				        data:pro_name
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
				            name:'Top10 协议统计',
				            type:'pie',
				            radius : '60%',
				            center: ['60%', '50%'],
				            data:[{value:pro_value[0],name:pro_name[0]},
				            	  {value:pro_value[1],name:pro_name[1]},
				            	  {value:pro_value[2],name:pro_name[2]},
				            	  {value:pro_value[3],name:pro_name[3]},
				            	  {value:pro_value[4],name:pro_name[4]},
				            	  {value:pro_value[5],name:pro_name[5]},
				            	  {value:pro_value[6],name:pro_name[6]},
				            	  {value:pro_value[7],name:pro_name[7]},
				            	  {value:pro_value[8],name:pro_name[8]},
				            	  {value:pro_value[9],name:pro_name[9]},
				            	  {value:pro_value[10],name:pro_name[10]},
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
   <div id="pro" style="width: 100%;height:500px"></div>
    </body>  
</html>