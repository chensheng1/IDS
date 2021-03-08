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
	{ level:1, name:"根因分析"},
	{ level:2, name:"用户统计", ico:"images/icon_default.gif",link:"main/user/abnormal_user.html"},
	{ level:2, name:"攻击地址溯源", ico:"images/icon_default.gif",link:"main/user/ano_ip_total.html"},
	{ level:2, name:"原因溯源", ico:"images/icon_default.gif",link:"main/user/ano_bec.jsp"},
	{ level:1, name:"用户分析"},
	{ level:2, name:"用户统计", ico:"images/icon_default.gif",link:"main/user/internet_number.html"},
	{ level:2, name:"用户情况", ico:"images/icon_default.gif",link:"main/user/user_barandline.html"},
	{ level:2, name:"用户业务", ico:"images/icon_default.gif",link:"main/user/people_like.html"},
	{ level:2, name:"用户网页推荐", ico:"images/icon_default.gif",link:"main/user/user_similar_web.html"},
	{ level:2, name:"用户APP推荐", ico:"images/icon_default.gif",link:"main/user/user_similar_app.html"},
	{ level:1, name:"IPV6根因分析"},
	{ level:2, name:"IPV6用户统计", ico:"images/icon_default.gif",link:"main/user/ipv6_user.html"},
	{ level:2, name:"IPV6异常用户", ico:"images/icon_default.gif",link:"main/user/ipv6_abnormal_user.html"},
	{ level:2, name:"IPV6攻击地址溯源", ico:"images/icon_default.gif",link:"main/user/ipv6_ano_ip_total.html"},
	{ level:2, name:"原因溯源", ico:"images/icon_default.gif",link:"main/user/ipv6_ano_bec.jsp"},
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
tree.add(0,-1,'根因追踪', null, null, null, '', '');
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