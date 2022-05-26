package com.jobjava.JJ.counselor.vo;


public class CriteriaVO {
    

    private int page;
    private int perPageNum;
    private int rowStart;
    private int rowEnd;
    
    public CriteriaVO()
    {
     this.page = 1;
     this.perPageNum = 10;
    }

    public void setPage(int page)
    {
     if (page <= 0)
     {
      this.page = 1;
      return;
     }
     this.page = page;
    }

    public void setPerPageNum(int perPageNum)
    {
     if (perPageNum <= 0 || perPageNum > 100)
     {
      this.perPageNum = 10;
      return;
     }
     this.perPageNum = perPageNum;
    }

    public int getPage()
    {
     return page;
    }

    public int getPageStart()
    {
     return (this.page - 1) * perPageNum;
    }

    public int getPerPageNum()
    {
     return this.perPageNum;
    }

    @Override
    public String toString() {
     return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ""
       + ", rowStart=" + getRowStart() + ", rowEnd=" + getRowEnd()
       + "]";
    }

    public int getRowStart() {
     rowStart = ((page - 1) * perPageNum) + 1;
     return rowStart;
    }

    public int getRowEnd() {
     rowEnd = rowStart + perPageNum - 1;
     return rowEnd;
    }
   }

