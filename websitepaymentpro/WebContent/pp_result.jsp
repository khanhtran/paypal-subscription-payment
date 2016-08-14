<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel=stylesheet type=text/css href="https://www.paypalobjects.com/WEBSCR-630-20100621-1/css/core/core.css" media=screen>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Result</title>
</head>
<body>
<%
String ppRequest = (String) session.getAttribute("ppRequest");
Boolean ppResult = (Boolean) session.getAttribute("ppResult");
String ppResponse = (String) session.getAttribute("ppResponse");
%>
<table>
	<tr><td colspan="2">Paypal request:&nbsp;</td></tr>
	<tr><td>&nbsp;</td><td><%=ppRequest.replaceAll("&", "<BR/>") %></td></tr>	
	<tr><td>Result:&nbsp;</td>
		<% if (ppResult.booleanValue()) {%>
		<td><font color="blue"><%= ppResult %></font></td>
		<%} else {%>
		<td><font color="red"><%= ppResult %></font></td>
		<%} %>
	</tr>
	<tr><td colspan="2">Paypal response:&nbsp;</td></tr>
	<tr><td>&nbsp;</td><td><%= java.net.URLDecoder.decode(ppResponse).replaceAll("&", "<BR/>") %></td></tr>
</table>
</body>
</html>