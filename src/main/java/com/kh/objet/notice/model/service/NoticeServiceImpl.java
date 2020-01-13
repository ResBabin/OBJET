package com.kh.objet.notice.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.notice.model.dao.NoticeDao;
import com.kh.objet.notice.model.vo.Notice;
import com.kh.objet.notice.model.vo.SearchDate;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
   
   @Autowired
   private NoticeDao noticeDao;

   @Override
   public int getListCount() {
      return noticeDao.getListCount();
   }
   
   
   @Override
   public List<Notice> selectNoticeList(HashMap<String, Object> map) {
      return noticeDao.selectNoticeList(map);
   }

   @Override
   public Notice selectNoticeDetail(int noticeno) {
      return noticeDao.selectNoticeDetail(noticeno);
   }

   @Override
   public List<Notice> selectNoticeListAsc() {
      return noticeDao.selectNoticeListAsc();
   }
   @Override
   public int insertNotice(Notice notice) {
      // TODO Auto-generated method stub
      return noticeDao.insertNotice(notice);
   }


   /*@Override
   public List<Notice> selectSearchNoticeTitle(String keyword){
      return noticeDao.selectSearchNoticeTitle(keyword);
   }

   @Override
   public List<Notice> selectSearchNoticeDate(SearchDate searchDate) {
      return noticeDao.selectSearchNoticeDate(searchDate);
   }*/


   @Override
   public int noticeSearchListCount(HashMap<String, Object> mapp) {
      return noticeDao.noticeSearchListCount(mapp);
   }


   @Override
   public List<Notice> selectNoticeSearchList(HashMap<String, Object> map) {
      return noticeDao.selectNoticeSearchList(map);
   }


   @Override
   public int updateNotice(Notice notice) {
      return noticeDao.updatetNotice(notice);
   }


   @Override
   public int deleteNotice(int noticeno) {
      return noticeDao.deleteNotice(noticeno);
   }


   @Override
   public int deleteFile(Notice notice) {
      return noticeDao.deleteFile(notice);
   }


@Override
public ArrayList<Notice> selectNoticeListAd() {
	return noticeDao.selectNoticeListAd();
}




   





   

}