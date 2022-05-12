package com.jobjava.JJ.cafe.vo;

public class Criteria {
    
    // Ư�� ������ ��ȸ�� ���� Ŭ����
    private int page; // ���� ������ ��ȣ
    private int perPageNum; // �������� ������ �Խñ��� ����
    
    public int getPageStart() {
        // Ư�� �������� ������ ���ϴ� ����, ���� �������� �Խñ� ���� ��ȣ
        // 0 ~ 10 , 10 ~ 20 �̷�������
        return (this.page -1) * perPageNum;
    }
 
    public Criteria() {
        // �⺻ ������ : ���� �Խ��ǿ� ���Խ� �ʿ��� �⺻��
        this.page = 1;
        this.perPageNum = 10;
    }
 
    // ���� ������ ��ȣ page : getter, setter
    public int getPage() {
        return page;
    }
 
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
            
        } else {
            this.page = page;
        }    
    }
 
    
    // �������� ������ �Խñ��� ���� perPageNum : getter, setter
    public int getPerPageNum() {
        return perPageNum;
    }
 
    public void setPerPageNum(int perPageNum) {
        int cnt = this.perPageNum;
        
        if(perPageNum != cnt) {
            this.perPageNum = cnt;    
        } else {
            this.perPageNum = perPageNum;
        }
        
    }
    
    @Override
    public String toString() {
        return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
    }
}


