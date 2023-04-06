package model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.dto.BoardDTO;
import service.Paging;

public class BoardDAO extends DAO {
	private int total() {
		String sql = "select count(*) as boardCount from board";
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			return rs.getInt("boardCount");
			
		} catch (SQLException e) {
			System.out.println("total 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}

	public Map<String, Object> selectAll(int reqPage) {
		
		String sql = "select * from board "
						+ "order by idx desc "
						+ "offset ? rows "
						+ "fetch first ? rows only";
		
		// 1. 총 페이지 수와 페이징 알고리즘 객체를 생성
		int boardCount = total();
		Paging pg = new Paging(reqPage, boardCount);
		
		// 2. Paging과 List를 담기 위한 Map을 선언
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pg.getOffset());
			pstmt.setInt(2, pg.getPerCount());
			
			rs = pstmt.executeQuery();
			
			List<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				BoardDTO row = new BoardDTO();
				
				row.setContents(rs.getString("contents"));
				row.setIdx(rs.getInt("idx"));
				row.setTitle(rs.getString("title"));
				row.setView_count(rs.getInt("view_count"));
				row.setWrite_date(rs.getDate("write_date"));
				row.setWriter(rs.getString("writer"));
				
				list.add(row);
			}
			
			// 3. 결과가 모두 구해진 후 Map에 추가 후 반환
			map.put("pg", pg);
			map.put("list", list);
			
			return map;
			
		} catch (SQLException e) {
			System.out.println("selectAll 예외 : " + e.getMessage());

		} finally {
			close();
		}
		
		return null;
	}

	public BoardDTO selectOne(int idx) {
		String sql = "select * from board where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			BoardDTO row = new BoardDTO();
			
			row.setContents(rs.getString("contents"));
			row.setIdx(rs.getInt("idx"));
			row.setTitle(rs.getString("title"));
			row.setView_count(rs.getInt("view_count"));
			row.setWrite_date(rs.getDate("write_date"));
			row.setWriter(rs.getString("writer"));
			
			return row;
			
		} catch (SQLException e) {
			System.out.println("selectOne 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}

	public int insert(BoardDTO input) {
		String sql = "insert into "
						+ "board(title, contents, writer) "
						+ "values(?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getTitle());
			pstmt.setString(2, input.getContents());
			pstmt.setString(3, input.getWriter());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insert 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}
}
