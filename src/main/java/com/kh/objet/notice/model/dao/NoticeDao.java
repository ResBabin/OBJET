package com.kh.objet.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
   
   @Autowired
   private SqlSessionTemplate mybatisSession;
   
   
   public NoticeDao() {}
   
   public int getListCount() {
      return mybatisSession.selectOne("csMapper.listCount");
   }

   public List<Notice> selectNoticeList(HashMap<String, Object> map) {
      return mybatisSession.selectList("csMapper.selectNoticeList",map);
   }
   

   //공지사항 세부목록 보기
   public Notice selectNoticeDetail1(int noticeno) {
      return mybatisSession.selectOne("csMapper.selectNoticeDetail", noticeno);
   }

   
   //공지사항 검색카운트
   public int noticeSearchListCount(HashMap<String, Object> mapp) {
      return mybatisSession.selectOne("csMapper.noticeSearchListCount",mapp);
      }


   //공지사항 검색기능
   public List<Notice> selectNoticeSearchList(HashMap<String, Object> map) {
        return mybatisSession.selectList("csMapper.selectNoticeSearchList", map);
       }
   
   public int insertNotice(Notice notice) {
      return mybatisSession.insert("csMapper.insertNotice",notice);
   }

   public int updatetNotice(Notice notice) {
      return mybatisSession.update("csMapper.updateNotice",notice);
   }

   public int deleteNotice(int noticeno) {
      return mybatisSession.delete("csMapper.deleteNotice",noticeno);
   }

   public int deleteFile(Notice notice) {
   return mybatisSession.update("csMapper.deleteFile",notice);
      
   }
 

////////////////////////////////////////////////////////관리자//////////////////////////////////////////////////////////

public List<Notice> selectNoticeList(){
return mybatisSession.selectList("adminMapper.selectNoticeList");
}

public Notice selectNoticeDetail(int noticeno) {
return mybatisSession.selectOne("adminMapper.selectNoticeDetail", noticeno);
}

public List<Notice> selectNoticeListAsc() {
return mybatisSession.selectList("adminMapper.selectNoticeListAsc");
}

public List<Notice> selectNoticeListAd(Map<String, String> map) {
return mybatisSession.selectList("adminMapper.selectNoticeList", map);
}

public int selectNoticeCountAd(Map<String, String> map) {
return mybatisSession.selectOne("adminMapper.selectNoticeCountAd", map);
}

public Notice selectNextPrevNotice(int noticeno) {
return mybatisSession.selectOne("adminMapper.selectNextPrevNotice", noticeno);
}
public int deleteNoticeAd(int noticeno) {
return mybatisSession.selectOne("adminMapper.deleteNoticeAd", noticeno);
}
public int updateNoticeAd(Notice notice) {
return mybatisSession.update("adminMapper.updateNoticeAd", notice);
}
public int insertNoticeAd(Notice notice) {
return mybatisSession.insert("adminMapper.insertNoticeAd", notice);
}

public List<Notice> selectNoticeSearchAd(Map<String, String> map) {
return mybatisSession.selectList("adminMapper.selectNoticeSearchAd", map);
}

public int selectNoticeSearchAdCount(Map<String, String> map) {
return mybatisSession.selectOne("adminMapper.selectNoticeSearchAdCount", map);
}

public List<Notice> selectNoticeType() {
	return mybatisSession.selectList("csMapper.selectNoticeType");
}

public List<Notice> selectNoticeType1() {
	return mybatisSession.selectList("csMapper.selectNoticeType1");
}

public List<Notice> selectNoticeType2() {
	return mybatisSession.selectList("csMapper.selectNoticeType2");
}

public List<Notice> selectNoticeType3() {
	return mybatisSession.selectList("csMapper.selectNoticeType3");
}
}


