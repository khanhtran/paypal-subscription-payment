/*
 * Copyright 2005, 2008 PayPal, Inc. All Rights Reserved.
 *
 * DoReauthorization NVP example; last modified 08MAY23. 
 *
 * Reauthorize a previously authorized payment.  
 */
package com.nvp.codegenerator;

import com.paypal.sdk.core.nvp.NVPDecoder;
import com.paypal.sdk.core.nvp.NVPEncoder;
import com.paypal.sdk.profiles.APIProfile;
import com.paypal.sdk.profiles.ProfileFactory;
import com.paypal.sdk.services.NVPCallerServices;
/**
 * PayPal Java SDK sample code
 */
public class ReAuthorization 
{

	public String ReauthorizationCode(String authorizationId,String amount,String currencyCode)
	{

		NVPCallerServices caller = null;
		NVPEncoder encoder = new NVPEncoder();
		NVPDecoder decoder = new NVPDecoder();
		
		try
		{
		caller = new NVPCallerServices();
		APIProfile profile = ProfileFactory.createSignatureAPIProfile();
			/*
			 WARNING: Do not embed plaintext credentials in your application code.
			 Doing so is insecure and against best practices.
			 Your API credentials must be handled securely. Please consider
			 encrypting them for use in any production environment, and ensure
			 that only authorized individuals may view or modify them.
			 */

		// Set up your API credentials, PayPal end point, API operation and version.
		profile.setAPIUsername("sdk-three_api1.sdk.com");
		profile.setAPIPassword("QFZCWN5HZM8VBG7Q");
		profile.setSignature("AVGidzoSQiGWu.lGj3z15HLczXaaAcK6imHawrjefqgclVwBe8imgCHZ");
		profile.setEnvironment("sandbox");
		profile.setSubject("");
		caller.setAPIProfile(profile);
		encoder.add("VERSION", "51.0");
		encoder.add("METHOD","DoReauthorization");

		// Add request-specific fields to the request string.
		encoder.add("AuthorizationID",authorizationId);
		encoder.add("AMT",amount);
		encoder.add("CURRENCYCODE",currencyCode);	

		// Execute the API operation and obtain the response.
		String NVPRequest = encoder.encode();
		String NVPResponse = caller.call(NVPRequest);
		decoder.decode(NVPResponse);
			
		}catch (Exception ex)
		{
			ex.printStackTrace();
		}
		
		return decoder.get("ACK");
	}
}
