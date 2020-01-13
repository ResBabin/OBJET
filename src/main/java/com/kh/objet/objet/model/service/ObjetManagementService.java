package com.kh.objet.objet.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.objet.model.vo.ObjetManagement;

public interface ObjetManagementService {
	public List<Objet> selectAllObet(Map<String, Integer> map);
	public ObjetManagement selectObjetOne(int objetno);
	public List<Objet> selectObjetRequestManage();
	public List<Objet> selectObjetReqMain();
	public int updateRequestStatus(Map<String, String> map);
	public int updateObjetStop(int objetno);
	public List<Objet> selectStatusOrder(Map<String, String> map);
	public List<Objet> selectObjetSearch(Objet objetsearch);
	public int selectObjetListCount();
}
