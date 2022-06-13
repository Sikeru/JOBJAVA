package com.jobjava.JJ.counselor.vo;

public class SearchCriteria extends CriteriaVO{

	private String searchType = "";
	private String keyword = "";
	private String keyword1 = "";
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", keyword1=" + keyword1 +"]";
	}
	
}
	
	