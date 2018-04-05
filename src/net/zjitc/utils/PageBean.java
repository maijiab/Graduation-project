package net.zjitc.utils;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/29.
 */
public class PageBean<E> {
    private Integer page;
    private Integer limit;
    private Integer count;
    private List<E> list;
    private Integer startIndex;
    private Integer endIndex;
    private Integer pageCount;

    public Integer getPage() {
        return page;
    }
    public PageBean(Integer page, Integer limit, Integer count, List<E> list) {
        this.page = page;
        this.limit = limit;
        this.count = count;
        this.list = list;
        pageCount = 3 ;

        if ((count % limit)>0){
            pageCount++;
        }

        if (pageCount<10){
            startIndex = 1;
            endIndex = pageCount;
        }else {
            //默认显示当前页与前面4页和后面5页
            startIndex = page - 4;
            endIndex = page + 5;
            //如果前面没有4页，则从第一页显示
            if ( startIndex < 0){
                startIndex = 1;
                endIndex =3; //
            }else //如果后面没有5页，则显示最后一页的前9页与最后一页
                if (endIndex>pageCount){
                    startIndex = pageCount-9;
                    endIndex = pageCount;
                }

        }
    }
    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<E> getList() {
        return list;
    }

    public void setList(List<E> list) {
        this.list = list;
    }

    public Integer getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(Integer endIndex) {
        this.endIndex = endIndex;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }


    public PageBean(){
    };
}
