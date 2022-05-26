package com.aj22.foodlab.util;

import lombok.Data;

@Data
public class Pagination {

	private int currentPage; // 현재 페이지의 페이지 번호
	private int numOfRecords; // 전체 게시물의 개수 << 참고
	private int numOfPages; // 전체 페이지의 개수
	private int numOfRecordsPerPage; // 한 페이지당 보여질 리스트의 개수
	private int numOfPagesPerRange=5;	// 한 범위의 페이지 수
	private int startPage; // 현재 범위의 시작 번호 - previous 활성화할지 말지 결정위해
	private int endPage; // 현재 범위의 끝 번호	- next 활성화할지 말지 결정위해
	private boolean previousPage; // 이전 페이지 존재 여부
	private boolean nextPage; // 다음 페이지 존재 여부
	private int firstReviewId; // 게시판 시작 리뷰 번호 <<
	

	public void pageInfo(int currentPage, int numOfRecords, int numOfRecordsPerPage) {
		this.numOfRecordsPerPage = numOfRecordsPerPage;
		this.currentPage = currentPage;
		this.numOfRecords = numOfRecords;
		this.numOfPages = numOfRecords/numOfRecordsPerPage + ((numOfRecords%numOfRecordsPerPage==0)?0:1); // rounding up
		this.startPage = (currentPage/numOfPagesPerRange)*numOfPagesPerRange + 1;
		this.endPage = numOfPagesPerRange + startPage - 1;
		
		//이전 버튼 상태
		this.previousPage = startPage == 1 ? false : true;
		
		// 게시판 시작 번호
		this.firstReviewId = (currentPage-1)*numOfRecordsPerPage;
		
		//다음 버튼 상태
		this.nextPage = endPage > numOfPages ? false : true;
		if (this.endPage > this.numOfPages) {
			this.endPage = this.numOfPages;
			this.nextPage = false;
		}
	}

}
