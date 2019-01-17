package util;

import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CiperUtil {
	private final static byte[] iv = new byte[] { // 초기화 벡터값
			(byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, (byte) 0x5A, (byte) 0x8E, 0x12, 0x39, (byte) 0x9C,
			0x07, 0x72, 0x6F, (byte) 0x5A };
	static Cipher cipher;
	static {
		try {
			/*
			 * AES : 암호 알고리즘 종류. 블럭단위가 128비트. 16바이트 CBC : 블럭화 모드 PKCS5Padding : 패딩 방식
			 */
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");// 암호이름/블록이름/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static byte[] makeKey(String key) {
		int len = key.length();
		char ch = 'A';
		for (int i = len; i < 16; i++)
			key += ch++;
		return key.substring(0, 16).getBytes(); // 16바이트로 나옴.
	}

	// 암호화
	public static String encrypt(String plain, String key) {
		byte[] ciperMsg = new byte[1024];
		try {
			Key genkey = new SecretKeySpec(makeKey(key), "AES");
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.ENCRYPT_MODE, genkey, paramSpec);
			ciperMsg = cipher.doFinal(paddingString(plain).getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return byteToHex(ciperMsg).trim();
	}

	private static String byteToHex(byte[] ciperMsg) {
		if (ciperMsg == null)
			return null;
		int len = ciperMsg.length;
		String str = "";
		for (int i = 0; i < len; i++) {
			// 01010101
			// 11111111
			if ((ciperMsg[i] & 0xFF) < 16) // & : 비트연산자
				str += "0" + Integer.toHexString(ciperMsg[i] & 0xFF);
			else
				str += Integer.toHexString(ciperMsg[i] & 0xFF);
		}
		return str;
	}

	private static String paddingString(String plain) {
		char paddingChar = ' ';
		int size = 16;
		int x = plain.length() % size;
		int len = size - x;
		for (int i = 0; i < len; i++)
			plain += paddingChar;
		return plain;
	}

	// 복호화
	public static String decrypt(String ciper, String key) {
		byte[] plainMsg = new byte[1024];
		try {
			Key genkey = new SecretKeySpec(makeKey(key), "AES");
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			// Cipher.DECRYPT_MODE : 복호화 모드 설정.
			cipher.init(Cipher.DECRYPT_MODE, genkey, paramSpec);
			plainMsg = cipher.doFinal(hexToByte(ciper.trim())); // hexToByte : 숫자로 만들어주는 작업.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new String(plainMsg).trim(); // 원래 문 나옴
	}

	private static byte[] hexToByte(String str) {
		if (str == null)
			return null;
		if (str.length() < 2)
			return null;
		int len = str.length() / 2;
		byte[] buffer = new byte[len];
		for (int i = 0; i < len; i++) {
			buffer[i] = (byte) Integer.parseInt(str.substring(i * 2, i * 2 + 2), 16);
		}
		return buffer;
	}
}
