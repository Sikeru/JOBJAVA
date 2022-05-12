package com.jobjava.JJ.cafe.vo;
// �Խ��� �ϴ��� ����¡
public class Paging {
    
    private int totalCount; // �Խ��� ��ü ������ ����
    private int displayPageNum = 10; // �Խ��� ȭ�鿡�� �ѹ��� ������ ������ ��ȣ�� ����
    
    private int startPage; // ȭ���� ���� ��ȣ
    private int endPage;  // ȭ���� �� ��ȣ
    private boolean prev; // ����¡ ���� ��ư Ȱ��ȭ ����
    private boolean next; // ����¡ ���� ��ư Ȱ��ȭ ����
    
    private Criteria cri;
 
    
    public int getTotalCount() {
        return totalCount;
    }
 
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        
        pagingData();
    }
    
    private void pagingData() {
        
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        // endPage = (���� ������ ��ȣ / ȭ�鿡 ������ ������ ��ȣ�� ����) * ȭ�鿡 ������ ������ ��ȣ�� ����
        startPage = (endPage - displayPageNum) + 1;
        // startPage = (�� ������ ��ȣ - ȭ�鿡 ������ ������ ��ȣ�� ����) + 1
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));    
        if(endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        // ������ ������ ��ȣ = �� �Խñ� �� / �� �������� ������ �Խñ��ǰ���
        
        prev = startPage == 1 ? false : true;    
        // ���� ��ư ���� ���� = ���� ������ ��ȣ�� 1�� ������ false, �ƴϸ� true
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
        // ���� ��ư ���� ���� = �� ������ ��ȣ * �� �������� ������ �Խñ��� ������ �� �Խñ��� ������
        // ũ�ų� ������ false, �ƴϸ� true
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
 
    public Criteria getCri() {
        return cri;
    }
 
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
    
    
    @Override
    public String toString() {
        return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
                + prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
    }
    
}


