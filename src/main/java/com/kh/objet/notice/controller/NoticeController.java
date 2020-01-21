package com.kh.objet.notice.controller;

import java.util.ArrayList;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
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
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
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
import com.kh.objet.faq.model.vo.Faq;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Autowired
	private NoticeService noticeService;

	public NoticeController() {
	}
//////////////////////////////////////////////이유진////////////////////////////////////////////////
	
    
	

	//공지사항 글쓰기 2020/01/20
@RequestMapping("insertNotice.do")
public String insertNotice() {
return "notice/insertNoticeForm";
}

@RequestMapping(value="insertNotice.do", method=RequestMethod.POST)
private  ModelAndView insertNotice(ModelAndView mv,
		Notice notice, Model model,@RequestParam(name = "noticetitle") String noticetitle,
		@RequestParam(name = "noticecontent") String noticecontent,
		HttpServletRequest request, @RequestParam("upfile") MultipartFile file) {


//새로 들어온 사진 이름 추출
String newFileName = file.getOriginalFilename();
notice.setNoticeofile(newFileName); 
//저장할 경로
String path = request.getSession().getServletContext().getRealPath("resources/images/notice");

//이미지파일 저장하기
if (newFileName != null && !(newFileName.equals(""))) {

//파일이름 날짜로 만들어서 바꿔주기
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

try {
file.transferTo(new File(path + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
} catch (Exception e) { 
e.printStackTrace();
}
}

notice.setNoticetitle(noticetitle); 
notice.setNoticecontent(noticecontent);
notice.setNoticeofile(newFileName);
int result = noticeService.insertNotice(notice);


if (result > 0) {
	mv.addObject("notice", notice);
	mv.setViewName("redirect:selectNoticeList.do");
	} else {
		mv.addObject("message", "공지사항 등록 실패");
		mv.setViewName("common/errorPage");
	}
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

@RequestMapping(value="updateNotice.do", method=RequestMethod.POST)
public ModelAndView updateNotice(ModelAndView mv, HttpServletRequest req,
		@RequestParam(name = "noticeno") int noticeno, @RequestParam(name = "noticetitle") String noticetitle,
		@RequestParam(name = "upfile", required = false) MultipartFile file,
		@RequestParam(name = "noticerfile") String noticerfile, @RequestParam(name = "noticecontent") String noticecontent, Notice notice) {

String savePath = req.getSession().getServletContext().getRealPath("resources/images/notice");

notice.setNoticetype(req.getParameter("noticetype"));
String rename = req.getParameter("rename");
String origin = req.getParameter("origin");
String newFileName = file.getOriginalFilename();
if (newFileName != null && !(newFileName.equals(""))) {
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);
try {
file.transferTo(new File(savePath + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
notice.setNoticeofile(newFileName); 
} catch (IllegalStateException | IOException e) { 
e.printStackTrace();
}
new File(savePath + "\\" + rename).delete();
}else {
notice.setNoticeofile(origin.toString());
notice.setNoticerfile(rename.toString());
}
int result = noticeService.updateNotice(notice);


if (result > 0) {
	mv.addObject("notice", notice);
	mv.setViewName("redirect:selectNoticeList.do");
	} else {
		mv.addObject("message", "공지사항 등록 실패");
		mv.setViewName("common/errorPage");
	}

	return mv;

}

//공지사항 메인 페이지로 이동
@RequestMapping("moveNotice.do")
public String moveNoticePage() {
return "notice/noticemain";
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
@SuppressWarnings("unchecked")
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
@SuppressWarnings("unchecked")
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


//파일 다운로드 처리용 메소드
@RequestMapping("nfdown.do")
public void NoticeFileDown(HttpServletResponse response, HttpServletRequest request, 
@RequestParam("fname") String fileName, @RequestParam("oname") String originName) throws IOException {
logger.info("fdown.do : " + fileName);

String savePath = request.getSession().getServletContext().getRealPath("resources/images/notice");
File downFile = new File(savePath + "\\" + fileName);
BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));

ServletOutputStream downOut = response.getOutputStream();
response.setContentType("text/plain; charset=utf-8");
response.addHeader("Content-Disposition",
"attachment; filename=\"" + new String(originName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
response.setContentLength((int) downFile.length());

int read = -1;
while ((read = bin.read()) != -1) {
downOut.write(read);
downOut.flush();
}

downOut.close();
bin.close();
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
//공지사항 다음글 이전글
@SuppressWarnings("unused")
@RequestMapping("noticeprenext.do")
public ModelAndView noticeDetail(ModelAndView mv, @RequestParam("noticeno") int noticeno) {

Notice notice = noticeService.selectNoticeDetail(noticeno);
Notice prevnotice = noticeService.selectNextPrevNotice(notice.getRnum()-1);
Notice nextnotice = noticeService.selectNextPrevNotice(notice.getRnum()+1);
//이거 나중에 맵퍼에서 쿼리문 따로 만들기
if (notice != null) {
mv.addObject("notice", notice);
mv.addObject("prevnotice", prevnotice);
mv.addObject("nextnotice", nextnotice);
mv.setViewName("notice/noticeDetail");
} else {
mv.addObject("message", "공지 상세 조회 실패");
mv.setViewName("common/error");
}
return mv;

}


//공지사항 갯수
@RequestMapping("getListCountNotice.do")
public String getListCountNotice() {
return "notice/noticemain";
}
	
//////////////////////////////////////////////////////////////////////////관리자//////////////////////////////////////////////////
@RequestMapping("noticem.do")
public String noticeListM(Model model, HttpServletRequest request) {
Map<String, String> map = new HashMap<>();
String noticetitle = request.getParameter("noticetitle");
String noticetype = request.getParameter("noticetype");
String noticecontent = request.getParameter("noticecontent");
map.put("noticetitle", noticetitle);
map.put("noticecontent", noticecontent);
map.put("noticetype", noticetype);

int currentPage = 1;
if (request.getParameter("page") != null) {
currentPage = Integer.parseInt(request.getParameter("page"));
}
int limit = 10; // 한 페이지에 출력할 목록 갯수
int listCount = noticeService.selectNoticeSearchAdCount(map); // 테이블의 전체 목록 갯수 조회
//총 페이지 수 계산
int maxPage = listCount / limit;
if (listCount % limit > 0)
maxPage++;

//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
int beginPage = (currentPage / limit) * limit + 1;
if (currentPage % limit == 0) {
beginPage -= limit;
}
int endPage = beginPage + 9;
if (endPage > maxPage)
endPage = maxPage;

//currentPage 에 출력할 목록의 조회할 행 번호 계산
int startRow = (currentPage * limit) - 9;
int endRow = currentPage * limit;
map.put("startRow", Integer.toString(startRow));
map.put("endRow", Integer.toString(endRow));
List<Notice> notices = noticeService.selectNoticeSearchAd(map);

model.addAttribute("noticetitle", noticetitle);
model.addAttribute("noticetype", noticetype);
model.addAttribute("noticecontent", noticecontent);
model.addAttribute("currentPage", currentPage);
model.addAttribute("listCount", listCount);
model.addAttribute("maxPage", maxPage);
model.addAttribute("beginPage", beginPage);
model.addAttribute("endPage", endPage);
model.addAttribute("noticelist", notices);

return "admin/noticeManagement";
}

@RequestMapping("noticemd.do")
public ModelAndView noticeDetailM(ModelAndView mv, @RequestParam("noticeno") int noticeno) {

Notice noticemd = noticeService.selectNoticeDetail(noticeno);

Notice prevnotice = noticeService.selectNextPrevNotice(noticemd.getRnum() - 1);
Notice nextnotice = noticeService.selectNextPrevNotice(noticemd.getRnum() + 1);
//이거 나중에 맵퍼에서 쿼리문 따로 만들기
if (noticemd != null) {
mv.addObject("noticemd", noticemd);
mv.addObject("prevnotice", prevnotice);
mv.addObject("nextnotice", nextnotice);
mv.setViewName("admin/noticeManageDetail");
} else {
mv.addObject("message", "공지 상세 조회 실패");
mv.setViewName("common/error");
}
return mv;

}

@RequestMapping(value = "delNoticedAd.do", method = RequestMethod.POST)
public String delNotice(Model model, @RequestParam("noticeno") int noticeno) {
int result = noticeService.deleteNotice(noticeno);
String view = "";
if (result > 0) {
view = "redirect:noticem.do";
} else {
model.addAttribute("message", "공지사항 삭제 실패");
view = "common/error";
}
return view;
}

@RequestMapping("noticeModifyPageAd.do")
public String moveModifyPageAd(Model model, @RequestParam("noticeno") int noticeno) {
Notice noticemd = noticeService.selectNoticeDetail(noticeno);
String view = "";
if (noticemd != null) {
model.addAttribute("noticemd", noticemd);
view = "admin/noticeModifyPage";
} else {
model.addAttribute("message", "수정 페이지로 이동 실패");
view = "common/error";
}
return view;
}

@RequestMapping("noticeWriteAd.do")
public String moveNoticeWriteAd() {
return "admin/noticeWrite";
}

@RequestMapping(value = "noticeinsert.do", method = RequestMethod.POST)
private String insertNoticeAd(Notice notice, Model model, HttpServletRequest request,
@RequestParam("upfile") MultipartFile file) {
String adminid = request.getParameter("adminid");
String noticetitle = request.getParameter("noticetitle");
String noticecontent = request.getParameter("noticecontent");

//새로 들어온 사진 이름 추출
String newFileName = file.getOriginalFilename();
notice.setNoticeofile(newFileName);
//저장할 경로
String path = request.getSession().getServletContext().getRealPath("resources/images/notice");

//이미지파일 저장하기
if (newFileName != null && !(newFileName.equals(""))) {

//파일이름 날짜로 만들어서 바꿔주기
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);

try {
file.transferTo(new File(path + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
} catch (Exception e) {
e.printStackTrace();
}
}
notice.setAdminid(adminid);
notice.setNoticetitle(noticetitle);
notice.setNoticecontent(noticecontent);
notice.setNoticeofile(newFileName);
int result = noticeService.insertNoticeAd(notice);

String view = "";
if (result > 0) {
view = "redirect:noticem.do";
} else {
model.addAttribute("message", "공지사항 등록 실패");
view = "common/error";
}
return view;
}

//파일 다운로드 처리용 메소드
@RequestMapping("noticefdown.do")
public void fileDownMethod(HttpServletResponse response, HttpServletRequest request,
@RequestParam("fname") String fileName, @RequestParam("oname") String originName) throws IOException {
logger.info("fdown.do : " + fileName);

String savePath = request.getSession().getServletContext().getRealPath("resources/images/notice");
File downFile = new File(savePath + "\\" + fileName);
BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));

ServletOutputStream downOut = response.getOutputStream();
response.setContentType("text/plain; charset=utf-8");
response.addHeader("Content-Disposition",
"attachment; filename=\"" + new String(originName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
response.setContentLength((int) downFile.length());

int read = -1;
while ((read = bin.read()) != -1) {
downOut.write(read);
downOut.flush();
}

downOut.close();
bin.close();
}

@RequestMapping(value = "noticeupdatead.do", method = RequestMethod.POST)
public String noticeUpdateAd(Model model, Notice notice, @RequestParam(name = "upfile") MultipartFile file,
HttpServletRequest request) {
String view = "";
String savePath = request.getSession().getServletContext().getRealPath("resources/images/notice");
notice.setNoticetitle(request.getParameter("noticetitle"));
notice.setNoticecontent(request.getParameter("noticecontent"));
notice.setNoticeno(Integer.parseInt(request.getParameter("noticeno")));
notice.setNoticetype(request.getParameter("noticetype"));
String rename = request.getParameter("rename");
String origin = request.getParameter("origin");
String newFileName = file.getOriginalFilename();
if (newFileName != null && !(newFileName.equals(""))) {
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
+ newFileName.substring(newFileName.lastIndexOf(".") + 1);
try {
file.transferTo(new File(savePath + "\\" + renameFileName));
notice.setNoticerfile(renameFileName);
notice.setNoticeofile(newFileName);
} catch (IllegalStateException | IOException e) {
e.printStackTrace();
}
new File(savePath + "\\" + rename).delete();
} else {
notice.setNoticeofile(origin.toString());
notice.setNoticerfile(rename.toString());
}
int result = noticeService.updateNoticeAd(notice);
logger.debug(notice.toString());

if (result > 0) {
view = "redirect:noticem.do";
} else {
model.addAttribute("message", "공지사항 수정 실패");
view = "common/error";
}
return view;
}

@RequestMapping("noticesearchad.do")
public String noticeSearchAd(Model model, HttpServletRequest request) {
Map<String, String> map = new HashMap<>();
String noticetitle = request.getParameter("noticetitle");
String noticetype = request.getParameter("noticetype");
String noticecontent = request.getParameter("noticecontent");
int page = Integer.parseInt(request.getParameter("page"));

map.put("noticetitle", noticetitle);
map.put("noticecontent", noticecontent);
map.put("noticetype", noticetype);

int currentPage = 1;
if (page != 0) {
currentPage = page;
}
int limit = 10; // 한 페이지에 출력할 목록 갯수
int listCount = noticeService.selectNoticeSearchAdCount(map); // 테이블의 전체 목록 갯수 조회
//총 페이지 수 계산
int maxPage = listCount / limit;
if (listCount % limit > 0)
maxPage++;

//currentPage 가 속한 페이지그룹의 시작페이지숫자와 끝숫자 계산
//예, 현재 34페이지이면 31 ~ 40 이 됨. (페이지그룹의 수를 10개로 한 경우)
int beginPage = (currentPage / limit) * limit + 1;
if (currentPage % limit == 0) {
beginPage -= limit;
}
int endPage = beginPage + 9;
if (endPage > maxPage)
endPage = maxPage;

//currentPage 에 출력할 목록의 조회할 행 번호 계산
int startRow = (currentPage * limit) - 9;
int endRow = currentPage * limit;
map.put("startRow", Integer.toString(startRow));
map.put("endRow", Integer.toString(endRow));
List<Notice> notices = noticeService.selectNoticeSearchAd(map);

model.addAttribute("noticetitle", noticetitle);
model.addAttribute("noticetype", noticetype);
model.addAttribute("noticecontent", noticecontent);
model.addAttribute("currentPage", currentPage);
model.addAttribute("listCount", listCount);
model.addAttribute("maxPage", maxPage);
model.addAttribute("beginPage", beginPage);
model.addAttribute("endPage", endPage);
model.addAttribute("noticelist", notices);

return "admin/noticeManagement";
}
}
