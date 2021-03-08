// JavaScript Document

function $(elemId){
	return document.getElementById(elemId);
}

function getElementsByClassName(className, node, tag){
	node = node || document;//如果省略了参数node，就从document中搜索，否则从node节点开始搜索
	if(node.getElementsByClassName) 
		return node.getElementsByClassName(className);
	else{
		tag = tag || "*";
		var searchElems = [];
		var elems = node.getElementsByTagName(tag);
		for(i=0; i<elems.length; i++){
			var elem = elems[i];
			if(elem.className.indexOf(className) != -1)
				searchElems.push(elem);
		}
		return searchElems;
	}
}

function sortTable(tableId, colIdx, sortType){
	var oTbody = $(tableId).tBodies[0];//得到指定id的表格对象下的tbody
	var dataRows = oTbody.rows;
	
	var sortRows = [];
	for(i=0; i<dataRows.length; i++){
		sortRows.push(dataRows[i]);
	}
	
	//if(oTbody.sortColIdx == colIdx){
		//sortRows.reverse();
	//}else{
		sortRows.sort(function(oTr1, oTr2){
			var cellVal1 = oTr1.cells[colIdx].textContent;//firstChild.nodeValue
			var cellVal2 = oTr2.cells[colIdx].textContent;
			return sortType=="asc"?compare(cellVal1, cellVal2):compare(cellVal2, cellVal1);
		});
	//}
	
	for(i=0; i<sortRows.length; i++){
		oTbody.appendChild(sortRows[i]);
	}
	//oTbody.sortColIdx = colIdx;
};

function compare(val1, val2){
	if(!isNaN(val1) && !isNaN(val2)){
		return parseInt(val1) - parseInt(val2);
	}

	return val1.localeCompare(val2);
}

window.onload = function(){
	var sortType = "asc";
	var sortCols = getElementsByClassName("sort_able");
	for(i=0; i<sortCols.length; i++){
		var sortCol = sortCols[i];
		sortCol.onclick = function(){
			sortType = (sortType == "asc")?"desc":"asc";
			this.className = "sort_" + sortType;			
			sortTable("tableSort", this.parentNode.cellIndex, sortType);
		};
	}
};


function next(elem){
	do{
		elem = elem.nextSibling;
	}while( elem && elem.nodeType != 1);

	return elem;
}

function getByClass(className, context, tag){
	context = context || document;
	tag = tag || "*";
	var result = [];
	//能力检测
	if(document.getElementsByClassName){
		return document.getElementsByClassName(className);
	}
	//自己封装的代码
	var arr = context.getElementsByTagName(tag);
	for(var i=0; i<arr.length; i++){
		if(arr[i].className == className){
			result.push(arr[i]);
		}
	}
	return result;
}