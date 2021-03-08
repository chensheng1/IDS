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
<script type="text/javascript"> 
var treeMenu = [
	{ level:1, name:"异常检测"},
	{ level:2, name:"异常统计", ico:"images/icon_default.gif",link:"main/analysis/abnormal_sta.jsp"},
	{ level:2, name:"用户异常", ico:"images/icon_default.gif",link:"main/analysis/abnormal_user.jsp"},
	{ level:2, name:"异常攻击类型", ico:"images/icon_default.gif",link:"main/analysis/abnormal_traffic_total.html"},
	{ level:2, name:"用户名单类别", ico:"images/icon_default.gif",link:"main/analysis/user_list_total.jsp"},
	{ level:1, name:"入侵检测"},
	{ level:2, name:"snort检测系统",ico:"images/icon_default.gif",link:"http://192.168.1.72/base/base_main.php"},
	{ level:2, name:"异常统计",ico:"images/icon_default.gif",link:"main/analysis/snort_event_total.html"},
	{ level:2, name:"用户异常",ico:"images/icon_default.gif",link:"main/analysis/snort_user.html"},
	{ level:2, name:"异常分析",ico:"images/icon_default.gif",link:"main/analysis/snort_analysis_total.html"},
	{ level:1, name:"机器学习的异常检测", ico:"images/folderopen.gif"},
	{ level:2, name:"LOF算法异常评分",ico:"images/icon_default.gif",link:"main/analysis/abnormal_total.html"},
	{ level:2, name:"k-means(粗粒度分析)",ico:"images/icon_default.gif",link:"main/analysis/web_select.html"},
	{ level:2, name:"决策树(细粒度分析)",ico:"images/icon_default.gif",link:"main/analysis/web_total.html"},
	{ level:2, name:"BP神经网络异常检测",ico:"images/icon_default.gif",link:"main/analysis/bp_abnormal.jsp"},
	{ level:2, name:"时序流量预测",ico:"images/icon_default.gif",link:"main/analysis/app_class_select.html"},
	{ level:1, name:"IPV6异常分析"},
	{ level:2, name:"IPV6用户异常", ico:"images/icon_default.gif",link:"main/analysis/IPV6_user.html"},
	
];
</script>

<!-- <div id="menuControll">
菜单控制:【<a href="#" onclick="tree.openAll();this.blur();return false;" style="color:#333333;text-decoration:none">展开</a>】
【<a href="#" onclick="tree.closeAll();this.blur();return false;" style="color:#333333;text-decoration:none">折叠</a>】
</div> -->
<div class="dtree" style="margin:10px;">
<script type="text/javascript"> 
//建立新树
tree = new dTree('tree');
tree.config.target = "mainFrame";
tree.config.useCookies = false;
var selNum = -1;
var link = "";
//根目录
tree.add(0,-1,'异常分析', null, null, null, '', '');
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