<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="com.paypal.sdk.profiles.ProfileFactory" %>
<%@ page import="com.paypal.sdk.profiles.APIProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set express checkout</title>
</head>
<body>
Set express checkout
<%
//call SetExpress Checkout
String testEnv = "sandbox";
String BILLINGPERIOD = request.getParameter("BILLINGPERIOD");
//paypal auhentication
NVPEncoder encoder = new NVPEncoder();
NVPDecoder decoder = new NVPDecoder();
NVPCallerServices caller = new NVPCallerServices();
	
APIProfile profile = ProfileFactory.createSignatureAPIProfile();

profile.setAPIUsername("pro_ca_1278642243_biz_api1.yahoo.com");
profile.setAPIPassword("1278642250");
profile.setSignature("AEw-LtiI082Y9uFapEVZc-gM1qdcAQkCqtGy01JBSQBkM471qgz04IQY");	
profile.setEnvironment("sandbox");
profile.setSubject("");	
caller.setAPIProfile(profile);
	
encoder.add("VERSION", "51.0");			
encoder.add("METHOD","SetExpressCheckout");

StringBuffer url = new StringBuffer();
url.append("http://");
url.append(request.getServerName());
url.append(":");
url.append(request.getServerPort());
url.append(request.getContextPath());
	
// Add request-specific fields to the request string.
String returnURL = url.toString() + "/expresscheckout/confirm.jsp?BILLINGPERIOD=" + BILLINGPERIOD;
String cancelURL = url.toString() + "/checkout.htm";
	
encoder.add("RETURNURL", returnURL);
encoder.add("CANCELURL", cancelURL);
encoder.add("L_BILLINGTYPE0", "RecurringPayments");
encoder.add("L_BILLINGDESCRIPTION0", "Online service subscription");
encoder.add("L_BILLINGAGREEMENTDESCRIPTION0", "Online service subscription");
	
encoder.add("AMT", "0");
encoder.add("PAYMENTACTION", "RecurringPayment");
encoder.add("CURRENCYCODE", "USD");
		
// Execute the API operation and obtain the response.
String NVPRequest= encoder.encode();
String NVPResponse = caller.call(NVPRequest);
decoder.decode(NVPResponse);
String strAck = decoder.get("ACK"); 
if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning"))) {
	session.setAttribute("NVPResponse", NVPResponse);
	response.sendRedirect("../APIError.jsp");
	return;
} else {	
	//redirect to PayPal login
	response.sendRedirect("https://www."+testEnv+".paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=" + decoder.get("TOKEN"));		
}
//Redirect to Confirm
%>
</body>
</html>