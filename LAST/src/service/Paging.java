package service;

public class Paging {
	private int perCount = 10;		// 페이지 당 게시글 수
	private int offset;				// 테이블을 가져올 위치
	private int perPage = 10;		// 페이지 당 페이지 번호 개수
	private int totalPage;			// 총 페이지 수
	private int section;			// 페이지 index
	private int begin, end;			// 페이지 시작/끝 번호
	private boolean next, prev;		// 이전/다음 section 유무
	
	public Paging(int reqPage, int boardCount) {	// 사용자가 요청한 페이지
													// 총 게시글 수
		offset = (reqPage - 1) * perCount;
		
		totalPage = boardCount / perPage;
		totalPage += (boardCount % perPage == 0) ? 0 : 1;
		
		section = (reqPage - 1) / perPage;
		begin = (section * perPage) + 1;
		end = (section + 1) * perPage;
		
		end = (end < totalPage) ? end : totalPage;
		
		prev = (section != 0);
		next = (end != totalPage);
	}
	
	public int getPerCount() {
		return perCount;
	}
	public void setPerCount(int perCount) {
		this.perCount = perCount;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}
}
