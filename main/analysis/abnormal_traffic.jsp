<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
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
            var url = "abnormal_traffic_ajax.jsp";  
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
        	var name = XMLHttpReq.responseXML.getElementsByTagName("abnormal_time"); 
            var name1 = XMLHttpReq.responseXML.getElementsByTagName("abnormal_c"); 
          	var name2=name[0].childNodes[0].nodeValue.replace("]","");
          	name2=name2.replace("[","");
          	name2=name2.substring(1,name2.length);
          	var time=name2.split(",");
          	
          	
      		var name3=name1[0].childNodes[0].nodeValue.replace("]","");
          	name3=name3.replace("[","");
          	var abnormal_name=name3.split(",");
          	
          	var dos = XMLHttpReq.responseXML.getElementsByTagName("abnormal_d"); 
          	var dos2=dos[0].childNodes[0].nodeValue.replace("]","");
          	dos2=dos2.replace("[","");
            var abnormal_dos=dos2.split(",");
          	
          	var date = XMLHttpReq.responseXML.getElementsByTagName("abnormal_l"); 
          	var date2=date[0].childNodes[0].nodeValue.replace("]","");
          	date2=date2.replace("[","");
            var abnormal_value=date2.split(",");
              
           var hui = XMLHttpReq.responseXML.getElementsByTagName("abnormal_h"); 
          	var hui2=hui[0].childNodes[0].nodeValue.replace("]","");
          	hui2=hui2.replace("[","");
            var abnormal_hui=hui2.split(",");
            
            var mu = XMLHttpReq.responseXML.getElementsByTagName("abnormal_m"); 
          	var mu2=mu[0].childNodes[0].nodeValue.replace("]","");
          	mu2=mu2.replace("[","");
            var abnormal_mu=mu2.split(",");
            
		var myChart = echarts.init(document.getElementById('center'));

		var	option = {
				    title : {
				        text: '用户异常统计',
				    },
				    tooltip : {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'shadow'
				        }
				    },
				    legend: {
				        data:['木马','蠕虫',,'DOS','网络神偷','灰鸽子']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            data :time,
				            axisLabel: {
							            interval: 0,
							            rotate: 0
							        }, 
						splitLine: {
							            show: true
							        }
				        }
				    ],
				    yAxis : [
				        {
				        	name:'单位:(人数)',
				            type : 'value'
				        }
				    ],
				    series : [
				         {
				            name:'木马',
				            type:'bar',
				            data:abnormal_mu,
				        },
				        {
				            name:'蠕虫',
				            type:'bar',
				            data:abnormal_name,
				        	},
				         {
				            name:'DOS',
				            type:'bar',
				            data:abnormal_dos,
				        	},
				        {
				            name:'网络神偷',
				            type:'bar',
				            data:abnormal_value,
				            },
				          {
				            name:'灰鸽子',
				            type:'bar',
				            data:abnormal_hui,
				            }
				    ]
				};
                    
	        myChart.setOption(option);
	        }
    </script>
      
</head>
<body onload =sendRequest()>  
   <div id="center" style="width:100%;height:500px"></div>
    </body>  
</html>