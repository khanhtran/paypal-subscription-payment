<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.GregorianCalendar" %>    
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.paypal.sdk.services.NVPCallerServices" %>
<%@ page import="com.paypal.sdk.util.*" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPEncoder" %>
<%@ page import="com.paypal.sdk.core.nvp.NVPDecoder" %>
<%@ page import="com.paypal.sdk.profiles.ProfileFactory" %>
<%@ page import="com.paypal.sdk.profiles.APIProfile" %>

<%


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create or edit recurring profile</title>
</head>
<body>
<form method="post">
<table>
	<tr>
		<td>Profile ID:</td>
		<td><input type="text" length="10" name="profileId"/><td>
		<td>I-YS6WTA170CJM, AAW8RC1GSKF5</td>
	</tr>
	<tr>
		<td colspan="3">
			<input type="submit" value="GetRecurringPaymentsProfileDetails"/>
		</td>
	</tr>
</table>
</form>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
String profileId = request.getParameter("profileId");
String testEnv = "sandbox";
String token = request.getParameter("token");
String BILLINGPERIOD = request.getParameter("BILLINGPERIOD");
String amount = request.getParameter("amount");
//create or update profile
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
encoder.add("METHOD","GetRecurringPaymentsProfileDetails");
encoder.add("ProfileID", profileId);

String strNVPRequest = encoder.encode();
session.setAttribute("ppRequest", strNVPRequest);
//call method will send the request to the server and return the response NVPString
String ppResponse = (String) caller.call( strNVPRequest);
session.setAttribute("ppResponse", ppResponse);
System.out.println("ppResponse:" + ppResponse);
decoder.decode(ppResponse);
//checks for Acknowledgement and redirects accordingly to display error messages
String strAck = decoder.get("ACK");
System.out.println("strAck:" + strAck);
boolean ppResult;
if(strAck !=null && !(strAck.equals("Success") || strAck.equals("SuccessWithWarning")))	{
  // do error processing
  ppResult = false;
} else {	
  ppResult = true;
}
session.setAttribute("ppResult", new Boolean(ppResult));
%>
<jsp:forward page="pp_result.jsp" />
<%
}
%> 
</body>
</html>