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
                    setTimeout("sendRequest()", 3600000);  
                } else { //页面不正常  
                    //window.alert("您所请求的页面有异常。");  
                }  
            }  
        }  
        function DisplayHot() {  
        	var name = XMLHttpReq.responseXML.getElementsByTagName("respIP"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("respflow"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
          	var resp_ip=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
          	var resp_values=name3.split(",");
            // 基于准备好的dom，初始化echarts实例
             var myChart = echarts.init(document.getElementById('respIP'));
		
		        // 指定图表的配置项和数据
		       var option = {
				    title : {
				        text: '目标IP总流量分布',
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
				        data:resp_ip
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
				            name:'目标IP流量统计',
				            type:'pie',
				            radius : '70%',
				            center: ['60%', '50%'],
				            data:[{value:resp_values[0],name:resp_ip[0]},
				            	  {value:resp_values[1],name:resp_ip[1]},
				            	  {value:resp_values[2],name:resp_ip[2]},
				            	  {value:resp_values[3],name:resp_ip[3]},
				            	  {value:resp_values[4],name:resp_ip[4]},
				            	  {value:resp_values[5],name:resp_ip[5]},
				            	  {value:resp_values[6],name:resp_ip[6]},
				            	  {value:resp_values[7],name:resp_ip[7]},
				            	  {value:resp_values[8],name:resp_ip[8]},
				            	  {value:resp_values[9],name:resp_ip[9]},
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
   <div id="respIP" style="width:100%;height:400px"></div>
    </body>  
</html>