<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK rel=stylesheet type=text/css
	href="https://www.paypalobjects.com/WEBSCR-630-20100621-1/css/core/core.css"
	media=screen>
<title>Input billing information</title>
</head>
<body>
<%
	String BILLINGPERIOD = request.getParameter("BILLINGPERIOD");
	//calculate amount
	int amount;
	if (BILLINGPERIOD.equals("Day")) {
		amount = 1;
	} else if (BILLINGPERIOD.equals("Week")) {
		amount = 6;
	} else if (BILLINGPERIOD.equals("Month")) {
		amount = 23;
	} else {
		amount = 240;
	}
%>
<!-- 
User input billing information
Validate the billing info
If success, redirect to billing confirm
 -->
<form method="POST" action="confirm.jsp" name="frmDCC">
	<input type="hidden" name="BILLINGPERIOD" value="<%=BILLINGPERIOD%>" /> 
	<input type="hidden" name="amount" value="<%=amount%>" />
	<br>
<center>
<font size=2 color=black face=Verdana><b>Enter
billing information</b></font> <br>
<br>
<table class="api">
	<tr>
		<td class="field">First Name:</td>
		<td><input type="text" size="30" maxlength="32" name="firstName"
			value="John" /></td>
	</tr>
	<tr>
		<td class="field">Last Name:</td>
		<td><input type="text" size="30" maxlength="32" name="lastName"
			value="Doe" /></td>
	</tr>
	<tr>
		<td class="field">Card Type:</td>
		<td><select name="creditCardType">
			<option value=Visa>Visa</option>
			<option value=MasterCard>MasterCard</option>
			<option value=Discover>Discover</option>
			<option value=Amex>American Express</option>
		</select></td>
	</tr>
	<tr>
		<td class="field">Card Number:</td>
		<td><input type=text size=19 maxlength=19 name=creditCardNumber></td>
	</tr>
	<tr>
		<td class="field">Expiration Date:</td>
		<td><select name="expDateMonth">
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select> <select name="expDateYear">
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012" selected>2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2015">2016</option>
			<option value="2015">2017</option>
			<option value="2015">2018</option>
			<option value="2015">2019</option>
			<option value="2015">2020</option>
		</select></td>
	</tr>
	<tr>
		<td class="field">Card Verification Number:</td>
		<td><input type="text" size="3" maxlength="4" name="cvv2Number"
			value="962" /></td>
	</tr>
	<tr>
		<td class="field"><b>Billing Address:</b></td>
	</tr>
	<tr>
		<td class="field">Address 1:</td>
		<td><input type="text" size="25" maxlength="100" name="address1"
			value="123 Fake St" /></td>
	</tr>
	<tr>
		<td class="field">Address 2:</td>
		<td><input type="text" size="25" maxlength="100" name="address2" />(optional)</td>
	</tr>
	<tr>
		<td class="field">City:</td>
		<td><input type="text" size="25" maxlength="40" name="city"
			value="San Jose" /></td>
	</tr>
	<tr>
		<td class="field">State:</td>
		<td><select name="state">
			<option></option>
			<option value="AK">AK</option>
			<option value="AL">AL</option>
			<option value="AR">AR</option>
			<option value="AZ">AZ</option>
			<option value="CA" selected>CA</option>
			<option value="CO">CO</option>
			<option value="CT">CT</option>
			<option value="DC">DC</option>
			<option value="DE">DE</option>
			<option value="FL">FL</option>
			<option value="GA">GA</option>
			<option value="HI">HI</option>
			<option value="IA">IA</option>
			<option value="ID">ID</option>
			<option value="IL">IL</option>
			<option value="IN">IN</option>
			<option value="KS">KS</option>
			<option value="KY">KY</option>
			<option value="LA">LA</option>
			<option value="MA">MA</option>
			<option value="MD">MD</option>
			<option value="ME">ME</option>
			<option value="MI">MI</option>
			<option value="MN">MN</option>
			<option value="MO">MO</option>
			<option value="MS">MS</option>
			<option value="MT">MT</option>
			<option value="NC">NC</option>
			<option value="ND">ND</option>
			<option value="NE">NE</option>
			<option value="NH">NH</option>
			<option value="NJ">NJ</option>
			<option value="NM">NM</option>
			<option value="NV">NV</option>
			<option value="NY">NY</option>
			<option value="OH">OH</option>
			<option value="OK">OK</option>
			<option value="OR">OR</option>
			<option value="PA">PA</option>
			<option value="RI">RI</option>
			<option value="SC">SC</option>
			<option value="SD">SD</option>
			<option value="TN">TN</option>
			<option value="TX">TX</option>
			<option value="UT">UT</option>
			<option value="VA">VA</option>
			<option value="VT">VT</option>
			<option value="WA">WA</option>
			<option value="WI">WI</option>
			<option value="WV">WV</option>
			<option value="WY">WY</option>
			<option value="AA">AA</option>
			<option value="AE">AE</option>
			<option value="AP">AP</option>
			<option value="AS">AS</option>
			<option value="FM">FM</option>
			<option value="GU">GU</option>
			<option value="MH">MH</option>
			<option value="MP">MP</option>
			<option value="PR">PR</option>
			<option value="PW">PW</option>
			<option value="VI">VI</option>
		</select></td>
	</tr>
	<tr>
		<td class="field">ZIP Code:</td>
		<td><input type="text" size="10" maxlength="10" name="zip"
			value="95131" />(5 or 9 digits)</td>
	</tr>
	<tr>
		<td class="field">Country:</td>
		<td>United States</td>
	</tr>
	<tr>
		<td class="field">Amount:</td>
		<td>$<%= amount %>.00</td>
	</tr>
	<tr>
		<td class="field"></td>
		<td><input type="hidden" name="paymentType"
			value="<%=request.getParameter("paymentType")%>"> <input
			type="Submit" class="button" value="Continue" /></td>
	</tr>
</table>
</center>
</form>
</body>
</html>