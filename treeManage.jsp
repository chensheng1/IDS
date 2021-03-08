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
	{ level:1, name:"系统用户管理"},
	{ level:2, name:"添加用户",ico:"images/icon_default.gif",link:"main/management/power_member.jsp"},
	{ level:2, name:"修改用户",ico:"images/icon_default.gif",link:"main/management/power_update.jsp"},
	{ level:2, name:"删除用户",ico:"images/icon_default.gif",link:"main/management/power_delect.jsp"},
	/* { level:1, name:"配置管理", ico:"images/folderopen.gif"},
	{ level:2, name:"配置导入",ico:"images/icon_default.gif"},
	{ level:2, name:"配置导出",ico:"images/icon_default.gif"}, */
		{ level:1, name:"信息推送", ico:"images/folderopen.gif"},
	{ level:2, name:"邮件推送",ico:"images/icon_default.gif",link:"main/management/email.html"},
	{ level:1, name:"日志管理", ico:"images/folderopen.gif"},
	{ level:2, name:"系统资源状态",ico:"images/icon_default.gif",link:"main/management/log_resoure.html"},
	{ level:2, name:"日志删除",ico:"images/icon_default.gif",link:"main/management/power_bro_logfile.jsp"},
	/* { level:2, name:"会话日志",ico:"images/icon_default.gif"},
	{ level:2, name:"URL日志",ico:"images/icon_default.gif"},
	{ level:2, name:"其他事件",ico:"images/icon_default.gif"},
	{ level:2, name:"清除流量日志",ico:"images/icon_default.gif"}, */
//	{ level:1, name:"Hadoop管理", ico:"images/folderopen.gif"},
//	{ level:2, name:"Hadoop概况",ico:"images/icon_default.gif",link:"http://192.168.1.136:50070/dfshealth.html#tab-overview"},
//	{ level:2, name:"Hadoop日志",ico:"images/icon_default.gif",link:"http://192.168.1.136:50070/logs/"},
//	{ level:2, name:"节点信息",ico:"images/icon_default.gif",link:"http://192.168.1.136:50070/dfshealth.html#tab-datanode"},
//	{ level:2, name:"集群信息",ico:"images/icon_default.gif",link:"http://192.168.1.136:18088/cluster/"},
//	{ level:1, name:"Hadoop应用", ico:"images/folderopen.gif"},
//	{ level:2, name:"Hdfs",ico:"images/icon_default.gif",link:"http://192.168.1.136:50070/explorer.html#/"},
//	{ level:2, name:"Hive ",ico:"images/icon_default.gif",link:"http://192.168.1.136:9999/hwi/index.jsp"},
	/* { level:1, name:"用户管理", ico:"images/folderopen.gif"},
	{ level:2, name:"用户列表",ico:"images/icon_default.gif"},
	{ level:2, name:"用户修改",ico:"images/icon_default.gif"},
	{ level:2, name:"在线用户",ico:"images/icon_default.gif",link:"main/onlineUser.html"}, */
];
</script>

 <!--  <div id="menuControll">
菜单控制:【<a href="#" onclick="tree.openAll();this.blur();return false;" style="color:#333333;text-decoration:none">展开</a>】
【<a href="#" onclick="tree.closeAll();this.blur();return false;" style="color:#333333;text-decoration:none">折叠</a>】
</div> -->

<!-- <div class="dtree" style="margin:10px;"> -->

<div class="dtree" style="width:20%;margin:2px; height:360px; float:left">
<script type="text/javascript"> 
//建立新树
tree = new dTree('tree');
tree.config.target = "mainFrame";
tree.config.useCookies = false;
var selNum = -1;
var link = "";
//根目录
tree.add(0,-1,'系统管理', null, null, null, '', '');
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

<div class="maincontent" style="width:78%;margin:2px; height:360px; float:left">

</div>
</body>
</html>