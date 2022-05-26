package com.jobjava.JJ.counselor.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Paging {

	private int totalCount; // 게시판 전체 데이터 개수
	private int displayPageNum = 10; // 게시판 화면에서 한번에 보여질 페이지 번호의 개수

	private int startPage; // 화면의 시작 번호
	private int endPage; // 화면의 끝 번호
	private boolean prev; // 페이징 이전 버튼 활성화 여부
	private boolean next; // 페이징 다음 버튼 활성화 여부

	private CriteriaVO cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		pagingData();
	}

	private void pagingData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// endPage = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 개수) * 화면에 보여질 페이지 번호의 개수
		startPage = (endPage - displayPageNum) + 1;
		// startPage = (끝 페이지 번호 - 화면에 보여질 페이지 번호의 개수) + 1

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		// 마지막 페이지 번호 = 총 게시글 수 / 한 페이지당 보여줄 게시글의개수

		prev = startPage == 1 ? false : true;
		// 이전 버튼 생성 여부 = 시작 페이지 번호가 1과 같으면 false, 아니면 true
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		// 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 개수가 총 게시글의 수보다
		// 크거나 같으면 false, 아니면 true
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public CriteriaVO getCri() {
		return cri;
	}

	public void setCri(CriteriaVO cri) {
		this.cri = cri;
	}

	@Override
    public String toString() {
        return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
                + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
    }
   public String makeQuery(int page) {
      UriComponents uriComponents =
      UriComponentsBuilder.newInstance()
                      .queryParam("page", page)
                     .queryParam("perPageNum", cri.getPerPageNum())
                     .build();
         
      return uriComponents.toUriString();
   }
    
    
    public String makeSearch(int page)
   {
     
    UriComponents uriComponents =
               UriComponentsBuilder.newInstance()
               .queryParam("page", page)
               .queryParam("perPageNum", cri.getPerPageNum())
               .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
               .queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
               .build(); 
       return uriComponents.toUriString();  
   }

   private String encoding(String keyword) {
      if(keyword == null || keyword.trim().length() == 0) { 
         return "";
      }
       
      try {
         return URLEncoder.encode(keyword, "UTF-8");
      } catch(UnsupportedEncodingException e) { 
         return ""; 
      }
   }
    
}
