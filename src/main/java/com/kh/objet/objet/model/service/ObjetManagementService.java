package com.kh.objet.objet.model.service;

import java.util.List;

import com.kh.objet.objet.model.vo.Objet;

public interface ObjetManagementService {
	public List<Objet> selectAllObet();
	public Objet selectObjetOne(int objetno);
	public List<Objet> selectObjetRequestManage();
}
