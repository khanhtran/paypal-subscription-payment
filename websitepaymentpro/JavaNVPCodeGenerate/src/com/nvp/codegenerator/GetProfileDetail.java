package com.nvp.codegenerator;

import com.paypal.sdk.core.nvp.NVPDecoder;
import com.paypal.sdk.core.nvp.NVPEncoder;
import com.paypal.sdk.profiles.APIProfile;
import com.paypal.sdk.profiles.ProfileFactory;
import com.paypal.sdk.services.NVPCallerServices;

public class GetProfileDetail {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// business account: pro_ca_1278642243_biz@yahoo.com
		// Direct payment: PROFILEID=I-YS6WTA170CJM
		// Express checkout: PROFILEID=I-AAW8RC1GSKF5

		String directPaymentProfileID = "I-YS6WTA170CJM";
		String expressCheckoutProfileID = "I-AAW8RC1GSKF5";

		NVPCallerServices caller = null;
		NVPEncoder encoder = new NVPEncoder();
		NVPDecoder decoder = new NVPDecoder();

		caller = new NVPCallerServices();
		APIProfile profile = ProfileFactory.createSignatureAPIProfile();

		// Set up your API credentials, PayPal end point, API operation and
		// version.
		profile.setAPIUsername("pro_ca_1278642243_biz_api1.yahoo.com");
		profile.setAPIPassword("1278642250");
		profile.setSignature("AEw-LtiI082Y9uFapEVZc-gM1qdcAQkCqtGy01JBSQBkM471qgz04IQY");
		profile.setEnvironment("sandbox");
		profile.setSubject("");
		caller.setAPIProfile(profile);
		encoder.add("VERSION", "51.0");
		encoder.add("METHOD", "GetRecurringPaymentsProfileDetails");

		// Add request-specific fields to the request string.
		encoder.add("ProfileID", directPaymentProfileID);

		// Execute the API operation and obtain the response.
		String NVPRequest = encoder.encode();
		String NVPResponse = caller.call(NVPRequest);
		// decoder.decode(NVPResponse);
		System.out.println(NVPRequest);
		System.out.println(NVPResponse);
	}
}
