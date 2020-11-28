package servlet;

import servlet.DbConnection;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class HashController {
	private String password;

	public HashController(String password) {
		super();
		this.password = password;
	}

	public String getHashPassword() {
		
		MessageDigest digest = null;
		try {
		    digest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		byte[] hash = digest.digest(this.password.getBytes(StandardCharsets.UTF_8));
		String encoded = Base64.getEncoder().encodeToString(hash);
		
		return encoded;
	}
	
}
