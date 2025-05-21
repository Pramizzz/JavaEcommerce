package utils;

	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;

	public class hash {
	    public static void main(String[] args) {
	        String plainPassword = "susmarika";
	        String hashedPassword = hashPassword(plainPassword);
	        System.out.println("Hashed password: " + hashedPassword);
	    }

	    public static String hashPassword(String password) {
	        try {
	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] hashedBytes = md.digest(password.getBytes());

	            StringBuilder sb = new StringBuilder();
	            for (byte b : hashedBytes) {
	                sb.append(String.format("%02x", b));
	            }

	            return sb.toString();

	        } catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException("Error hashing password", e);
	        }
	    }}
	