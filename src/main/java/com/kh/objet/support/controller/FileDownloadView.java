package com.kh.objet.support.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//스프링에서 뷰리졸버에 의해 실행되는 뷰클래스가 되려면, 반드시 AbstractView를 상속받은 후손이어야 한다.
//추상메소드 오버라이딩 하지 않으면 ↓에러 떨어짐.
@Component("filedown")		// 컨트롤러이긴 하나 파일 다운을 위한 컨트롤러는 Component로 어노테이션 해야함.
public class FileDownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 컨트롤러에서 뷰리졸버로 리턴한 model 정보가 자동 전달됨(downFile이름으로 왔음)
		// 리턴타입 objet(실제 타입은 file). -> 형변환 해야 함.
		
		
		// 확인용
		//System.out.println("file : " + ((File)model.get("downfile")).getName());
		
		// 파일 객체 추출
		File downFile = (File)model.get("downFile");
		
		// 한글 파일명 인코딩 처리 위해 파일명 추출
		String fileName = downFile.getName();
		
		// text/plain이어야 파일다운으로 이어짐. 아니면 웹페이지 이동
		response.setContentType("text/plain; charset=utf-8");
		response.addHeader("Content-Disposition", "attatchment; filename=\"" + new String(fileName.getBytes("utf-8"), "ISO-8859-1") + "\"");
		
		// 파일 길이 설정
		response.setContentLength((int)downFile.length());
		
		OutputStream out = response.getOutputStream();
		FileInputStream fin = null;
		
		try {
			fin = new FileInputStream(downFile);		// downFile <- 저장폴더 파일명 들어있음.
			FileCopyUtils.copy(fin, out);	// 파일 입출력 처리해주는 클래스
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(fin != null) {	// 스트림이 열려있다면
				try {
					fin.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
		out.flush();
		out.close();
	}

}
