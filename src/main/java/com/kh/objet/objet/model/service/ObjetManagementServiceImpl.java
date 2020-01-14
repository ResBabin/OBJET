package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.dao.ObjetManagementDao;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ObjetManagement;
@Service("objetmService")
public class ObjetManagementServiceImpl implements ObjetManagementService{
	@Autowired
	private ObjetManagementDao objetmDao;
	
	@Override
	public List<Objet> selectAllObet(Map<String, Integer> map) {
		return objetmDao.selectAllObjet(map);
	}

	@Override
	public ObjetManagement selectObjetOne(int objetno) {
		return objetmDao.selectObjetOne(objetno);
	}

	@Override
	public List<Objet> selectObjetRequestManage() {
		return objetmDao.selectObjetRequestManage();
	}

	@Override
	public List<Objet> selectObjetReqMain() {
		return objetmDao.selectObjetReqMain();
	}

	@Override
	public int updateRequestStatus(Map<String, String> map) {
		return objetmDao.updateRequestStatus(map);
	}

	@Override
	public int updateObjetStop(int objetno) {
		return objetmDao.updateObjetStop(objetno);
	}

	@Override
	public List<Objet> selectStatusOrder(Map<String, String> map) {
		return objetmDao.selectStatusOrder(map);
	}

	@Override
	public List<Objet> selectObjetSearch(Objet objetsearch) {
		return objetmDao.selectObjetSearch(objetsearch);
	}

	@Override
	public int selectObjetListCount() {
		return objetmDao.selectObjetListCount();
	}

	@Override
	public int selectStatusOrderList(Map<String, String> map) {
		return objetmDao.selectStatusOrderList(map); 
	}

}
