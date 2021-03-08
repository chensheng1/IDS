<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="statistics.main_select" %>
<%@ page import="java.util.*" %>
<%
String firsttime="";
String lasttime="";
firsttime=request.getParameter("time1");
lasttime=request.getParameter("time2");
//session.setAttribute("time1",firsttime); 
//session.setAttribute("time2",lasttime); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
</head>
<body>
<%
	response.setContentType("text/xml; charset=UTF-8");  
    response.setHeader("Cache-Control","no-cache"); 
	     String firstdate=firsttime;
	     String lastdate=lasttime;
         main_select cs=new main_select();
         List<String> list=cs.selectdate(firstdate,lastdate);
         List<String> list1=new ArrayList<String>();
         List<String> list2=new ArrayList<String>();
         List<String> list3=new ArrayList<String>();
         List<String> list4=new ArrayList<String>();
         List<String> list5=new ArrayList<String>();
         List<String> list6=new ArrayList<String>();
         	for(int i=0;i<list.size();i=i+6){
         		list1.add(list.get(i));
         		long l=Long.parseLong(list.get(i+1));
				long x=l/1048576;
				String values = String.valueOf(x);
         		list2.add(values);
         		long cc=Long.parseLong(list.get(i+2));
				long y=cc/1000;
				String conn = String.valueOf(y);
         		list3.add(conn);
         		long zz=Long.parseLong(list.get(i+3));
				long k=zz/1048576;
				String traff = String.valueOf(k);
         		list4.add(traff);
         		long vv=Long.parseLong(list.get(i+4));
				long j=vv/1048576;
				String outgoing = String.valueOf(j);
         		list5.add(outgoing);
         		long bb=Long.parseLong(list.get(i+5));
				long h=bb/1048576;
				String incoming = String.valueOf(h);
         		list6.add(incoming);
			}
			out.println("<Mainsum_time>");
			    out.println(list1);
			    out.println("</Mainsum_time>");
			    out.println("<Mainsum_log>");
			    out.println(list2);
			    out.println("</Mainsum_log>");
			    out.println("<Mainsum_conn>");
			    out.println(list3);
			    out.println("</Mainsum_conn>");
			    out.println("<Mainsum_traff>");
			    out.println(list4);
			    out.println("</Mainsum_traff>");
			    out.println("<Mainsum_outgoing>");
			    out.println(list5);
			    out.println("</Mainsum_outgoing>");
			    out.println("<Mainsum_incoming>");
			    out.println(list6);
			    out.println("</Mainsum_incoming>");
%>

<%-- <html lang="ch">
<head>
    
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/css/jPages.css" type="text/css" rel="stylesheet"></link>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jPages.js"></script>
</head>
<body>

<div style="width:100%;height:350px" align="center">


<table width="100%" height="300px" border="1" align="center" >
	<thead>
		<tr>
			<th width="200px">时间</th>
			<th width="200px">日志大小</th>
			<th width="200px">连接数</th>
			<th width="200px">流量大小</th>
			<th width="200px">上行流量</th>
			<th width="200px">下行流量</th>
		</tr>
	</thead>
	
	<tbody id="movies">

<%    
	     //String firstdate=session.getAttribute("time1").toString();
	     //String lastdate=session.getAttribute("time2").toString();
	     String firstdate=firsttime;
	     String lastdate=lasttime;
         main_select cs=new main_select();
         List<String> list=cs.selectdate(firstdate,lastdate);
         	for(int i=0;i<list.size();i=i+6){
     %>
        <tr>
             <td width="200px"><%=list.get(i)%></td>
             <td width="200px"><%=list.get(i+1)%></td>
             <td width="200px"><%=list.get(i+2)%></td>
             <td width="200px"><%=list.get(i+3)%></td>
             <td width="200px"><%=list.get(i+4)%></td>
             <td width="200px"><%=list.get(i+5)%></td>
     	</tr>
     	 <%
          }
       %>
</tbody>
</table>
</div> --%>
</body>
</html>