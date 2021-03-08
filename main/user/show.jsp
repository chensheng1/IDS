<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../../js/echarts.min.js"></script>
<title>Insert title here</title>

</head>
<body>
 <div id="main" style="width:100%;height:400px"> 
	 <div id="show" style="width:48%;height:400px;float:left"></div>
	 <div id="show1" style="width:50%;height:400px;float:left"></div>
 </div> 
 <script language="javascript">  
            // 基于准备好的dom，初始化echarts实例
   var myChart = echarts.init(document.getElementById('show'));
  var option = {
   title : {
		text: '节目热度(快乐大本营)',
				    },
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    series : [
        {
            name:'快乐大本营',
            type:'gauge',
            detail : {formatter:'{value}%'},
            data:[{value:38.5, name: '热度值'}]
        }
    ]
};
    myChart.setOption(option);


                    
    </script>  
    
     <script language="javascript">  
            // 基于准备好的dom，初始化echarts实例
   var myChart = echarts.init(document.getElementById('show1'));
  var option = {
   title : {
		text: '节目热度(最强大脑)',
				    },
    tooltip : {
        formatter: "{a} <br/>{b} : {c}%"
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    series : [
        {
            name:'最强大脑',
            type:'gauge',
            detail : {formatter:'{value}%'},
            data:[{value:17.5, name: '热度值'}]
        }
    ]
};
    myChart.setOption(option);


                    
    </script>  
    </body>  
</html>
