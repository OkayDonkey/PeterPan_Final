package com.book.boardmodel;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.book.model.BoardDTO;

@Service
@Controller
public class Upload {
	
	@Inject
	private BoardDAO dao;
	
	@RequestMapping("board_qna_ok.go")
	public void fileUpload(BoardDTO dto, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {

		String uploadPath = "C:\\Users\\jjyou\\Documents\\githurb\\Final_Froject_book\\Final_Project\\src\\main\\webapp\\resources\\upload";

		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);

		int month = cal.get(Calendar.MONTH) + 1;

		int day = cal.get(Calendar.DAY_OF_MONTH);

		// getFileNames() : 업로드된 파일들의 이름 목록을 제공해 주는 메서드.
		Iterator<String> iterator = mRequest.getFileNames();

			String uploadFileName = iterator.next();

			// file1으로 뜸.
			MultipartFile mFile = mRequest.getFile(uploadFileName);

			// 실제 파일 이름
			String originalFileName = mFile.getOriginalFilename();

			// 실제 폴더를 만들어 보자
			// ..........\\resourcess\\upload\\2023-05-12
			String homedir = uploadPath + "/" + year + "-" + month + "-" + day;

			File path1 = new File(homedir);

			if (!path1.exists()) {
				path1.mkdirs();
			}

			// 실제 파일을 만들어 보자.
			String saveFileName = originalFileName;

			if (!saveFileName.equals("")) {
				// currentTimeMillis ==> 1000분의 1초 단위로 이름이 바뀐다.
				saveFileName = System.currentTimeMillis() + "_" + saveFileName;

				try {
					File origin = new File(homedir + "/" + saveFileName);

					// transferTo() : 파일데이터를 지정한 폴더로 실제 저장시키는 메서드.
					mFile.transferTo(origin);

				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			
		dto.setBoardFile(saveFileName);
		int check = this.dao.insertQna(dto);
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		if (check > 0) {
			out.println("<script>");
			out.println("alert('접수 성공')");
			out.println("location.href='boardQna.go'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('접수 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
}
