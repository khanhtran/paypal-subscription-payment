<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Properties" %>
<%@ page import="org.apache.commons.httpclient.HttpClient" %>
<%@ page import="org.apache.commons.httpclient.methods.PostMethod" %>
<%@ page import="com.itsolution.paypal.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Instant Payment Notification</title>
</head>
<body>
<!-- Print out the parameters -->
<table>
	<tr>
		<td>Method</td>
		<td><%=request.getMethod()%></td>
	</tr>
<%
	java.util.Enumeration e = request.getParameterNames();	
	while (e.hasMoreElements()) {
  		String paramName = (String) e.nextElement();
  		String paramValue = request.getParameter(paramName);
%>
	<tr>
		<td><%= paramName %></td>
		<td><%=paramValue%></td>
	</tr>
<%  		
	}
%>
</table>
<!-- Implementation -->
<!-- 2. Create a request that contains exactly the same IPN variables and values in the same order,
preceded with cmd=_notify-validate. (To inform paypal that this IPN has been processed-->
<%
PostMethod post = new PostMethod("https://www." + Constants.DEFAULT_ENV + ".paypal.com/cgi-bin/webscr");
post.addParameter("cmd", "_notify-validate");			
StringBuffer sb = new StringBuffer();		
for (e = request.getParameterNames(); e.hasMoreElements(); ) {			
	String name = (String) e.nextElement();
	String value = request.getParameter(name);
	sb.append(name).append("=").append(value).append(";");
	post.addParameter(name, value);
}
%>
<!-- 3. Post the request to www.paypal.com or www.sandbox.paypal.com, depending on
whether you are going live or testing your listener in the Sandbox. -->
<%
Properties props = new Properties();
HttpClient client = new HttpClient();
int statusCode = client.executeMethod(post);
if (statusCode < 200 || statusCode >= 300) {

	props.load(post.getResponseBodyAsStream());
%>
	<!-- 4. Wait for a response from PayPal, which is either VERIFIED or INVALID. -->
	<!-- 5. Verify that the response status is 200, already -->
	<!--   5.1 Confirm that the payment status is Completed. PayPal sends IPN messages for pending and denied payments as well; do not ship until
	the payment has cleared.-->
<% 
	String payment_status = request.getParameter("payment_status");	
	if ( payment_status.equals("Completed") ) {
		
%>
		<!--   5.2 Use the transaction ID to verify that the transaction has not already been processed,
		which prevents duplicate transactions from being processed. Typically, you store transaction IDs in a database so that you know you are only
		processing unique transactions-->
<% 		
		String txn_id = request.getParameter("txn_id");
%>
		<!--   5.3 Validate that the receiver’s email address is registered to you.
		This check provides additional protection against fraud. -->
<%
		String receiver_email = request.getParameter("receiver_email");
		if ( receiver_email.equals(Constants.DEFAULT_EMAIL_ADDRESS) ) {
%>		
			<!--   5.4 Verify that the price, item description, and so on, match the transaction on your website.
			This check provides additional protection against fraud. -->
			
			<!-- 6. If the verified response passes the checks, take action based on the value of the txn_type
			variable if it exists; otherwise, take action based on the value of the reason_code
			variable. -->
			
			<!-- 7. If the response is INVALID or the response code is not 200, save the message for further
			investigation.-->
<%
		} else {
%>			
			<font color="red">Received email address was <%= receiver_email %>, expected <%=Constants.DEFAULT_EMAIL_ADDRESS%></font>
<%
		}
	} else {
%>
	<font color="red">Payment status is <%=payment_status%></font>	
<% 		
	}
} else {
%>
	<font color="red">Error code: <%=statusCode%></font>
<% 	
}
%>
</body>
</html>