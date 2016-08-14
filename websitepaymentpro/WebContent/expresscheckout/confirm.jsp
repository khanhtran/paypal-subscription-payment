<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK rel=stylesheet type=text/css href="https://www.paypalobjects.com/WEBSCR-630-20100621-1/css/core/core.css" media=screen>
<title>Confirm payment</title>
</head>
<body>
<%
String testEnv = "sandbox";
String token = request.getParameter("token");
String BILLINGPERIOD = request.getParameter("BILLINGPERIOD");
//calculate amount
int amount;
if ( BILLINGPERIOD.equals("Day") ) {
	amount = 1;
} else if ( BILLINGPERIOD.equals("Week") ) {
	amount = 6;
} else if ( BILLINGPERIOD.equals("Month") ) {
	amount = 23;
} else {
	amount = 240;
}
//Call GetCheckoutDetails
//Allow confirm, redirect to create profile page
%>
<form action="profile.jsp">
<input type="hidden" name="BILLINGPERIOD" value="<%=BILLINGPERIOD%>"/>
<input type="hidden" name="token" value="<%=token%>"/>
<input type="hidden" name="amount" value="<%=amount%>"/>
<table>
	<tr>
		<td>Confirm your subscription</td><td></td>		
	</tr>
	<tr>
		<td>Plan name:</td>
		<td>Online service subscription</td>
	</tr>
	<tr>
		<td>Billing period:</td>
		<td><%=BILLINGPERIOD%></td>
	</tr>
	<tr>
		<td>Amount each period:</td>
		<td>$<%=amount%>.00</td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Subscribe"/></td>
	</tr>
</table>
</form>
</body>
</html>