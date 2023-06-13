package com.book.membermodel;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.model.MemberDTO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service("LoginService")
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginDAO loginDao;
	
	@Override
	public int updateMailAuth(MemberDTO memberDto) throws Exception {
		return loginDao.updateMailAuth(memberDto);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		return loginDao.emailAuthFail(id);
	}

	@Override
	public String getAccessToken(String authorize_code) {
		
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=741eb3ae7fa62ff6c3ce720118cad209"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8585/main/kakao_login_ok.go"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = conn.getResponseCode();
			
			System.out.println("responseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body : " + result);
			
			JsonParser parser = new JsonParser();
			
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return userInfo;
	}

	@Override
	public String getnaverAccessToken(String authorize_code, HttpSession session) throws Exception {
		
		String access_token = "";
	    String refresh_token = "";
	    String reqURL = "https://nid.naver.com/oauth2.0/token";
		String clientId = "eTDbNDf4IbCBkdCrvj09";
	    String clientSecret = "0V9OEgK2DD";//애플리케이션 클라이언트 시크릿값";
	    String state = (String) session.getAttribute("state");
	    String redirectURI = "http://localhost:8585/main/naver_login_ok.go";
	    
	    URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		
		conn.setDoOutput(true);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id="+clientId); //본인이 발급받은 key
		sb.append("&client_secret="+clientSecret); //애플리케이션 클라이언트 시크릿값";
		sb.append("&redirect_uri="+redirectURI); // 본인이 설정한 주소
		sb.append("&code=" + authorize_code);
		sb.append("&state=" + state);
		
		bw.write(sb.toString());
		bw.flush();
		
		int responseCode = conn.getResponseCode();
		
		System.out.println("responseCode : " + responseCode);
	    
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String line = "";
		String result = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		
		access_token = element.getAsJsonObject().get("access_token").getAsString();
		refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
		
		br.close();
		bw.close();
		
		return access_token;
	}

	@Override
	public HashMap<String, Object> getnaverUserInfo(String access_Token) throws Exception {
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://openapi.naver.com/v1/nid/me";
		
		URL url = new URL(reqURL);
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		
		int responseCode = conn.getResponseCode();
		
		System.out.println("responseCode : " + responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		
		String line = "";
		String result = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		
		System.out.println("response body : " + result);
		
		JsonParser parser = new JsonParser();
		
		JsonElement element = parser.parse(result);
		
		JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
		
		String name = response.getAsJsonObject().get("name").getAsString();
		String email = response.getAsJsonObject().get("email").getAsString();
		String phone = response.getAsJsonObject().get("mobile").getAsString();
		String birthyear = response.getAsJsonObject().get("birthyear").getAsString();
		String birthday = response.getAsJsonObject().get("birthday").getAsString();
		String gender = response.getAsJsonObject().get("gender").getAsString();
		
		userInfo.put("nickname", name);
		userInfo.put("email", email);
		userInfo.put("phone", phone);
		userInfo.put("birthyear", birthyear);
		userInfo.put("birthday", birthday);
		userInfo.put("gender", gender);
		
		return userInfo;
	}

	@Override
	public int phoneSearchGetId(MemberDTO dto) {
		return this.loginDao.phoneSearchGetId(dto);
	}

	@Override
	public int emailSearchGetId(MemberDTO dto) {
		return this.loginDao.emailSearchGetId(dto);
	}

	@Override
	public MemberDTO getmemberonelist(String memberEmail) {
		return this.loginDao.getmemberonelist(memberEmail);
	}

	@Override
	public int phoneSearchGetPwd(MemberDTO dto) {
		return this.loginDao.phoneSearchGetPwd(dto);
	}
	
	@Override
	public int emailSearchGetPwd(MemberDTO dto) {
		return this.loginDao.emailSearchGetPwd(dto);
	}

	@Override
	public MemberDTO getmemberonelistbyId(String memberId) {
		return this.loginDao.getmemberonelistbyId(memberId);
	}

	@Override
	public void pwdReset(MemberDTO dto) {
		this.loginDao.pwdReset(dto);
	}

}
