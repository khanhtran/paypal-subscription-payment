/*
 * Copyright 2005, 2008 PayPal, Inc. All Rights Reserved.
 *
 * GetTransactionDetails NVP example; last modified 08MAY23. 
 *
 * Get detailed information about a single transaction.  
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
public class GetTransactionDetails 
{

        public String getTransactionDetailsCode(String transactionId)
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
                profile.setAPIUsername("pro_ca_1278642243_biz_api1.yahoo.com");
                profile.setAPIPassword("1278642250");
                profile.setSignature("AEw-LtiI082Y9uFapEVZc-gM1qdcAQkCqtGy01JBSQBkM471qgz04IQY");
    	        profile.setEnvironment("sandbox");
    	        profile.setSubject("");
    	        caller.setAPIProfile(profile);
    	        encoder.add("VERSION", "51.0");	
    	        encoder.add("METHOD","GetTransactionDetails");

		// Add request-specific fields to the request string.
    		encoder.add("TRANSACTIONID",transactionId);

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


