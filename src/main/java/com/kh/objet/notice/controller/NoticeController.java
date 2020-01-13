package com.kh.objet.notice.controller;

import java.util.ArrayList;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.notice.model.service.NoticeService;
import com.kh.objet.notice.model.vo.Notice;

import com.kh.objet.faq.controller.FaqController;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}
//////////////////////////////////////////////이유진////////////////////////////////////////////////
//공지사항 글쓰기 2020/01/06
@RequestMapping("insertNotice.do")
public String insertNotice() {
return "notice/insertNoticeForm";
}
@RequestMapping(value = "insertNotice.do", method = RequestMethod.POST)
public ModelAndView insertNotice(ModelAndView mv, HttpServletRequest req,
@RequestParam(name = "noticetitle") String noticetitle,
@RequestParam(name = "upfile", required = false) MultipartFile upload,
@RequestParam(name = "noticecontent") String noticecontent, Notice notice) {

//새로 들어온 사진 이름 추출
String newFileName = upload.getOriginalFilename();

//저장할 경로
String path = req.getSession().getServletContext().getRealPath("resources/images/notice");

//이미지파일 저장하기
if (newFileName != null && !(newFileName.equals(""))) {

//파일이름 날짜로 만들어서 바꿔주기
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

try {
upload.transferTo(new File(path + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
} catch (Exception e) {
e.printStackTrace();
}
}

notice.setNoticetitle(noticetitle); // 공지사항제목
notice.setNoticecontent(noticecontent);

int result = noticeService.insertNotice(notice);

mv.setViewName("redirect:selectNoticeList.do");
return mv;
}

//공지사항 수정하기로 이동하는 버튼
@RequestMapping("updateNotice.do")
public ModelAndView updateNotice(ModelAndView mv, @RequestParam(name="noticeno") int noticeno) {

Notice notice = noticeService.selectNoticeDetail(noticeno);

mv.addObject("notice", notice);
mv.setViewName("notice/updateNotice");
return mv;
}

//공지사항수정
@RequestMapping(value = "updateNotice.do", method = RequestMethod.POST)
public ModelAndView updateNotice(ModelAndView mv, HttpServletRequest req,
@RequestParam(name = "noticeno") int noticeno, @RequestParam(name = "noticetitle") String noticetitle,
@RequestParam(name = "upfile", required = false) MultipartFile upload,
@RequestParam(name = "noticerfile") String noticerfile, @RequestParam(name = "noticecontent") String noticecontent, Notice notice) {


//새로 들어온 사진 이름 추출
String newFileName = upload.getOriginalFilename();

//저장할 경로
String path = req.getSession().getServletContext().getRealPath("resources/images/notice");

File OFile = new File(path + "/" + noticerfile);

//이미지파일 저장하기
if (newFileName != null && !(newFileName.equals(""))) {

SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

//새사진있으면 이전사진 삭제함.
OFile.delete();

//파일 저장 폴더 지정

try {
upload.transferTo(new File(path + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
} catch (Exception e) {
e.printStackTrace();
}
}

System.out.println("공지사항 수정 : " + notice.toString());
notice.setNoticeno(noticeno);
notice.setNoticetitle(noticetitle); // 공지사항제목
notice.setNoticecontent(noticecontent);

int result = noticeService.updateNotice(notice);
System.out.println("공지사항 수정 : " + notice.toString());
mv.addObject("notice", notice);
mv.setViewName("redirect:selectNoticeList.do");
return mv;
}



//공지사항 메인 페이지로 이동
@RequestMapping("moveNotice.do")
public String moveNoticePage() {
return "notice/noticemain";
}

//공지사항 상세보기 페이지로 이동
@RequestMapping("noticeDetail.do")
public String selectNoticeDetail(@RequestParam(value="noticeno") int noticeno, Model model) {


Notice notice = noticeService.selectNoticeDetail(noticeno);

if (notice != null) {


model.addAttribute("notice", notice);
model.addAttribute("notice/noticeDetail");

} else {
model.addAttribute("message", "공지사항 상세 조회 실패");
model.addAttribute("common/errorPage");
}

return "notice/noticeDetail";
}

//공지사항 전체목록보기
@RequestMapping("selectNoticeList.do")
public String selectNoticeList(@RequestParam(name="page",required=false)String page, Model model){
logger.info("page : " + page);
int currentPage = 1;
if(page !=null) {
currentPage = Integer.parseInt(page);
}
//페이징
int limit = 10;
int listCount = noticeService.getListCount(); // 총 목록 갯수

logger.info("listCount : " + listCount + ", currentPage : " + currentPage);

//페이지 수 계산
int maxPage = (int)((double)listCount / limit + 0.9);
//현재 페이지가 포함된 페이지 그룹의 시작값
int startPage = (int)((double)currentPage / limit + 0.9);
//현재 페이지가 포함된 페이지 그룹의 끝값
int endPage = startPage + limit - 1;

if(maxPage < endPage) {
endPage = maxPage;
}

//쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
int startRow = (currentPage - 1) * limit + 1;
int endRow = startRow + limit - 1;

System.out.println(startRow + ", " + endRow);

HashMap<String, Object> map = new HashMap<String, Object>();
map.put("startRow", startRow);
map.put("endRow", endRow);

List<Notice> list = noticeService.selectNoticeList(map);

System.out.println("공지 갯수 : " + list.size());


if(list != null && list.size() > 0) {
model.addAttribute("list",list);    //전체리스트
model.addAttribute("listCount",listCount);  //리스트 전체 갯수
model.addAttribute("maxPage",maxPage);
model.addAttribute("currentPage",currentPage);
model.addAttribute("startPage",startPage);
model.addAttribute("endPage",endPage);
model.addAttribute("limit",limit);
model.addAttribute("page", page);

model.addAttribute("notice/noticemain");
} else {
model.addAttribute("message", currentPage + "페이지 목록 조회 실패");
model.addAttribute("common/error");
}


return "notice/noticemain";
}



//서버에 파일 url저장
@RequestMapping("noticeFile.do")
public String NoticeInsertFileMethod(HttpServletRequest req, HttpServletResponse resp,
MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

/* URL */
JSONObject json = new JSONObject();
PrintWriter printWriter = null;
OutputStream out = null;
System.out.println("전송 : " + multiFile.toString());

//파일명 다시 정의하기
MultipartFile file = multiFile.getFile("upload");
if (file != null) {
if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
if (file.getContentType().toLowerCase().startsWith("image/")) {
try {
String fileName = file.getName();
System.out.println("이름1: " + file.getName());

byte[] bytes = file.getBytes();
HttpSession session = req.getSession();
String uploadPath = session.getServletContext().getRealPath("resources/images/notice/");

File uploadFile = new File(uploadPath);
if (!uploadFile.exists()) {
uploadFile.mkdirs();
}

//파일명 중복되지않게 랜덤값으로 파일명주기
fileName = UUID.randomUUID().toString();

//저장할폴더+파일명
uploadPath = uploadPath + "/" + fileName;

out = new FileOutputStream(new File(uploadPath));
out.write(bytes);

printWriter = resp.getWriter();
resp.setContentType("text/html");
String fileUrl = req.getContextPath() + "/resources/images/notice/" + fileName;

json.put("uploaded", 1);
json.put("fileName", fileName);
json.put("url", fileUrl);

printWriter.println(json);
} catch (IOException e) {
e.printStackTrace();
} finally {
if (out != null) {
out.close();
}
if (printWriter != null) {
printWriter.close();
}
} // finally

} // if
} // if
} // if
return null;

} // 메소드

//서버파일 url 수정
//공지사항 수정 : 서버로 파일 전송 보내는 컨트롤러ajax
@RequestMapping("updateNoticeFile.do")
public String updateNoticeFile(HttpServletRequest req, HttpServletResponse resp,
MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

/* URL */
JSONObject json = new JSONObject();
PrintWriter printWriter = null;
OutputStream out = null;
System.out.println("전송 : " + multiFile.toString());

//파일명 다시 정의하기
MultipartFile file = multiFile.getFile("upload");
if (file != null) {
if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
if (file.getContentType().toLowerCase().startsWith("image/")) {
try {
String fileName = file.getName();
System.out.println("이름1: " + file.getName());

byte[] bytes = file.getBytes();
HttpSession session = req.getSession();
String Path = session.getServletContext().getRealPath("resources/images/notice/");// webapp

File uploadFile = new File(Path);
if (!uploadFile.exists()) {
uploadFile.mkdirs();
}

//파일명 중복되지않게 랜덤값으로 파일명주기
fileName = UUID.randomUUID().toString();

//저장할폴더+파일명
Path = Path + "/" + fileName;

/*새 파일 패스에 생성하기 : 
FileOutputStream 은 무조건 해당 파일을 생성한다.*/ 
out = new FileOutputStream(new File(Path));

//새 파일을 바이트로 작성하기
out.write(bytes);

printWriter = resp.getWriter();
resp.setContentType("text/html");
String fileUrl = req.getContextPath() + "/resources/images/notice/" + fileName;

/* int a = adminService.noticeUrlInsert(fileUrl); */
//json 데이터로 등록
//{"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
//이런 형태로 리턴이 나가야함.
json.put("uploaded", 1);
json.put("fileName", fileName);
json.put("url", fileUrl);

printWriter.println(json);
} catch (IOException e) {
e.printStackTrace();
} finally {
if (out != null) {
out.close();
}
if (printWriter != null) {
printWriter.close();
}
} // finally
} // if
} // if
} // if
return null;

} // 메소드

//공지사항 파일 다운
//공지사항 파일 다운
@RequestMapping("nfdown")
public ModelAndView noticeFileDown(ModelAndView mv,
@RequestParam("noticerfile") String noticerfile, HttpServletRequest request) {

String path = request.getSession().getServletContext().getRealPath("resources/nupfiles");
String downFilePath = path + "\\" + noticerfile;

//다운 받을 파일을 java.io.File 객체로 만듬

File downFile = new File(downFilePath);

//다운로드 처리용 클래스로 보낼 값 저장 처리

mv.addObject("downFile", downFile);
mv.addObject("noticerfile", noticerfile);

//뷰파일명 지정시에 다운로드 처리할 클래스 이름을 지정함

mv.setViewName("filedown");

return mv;
}


//공지사항 첨부 파일삭제 Ajax
@RequestMapping("deleteNoticeFile.do")
public void deleteNoticeFile(String noticerfile, int noticeno, HttpServletRequest request) {

Notice notice = noticeService.selectNoticeDetail(noticeno);

logger.info("삭제 전 : " + notice.toString());

notice.setNoticerfile(notice.getNoticerfile().replace(noticerfile, ""));

logger.info("삭제 후 : " + notice.toString());

int result = noticeService.deleteFile(notice);

if (result > 0) {

String path = request.getSession().getServletContext().getRealPath("resources/images/notice");
String deleteFilePath = path + "\\" + noticerfile;

logger.debug("삭제할 파일 이름 : "+ noticerfile);

File deleteFile = new File(deleteFilePath);

if (deleteFile.exists()) {
deleteFile.delete();
}

}

}

//공지사항 삭제
//공지사항 삭제 컨트롤러
@RequestMapping("deleteNotice.do")
public ModelAndView deleteNotice(ModelAndView mv, @RequestParam(name = "noticeno") int noticeno) {

int result = noticeService.deleteNotice(noticeno);

mv.setViewName("redirect:selectNoticeList.do");
return mv;
}



//공지사항 검색
@RequestMapping("selectNoticeSearchList.do")
public String searchNoticeList(Model model,Notice users,
@RequestParam(name = "page", required = false) String page,
@RequestParam(name = "search", required = false) String search,
@RequestParam(name="searchmenu", required=false)String searchmenu ){

System.out.println("serach : " + search);
System.out.println("serach 2: " + searchmenu);

int currentPage = 1;
if(page !=null) {
currentPage = Integer.parseInt(page);
}
//페이징
int limit = 10; // 한 페이지에 출력할 목록 갯수
HashMap<String, Object> mapp = new HashMap<String, Object>();
mapp.put("search", search);
mapp.put("searchmenu", searchmenu);

int listCount = noticeService.noticeSearchListCount(mapp);

logger.info(currentPage + ", " + listCount);


//페이지 수 계산
int maxPage = (int)((double)listCount / limit + 0.9);
//현재 페이지가 포함된 페이지 그룹의 시작값
int startPage = (int)((double)currentPage / limit + 0.9);
//현재 페이지가 포함된 페이지 그룹의 끝값
int endPage = startPage + limit - 1;

if(maxPage < endPage) {
endPage = maxPage;
}

//쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
int startRow = (currentPage - 1) * limit + 1;
int endRow = startRow + limit - 1;


HashMap<String, Object> map = new HashMap<String, Object>();
map.put("startRow", startRow);
map.put("endRow", endRow);
map.put("search", search);
map.put("searchmenu", searchmenu);
map.put("listcount", listCount);

List<Notice> nlist = noticeService.selectNoticeSearchList(map);

logger.info("공지 갯수 : " + nlist.size());


if(nlist != null && nlist.size() > 0) {
model.addAttribute("search", search);
model.addAttribute("searchmenu", searchmenu);
model.addAttribute("list",nlist);    //전체리스트
model.addAttribute("listCount",listCount);  //리스트 전체 갯수
model.addAttribute("maxPage",maxPage);
model.addAttribute("currentPage",currentPage);
model.addAttribute("startPage",startPage);
model.addAttribute("endPage",endPage);
model.addAttribute("limit",limit);
model.addAttribute("page", page);

model.addAttribute("notice/noticemain");
} else {
model.addAttribute("message", currentPage + "페이지 목록 조회 실패");
model.addAttribute("common/error");
}


return "notice/noticemain";
}



//공지사항 갯수
@RequestMapping("getListCountNotice.do")
public String getListCountNotice() {
return "notice/noticemain";
}
	
//////////////////////////////////////////////////////////////////////////관리자//////////////////////////////////////////////////
	@RequestMapping("noticem.do")
	public ModelAndView noticeListM(ModelAndView mv) {
		ArrayList<Notice> noticelist = (ArrayList<Notice>) noticeService.selectNoticeListAd();
		mv.addObject("noticelist", noticelist);
		mv.setViewName("admin/noticeManagement");
		return mv;
	}

	@RequestMapping("noticemd.do")
	public ModelAndView noticeDetailM(ModelAndView mv, @RequestParam("noticeno") int noticeno) {
		Notice noticemd = noticeService.selectNoticeDetail(noticeno);
		ArrayList<Notice> noticelist = (ArrayList<Notice>) noticeService.selectNoticeListAd();
		if (noticemd != null) {
			mv.addObject("noticemd", noticemd);
			mv.addObject("noticelist", noticelist);			
			mv.setViewName("admin/noticeManageDetail");
		} else {
			mv.addObject("message", "공지 상세 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;

	}
}
