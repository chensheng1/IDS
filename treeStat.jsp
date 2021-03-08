<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>导航树</title>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<style type="text/css">@import url('components/dtree/dtree.css');</style>
	<script type="text/javascript">var dtreeIconBasePath = "components/dtree";</script>
	<script type="text/javascript"  src="components/dtree/dtree.js"></script>
</head>
<body>
<script type="text/javascript"> //link后加需要跳转的界面,如:link:link:"main/1.html";
var treeMenu = [
	{ level:1, name:"流量概况"},
	{ level:2, name:"实时流量概况", ico:"images/icon_default.gif",link:"main/statistics/mainTraffic.html"},
	{ level:2, name:"历史流量查询", ico:"images/icon_default.gif",link:"main/statistics/mainApplication.html"},
	{ level:2, name:"异常流量查询", ico:"images/icon_default.gif",link:"main/statistics/abnormal_total.html"},
	{ level:2, name:"实时应用概况", ico:"images/icon_default.gif",link:"main/statistics/mainapply.html"},
	{ level:2, name:"应用统计", ico:"images/icon_default.gif",link:"main/statistics/protocol_total.html"},
	{ level:2, name:"会话统计", ico:"images/icon_default.gif",link:"main/statistics/session.html"},
	{ level:1, name:"流量分析"},
	{ level:2, name:"网络环境分析", ico:"images/icon_default.gif",link:"main/statistics/MAC_table.html"},
	{ level:2, name:"终端设备分布", ico:"images/icon_default.gif",link:"main/statistics/device_system_total.html"},
	{ level:2, name:"终端设备统计", ico:"images/icon_default.gif",link:"main/statistics/device_class_total.html"},
	{ level:2, name:"浏览器统计", ico:"images/icon_default.gif",link:"main/statistics/browser_total.html"},
	{ level:2, name:"网站访问统计", ico:"images/icon_default.gif",link:"main/statistics/web_select.html"},
	{ level:2, name:"APP使用统计", ico:"images/icon_default.gif",link:"main/statistics/app_class_select.html"},
	{ level:2, name:"文件类型统计", ico:"images/icon_default.gif",link:"main/statistics/file_class.html"},
	{ level:2, name:"舆情分析", ico:"images/icon_default.gif",link:"main/statistics/HTML.html"},
	{ level:1, name:"IPV6统计"},
	{ level:2, name:"流量概况", ico:"images/icon_default.gif",link:"main/statistics/mainTraffic.html"},
	{ level:2, name:"应用分布", ico:"images/icon_default.gif",link:"main/statistics/protocol_total.html"},
	{ level:2, name:"IPV6源IP统计", ico:"images/icon_default.gif",link:"main/statistics/ipv6_origin_total.html"},
	{ level:2, name:"IPV6网站分析",ico:"images/icon_default.gif",link:"main/statistics/ipv6_web.html"},
	{ level:2, name:"IPV6app分析",ico:"images/icon_default.gif",link:"main/statistics/ipv6_app.html"},
	];
</script>


<div class="dtree" style="margin:10px;">
<script type="text/javascript"> 
//建立新树
tree = new dTree('tree');
tree.config.target = "mainFrame";
tree.config.useCookies = false;
var selNum = -1;
var link = "";
//根目录
tree.add(0,-1,'流量统计', null, null, null, '', '');
var count = 0;
var pLevelIdArray = new Array();
pLevelIdArray[1] = 0;
var currLevel = 1;
for (var i=0; i<treeMenu.length; i++) {
	var item = treeMenu[i];
	var itemLevel = item.level;
	pLevelIdArray[itemLevel+1] = ++count;
	if (item.link!=null && item.link!="") {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.link, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name, item.link);
		}
	} else {
		if (item.ico!=null) {
			tree.add(count, pLevelIdArray[itemLevel], item.name, null, null, null, item.ico, item.ico);
		} else {
			tree.add(count, pLevelIdArray[itemLevel], item.name);
		}
	}
	if (item.select) {
		selNum = count;
		link = item.link;
	}
}
document.write(tree);
tree.openAll();
if (selNum != -1) {
	tree.openTo(selNum,true);
	top.document.frames["mainFrame"].location.href=link;
}
</script>
</div>
</body>
</html>