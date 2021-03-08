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
            var url = "originip_current_ajax.jsp";  
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
        	var name = XMLHttpReq.responseXML.getElementsByTagName("orig_name"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("orig_value"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
          	var ori_ip=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
          	var ori_values=name3.split(",");
            // 基于准备好的dom，初始化echarts实例
             var myChart = echarts.init(document.getElementById('origin'));
		
		        // 指定图表的配置项和数据
		       var option = {
				    title : {
				        text: '当天源IP Top10流量分布',
		
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				    	top:60,
				        orient : 'vertical',
				        x : 'left',
				        data:ori_ip
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
				            name:'源IP流量统计',
				            type:'pie',
				            radius : '70%',
				            center: ['60%', '50%'],
				            data:[{value:ori_values[0],name:ori_ip[0]},
				            	  {value:ori_values[1],name:ori_ip[1]},
				            	  {value:ori_values[2],name:ori_ip[2]},
				            	  {value:ori_values[3],name:ori_ip[3]},
				            	  {value:ori_values[4],name:ori_ip[4]},
				            	  {value:ori_values[5],name:ori_ip[5]},
				            	  {value:ori_values[6],name:ori_ip[6]},
				            	  {value:ori_values[7],name:ori_ip[7]},
				            	  {value:ori_values[8],name:ori_ip[8]},
				            	  {value:ori_values[9],name:ori_ip[9]},
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
   <div id="origin" style="width: 100%;height:400px"></div>
    </body>  
</html>