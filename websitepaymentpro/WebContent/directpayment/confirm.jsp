<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK rel=stylesheet type=text/css href="https://www.paypalobjects.com/WEBSCR-630-20100621-1/css/core/core.css" media=screen>
<title>Confirm billing info</title>
</head>
<!--
Display user billing info
Display subscription plan
Let user confirm
Forward to profile.jsp 
 -->
<body>
<%
//Get information posted from billing info
String BILLINGPERIOD = request.getParameter("BILLINGPERIOD");
String strAmount = request.getParameter("amount");
String creditCardType = request.getParameter("creditCardType");
String creditCardNumber = request.getParameter("creditCardNumber");	
String expDateMonth = request.getParameter("expDateMonth");
String expDateYear = request.getParameter("expDateYear");
String cvv2Number = request.getParameter("cvv2Number");
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String address1 = request.getParameter("address1");
String city = request.getParameter("city");
String state = request.getParameter("state");
String zip = request.getParameter("zip");	
%>
<form action="profile.jsp">
	<input type="hidden" name="BILLINGPERIOD" value="<%=BILLINGPERIOD%>"/>
	<input type="hidden" name="amount" value="<%=strAmount%>"/>
	<input type="hidden" name="creditCardType" value="<%=creditCardType%>"/>
	<input type="hidden" name="creditCardNumber" value="<%=creditCardNumber%>"/>
	<input type="hidden" name="expDateMonth" value="<%=expDateMonth%>"/>
	<input type="hidden" name="expDateYear" value="<%=expDateYear%>"/>
	<input type="hidden" name="cvv2Number" value="<%=cvv2Number%>"/>
	<input type="hidden" name="firstName" value="<%=firstName%>"/>
	<input type="hidden" name="lastName" value="<%=lastName%>"/>
	<input type="hidden" name="address1" value="<%=address1%>"/>
	<input type="hidden" name="city" value="<%=city%>"/>
	<input type="hidden" name="state" value="<%=state%>"/>
	<input type="hidden" name="zip" value="<%=zip%>"/>
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
			<td>$<%=strAmount%>.00</td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Subscribe"/></td>
		</tr>
	</table>
</form>
</body>
</html>