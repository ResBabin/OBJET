package com.kh.objet.objet.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.dao.ObjetManagementDao;
import com.kh.objet.objet.model.vo.Objet;
@Service("objetmService")
public class ObjetManagementServiceImpl implements ObjetManagementService{
	@Autowired
	private ObjetManagementDao objetmDao;
	
	@Override
	public List<Objet> selectAllObet() {
		return objetmDao.selectAllObjet();
	}

	@Override
	public Objet selectObjetOne(int objetno) {
		return objetmDao.selectObjetOne(objetno);
	}

}
