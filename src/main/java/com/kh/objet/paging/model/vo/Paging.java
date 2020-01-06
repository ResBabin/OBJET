package com.kh.objet.paging.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Paging implements Serializable {

	private static final long serialVersionUID = 19000L;
	
	private int currentPage; // 현재 페이지를 표시할 변수

	private int limit = 10; // 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
	
	private double add = 1-(1.0/limit); 	//0.9

	private int listCount; // DB에서의 모든 행의 합 

	private int maxPage; // 전체 페이지에서 가장 마지막 페이지

	private int startPage; // 현재 페이지가 포함된 페이지 그룹의 시작값

	private int endPage; // 현재 페이지가 포함된 페이지 그룹의 끝값

	private int startRow; // 쿼리에서 검색할 시작 행 수
	
	private int endRow;  //쿼리에서 검색할 끝 행 수 
	
	private int underlimit = 5; // 프론트 하단 페이지 개수 
	
	public Paging() {
		// TODO Auto-generated constructor stub
	}

	
	
	//페이징 메소드 
	public void makePage(int listCount, int curPage) {
		
		this.setCurrentPage(curPage);
		this.setListCount(listCount);
		
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		this.setMaxPage((int)((double)listCount / limit + add));
		
		// 현재 페이지에 보여줄 시작페이지 수
		// 1, 11, 21, 31,...
		this.setStartPage((int)((double) currentPage / limit + 0.9));
		// 목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ...)
		this.setEndPage( startPage + limit - 1);
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		this.setStartRow((curPage -1 ) * limit +1 );
		this.setEndRow( startRow + limit - 1 );
	}



	public Paging(int currentPage, int limit, double add, int listCount, int maxPage, int startPage, int endPage,
			int startRow, int endRow, int underlimit) {
		super();
		this.currentPage = currentPage;
		this.limit = limit;
		this.add = add;
		this.listCount = listCount;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.underlimit = underlimit;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getLimit() {
		return limit;
	}



	public void setLimit(int limit) {
		this.limit = limit;
	}



	public double getAdd() {
		return add;
	}



	public void setAdd(double add) {
		this.add = add;
	}



	public int getListCount() {
		return listCount;
	}



	public void setListCount(int listCount) {
		this.listCount = listCount;
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getStartRow() {
		return startRow;
	}



	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}



	public int getEndRow() {
		return endRow;
	}



	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}



	public int getUnderlimit() {
		return underlimit;
	}



	public void setUnderlimit(int underlimit) {
		this.underlimit = underlimit;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", limit=" + limit + ", add=" + add + ", listCount=" + listCount
				+ ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", startRow="
				+ startRow + ", endRow=" + endRow + ", underlimit=" + underlimit + "]";
	}
	


	
}
