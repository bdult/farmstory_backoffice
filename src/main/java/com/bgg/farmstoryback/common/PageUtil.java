package com.bgg.farmstoryback.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class PageUtil {

	//key name
	public static final String ROWNUM_KEY = "rownum";
	public static final String PER_KEY = "perpage"; 
	
	public static final int DEFAULT_NUM = 1; 
	public static final int PAGE_SIZE = 10; // 한 화면에 보여질 **페이지** 갯수
	public static final int PER_PAGE = 10; // 한 페이지에 보여질 **글** 갯수
	public static final int PAGE_BLOCK = 10; // 페이징 block

	public int getPerPage() {
		return PER_PAGE;
	}

	public int getTotalPageCnt(int totalCnt) {
		return ((totalCnt - 1) / PER_PAGE) + 1;
	}

	public int getFirstPageNum(int pageNum) {
		// ( (페이지 번호 -1) / 총 페이지 사이즈 ) * 총 페이지 사이즈 + 1
		return ((pageNum - 1) / PAGE_SIZE) * PAGE_SIZE + 1;
	}

	public int getLastPageNum(int fistPageNum) {
		// 시작 페이지 번호 + 페이지 총 사이즈 -1
		return (fistPageNum + PAGE_SIZE) - 1;
	}

	public int getStartRowNum(int pageNum) {
		return ((pageNum - 1) * PAGE_SIZE);
	}
	
	public int getLastRowNum(int pageNum) {
		int startRowNum = getStartRowNum(pageNum);
		return startRowNum+PER_PAGE;
	}
	
	

	/**
	 *  현재 페이지 와 Total Count 넣어 주면 Page Link를 리턴 해줌
	 * @param totalCnt
	 * @param pageNum
	 * @return
	 */
//	public Map<String, Object> pageLink(int totalCnt, int pageNum, String search) {
	public Map<String, Object> pageLink(int totalCnt, Map parameter) {
		
		Map<String, Object> pageLinkMap = new HashMap<String, Object>();
		int totalPage = this.getTotalPageCnt(totalCnt);
		pageLinkMap.put("totalCount", totalCnt);
		
		int blockPage = creatBlockPageInfo(parameter, pageLinkMap, totalPage);
		
		setPageNumInfo(parameter, pageLinkMap, totalPage, blockPage);
		
		return pageLinkMap;
	}

	private void setPageNumInfo(Map parameter,
			Map<String, Object> pageLinkMap, int totalPage, int blockPage) {
		// 요청 페이지 number 세팅
		int pageNum = DEFAULT_NUM;
		if(parameter.get("pageNum") != null){
			try {
				pageNum  = Integer.parseInt((String)parameter.get("pageNum"));
			} catch (Exception e) {
				
			}
		}else{
			pageNum = (blockPage-1)*PAGE_BLOCK+1;
		}
		
		
		int firstPageNum = this.getFirstPageNum(pageNum);
		int lastPageNum = this.getLastPageNum(firstPageNum);
		
		
		lastPageNum = totalPage < lastPageNum ? totalPage : lastPageNum;

		List<Map<String, String>> pageList = new ArrayList<Map<String, String>>();
		for (int pageNumSeq = firstPageNum; pageNumSeq <= lastPageNum; pageNumSeq++) {
			Map<String, String> pageMap = new HashMap<String, String>();
			pageMap.put("pageNum", pageNumSeq + "");
			pageList.add(pageMap);
		}
		pageLinkMap.put("lastPage", (int)Math.ceil(totalPage / 1));
		pageLinkMap.put("pageList", pageList);// 페이지 리스트
		pageLinkMap.put("pageNum", pageNum);// 현재 페이지 번호
		pageLinkMap.put("startNo", getStartRowNum(pageNum));
		pageLinkMap.put("perPage", PER_PAGE);
		pageLinkMap.put("search", parameter.get("search"));
	}

	private int creatBlockPageInfo(Map parameter,
			Map<String, Object> pageLinkMap, int totalPage) {
		// 요청 페이지 block 세팅
		int blockPage = DEFAULT_NUM;
		if(parameter.get("blockPage") != null){
			try {
				blockPage  = Integer.parseInt((String)parameter.get("blockPage"));
			} catch (Exception e) {
				
			}
		}
		int totalBlockPage = ((totalPage - 1) / PAGE_BLOCK) + 1;
		int nextBlockPage = blockPage+1;
		int preBlockPage = blockPage-1;
		if(blockPage >= totalBlockPage){
			nextBlockPage = totalBlockPage;
		}
		
		if(preBlockPage <= 0){
			preBlockPage = DEFAULT_NUM;
		}
		pageLinkMap.put("nextBlockPage", nextBlockPage);// 현재 페이지 번호
		pageLinkMap.put("preBlockPage", preBlockPage);// 현재 페이지 번호
		pageLinkMap.put("blockPage", blockPage);// 현재 페이지 번호
		pageLinkMap.put("totalBlockPage", totalBlockPage);// 현재 페이지 번호
		return blockPage;
	}
	
}
