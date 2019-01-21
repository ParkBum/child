package util;

import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/*
 * 1. 회원 가입/수정시 이메일을 암호화하여 db에 저장하기
 * 2. 조회시 복호화하여 화면에 출력하기 : 회원 조회, 회원 목록 조회
 */
public class CipherUtil {
	// iv : 초기화 벡터값
	private final static byte[] iv = new byte[] { (byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, (byte) 0x5A,
			(byte) 0x8E, 0x12, 0x39, (byte) 0x9C, 0x07, 0x72, 0x6F, (byte) 0x5A };

	static Cipher cipher;
	static {
		try {
			// AES방식, CBC모드, PKCS5패딩
			// AES : 암호 알고리즘 종류. 블럭단위가 128비트 형태. 1블럭 = 16바이트
			// CBC : 블럭화 모드
			// PKCS5Padding : 패딩 방식
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static byte[] getMakeKey(String algo) throws Exception {
		// AES 알고리즘 : 128, 192, 256 비트 중 한개 선택가능
		KeyGenerator keyGen = KeyGenerator.getInstance(algo);
		keyGen.init(128); // 128비트 키 설정
		SecretKey key = keyGen.generateKey(); // 키 생성
		return key.getEncoded();
	}

	// 암호화
	public static String encrypt(String plain, String key) {
		byte[] ciperMsg = new byte[1024];
		try {
			Key genkey = new SecretKeySpec(makeKey(key), "AES"); // key 객체 생성
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.ENCRYPT_MODE, genkey, paramSpec); // 암호화 모드
			ciperMsg = cipher.doFinal(paddingString(plain).getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return byteToHex(ciperMsg).trim();
	}

	private static byte[] makeKey(String key) {
		int len = key.length();
		char ch = 'A';
		for (int i = len; i < 16; i++)
			key += ch++;
		return key.substring(0, 16).getBytes(); // 16바이트보다 클경우 자르고 가져옴
	}

	// 128비트단위로 블럭화
	private static String paddingString(String plain) { // 패딩 처리
		char paddingChar = ' ';
		int size = 16; // 바이트 수
		int x = plain.length() % size;
		int len = size - x;
		for (int i = 0; i < len; i++)
			plain += paddingChar; // 남는 공간을 공백으로 채워줌
		return plain;
	}

	private static String byteToHex(byte[] ciperMsg) {
		if (ciperMsg == null)
			return null;
		int len = ciperMsg.length;
		String str = "";
		for (int i = 0; i < len; i++) {
			// 부호비트 맞추기.
			if ((ciperMsg[i] & 0xFF) < 16)
				str += "0" + Integer.toHexString(ciperMsg[i] & 0xFF);
			else
				str += Integer.toHexString(ciperMsg[i] & 0xFF);
		}
		return str;
	}

	// 복호화
	public static String decrypt(String ciper, String key) {
		byte[] plainMsg = new byte[1024];
		try {
			Key genkey = new SecretKeySpec(makeKey(key), "AES"); // 암호화와 같은 키로 설정해야함
			AlgorithmParameterSpec paramSpec = new IvParameterSpec(iv);
			cipher.init(Cipher.DECRYPT_MODE, genkey, paramSpec); // Cipher.DECRYPT_MODE :복호화 모드로 설정
			plainMsg = cipher.doFinal(hexToByte(ciper.trim())); // 복호화
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new String(plainMsg).trim();
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
