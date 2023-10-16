package apc.util;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class SearchVO implements Serializable {
	
	private static final long serialVersionUID = 2548377950888283294L;
	
	/** 검색 **/
    private String searchCondition="";
    private String searchCondition2="";
    private String searchCondition3="";
    
    private String temp = "";
    private String temp2 = "";
	private String temp3 = "";

	private String searchKeyword = "";
    private String searchStDate="";
    private String searchEdDate="";
    private String searchStDate2="";
    private String searchEdDate2="";
    private String cmd;
    
    /** 공통 **/
    private MultipartFile uploadFile;

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	/** 페이징 **/
    private int pageIndex = 1;
    private int pageIndex2 = 1;
    private int pageUnit = 24;
    private int pageSize = 10;
    private int firstIndex = 1;


	private int firstIndex2 = 1;
    private int lastIndex = 1;
    private int recordCountPerPage = 10;
    
	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}
	
	public int getPageIndex2() {
		return pageIndex2;
	}

	public void setPageIndex2(int pageIndex2) {
		this.pageIndex2 = pageIndex2;
	}

	public String getToday() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		return today;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}
	
	public String getSearchCondition3() {
		return searchCondition3;
	}

	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}
	
	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getTemp2() {
		return temp2;
	}

	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	public String getTemp3() {
		return temp3;
	}

	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchStDate() {
		return searchStDate;
	}

	public void setSearchStDate(String searchStDate) {
		this.searchStDate = searchStDate;
	}

	public String getSearchEdDate() {
		return searchEdDate;
	}

	public void setSearchEdDate(String searchEdDate) {
		this.searchEdDate = searchEdDate;
	}

	public String getSearchStDate2() {
		return searchStDate2;
	}

	public void setSearchStDate2(String searchStDate2) {
		this.searchStDate2 = searchStDate2;
	}

	public String getSearchEdDate2() {
		return searchEdDate2;
	}

	public void setSearchEdDate2(String searchEdDate2) {
		this.searchEdDate2 = searchEdDate2;
	}

	public int getFirstIndex2() {
		return firstIndex2;
	}

	public void setFirstIndex2(int firstIndex2) {
		this.firstIndex2 = firstIndex2;
	}
}
