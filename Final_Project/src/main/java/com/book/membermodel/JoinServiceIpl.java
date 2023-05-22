package com.book.membermodel;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.book.member.MailHandler;
import com.book.member.Signature;
import com.book.member.TempKey;
import com.book.model.MemberDTO;

@Service("JoinService")
public class JoinServiceIpl  implements JoinService{
	
	@Autowired
	private JoinDAO joinDao;
	
	@Autowired
    JavaMailSender mailSender;
	
	@Autowired
	private Signature signature;

	@Override
	public int updateMailKey(MemberDTO memberDto) throws Exception {
		return joinDao.updateMailKey(memberDto);
	}
	
	@Override
    public void join(MemberDTO memberDto) throws Exception {
        //랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
        String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
        memberDto.setMailKey(mail_key);

        //회원가입
        joinDao.join(memberDto);
        joinDao.updateMailKey(memberDto);

        //회원가입 완료하면 인증을 위한 이메일 발송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[피터팬 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>피터팬 메일인증</h1>" +
                "<br>피터팬에 오신것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8585/main/registerEmail.go?memberEmail=" + memberDto.getMemberEmail() +
                "&mailKey=" + mail_key +
                "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("pit230615@gmail.com", "피터팬");
        sendMail.setTo(memberDto.getMemberEmail());
        sendMail.send();
		
    }
	
	@Override
	public int sendSMS(String phone, HttpSession session) throws Exception {

		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "mqmzcj6Q7RF6UoR2WQNy";                     	// 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키			// Access Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID
		String secretKey = "j5L4QPvMCskkV4BahSgUpdUcu6IKspMA4fFlPOBT";  // 2차 인증을 위해 서비스마다 할당되는 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > 인증키 관리 > Access Key ID	
		String serviceId = "ncp:sms:kr:301428297569:peterpan";       // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;
		
		// 인증번호(난수) 생성
		Random radom = new Random();
		int validCode = radom.nextInt(88888) + 111111;
		
		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
	    JSONArray  toArr = new JSONArray();
	    
	    //toJson.put("subject","");							// Optional, messages.subject	개별 메시지 제목, LMS, MMS에서만 사용 가능
	    //toJson.put("content","sms test in spring 111");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    toJson.put("to",phone);								// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
	    toArr.put(toJson);
	    
	    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
	    //bodyJson.put("contentType","");					// Optional, 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	    //bodyJson.put("countryCode","82");					// Optional, 국가 전화번호, (default: 82)
	    bodyJson.put("from","01068149270");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
	    //bodyJson.put("subject","");						// Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
	    bodyJson.put("content","[피터팬] 인증번호\n ["+validCode+"]를 입력해주세요.");	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
	    
	    //String body = bodyJson.toJSONString();
	    String body = bodyJson.toString();
	    
	    System.out.println(body);
	    
	    URL url = new URL(apiUrl);

        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setUseCaches(false);
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty("content-type", "application/json");
        con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
        con.setRequestProperty("x-ncp-iam-access-key", accessKey);
        con.setRequestProperty("x-ncp-apigw-signature-v2", signature.makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
        con.setRequestMethod(method);
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        
        wr.write(body.getBytes());
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader br;
        System.out.println("responseCode" +" " + responseCode);
        if(responseCode == 202) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();
        
        System.out.println(response.toString());
        
        session.setAttribute("validateNo", validCode);
        
		return responseCode;

   }

	@Override
	public int checkIfAlreadyJoined(MemberDTO dto) {
		return joinDao.checkIfAlreadyJoined(dto);
	}

	@Override
	public MemberDTO getmemberonelist(String phone) {
		return joinDao.getmemberonelist(phone);
	}

}
