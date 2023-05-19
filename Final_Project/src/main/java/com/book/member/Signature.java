package com.book.member;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Component;

@Component
public class Signature {
	
	public String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws Exception {
		
		String space = " ";					// one space
		String newLine = "\n";					// new line
		
		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();
		
		SecretKeySpec signingKey;
	    String encodeBase64String;

	    signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);
		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		encodeBase64String = Base64.encodeBase64String(rawHmac);;
		
		return encodeBase64String;

	}

}
