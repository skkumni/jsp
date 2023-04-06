package model;

import java.sql.SQLException;

import model.dto.AccountDTO;

public class AccountDAO extends DAO {
	public AccountDTO selectOne(AccountDTO input) {
		String sql = "select * from account "
						+ "where userid = ? and userpw = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getUserid());
			pstmt.setString(2, input.getUserpw());
			
			rs = pstmt.executeQuery();
			rs.next();
			
			AccountDTO row = new AccountDTO();
			
			row.setEmail(rs.getString("email"));
			row.setIdx(rs.getInt("idx"));
			row.setJoin_date(rs.getDate("join_date"));
			row.setNick(rs.getString("nick"));
			row.setUserid(rs.getString("userid"));
			row.setUserpw(rs.getString("userpw"));
			
			return row;
		
		} catch(SQLException e) {
			System.out.println("selectOne예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return null;
	}

	public int delete(int idx) {
		String sql = "delete from account where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("delete 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}

	public int update(AccountDTO input) {
		String sql = "update account "
						+ "set userpw = ?, email = ? "
						+ "where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getUserpw());
			pstmt.setString(2, input.getEmail());
			pstmt.setInt(3, input.getIdx());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("update 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}

	public int insert(AccountDTO input) {
		String sql = "insert into " + 
						"account(userid, userpw, nick, email) " + 
						"values(?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, input.getUserid());
			pstmt.setString(2, input.getUserpw());
			pstmt.setString(3, input.getNick());
			pstmt.setString(4, input.getEmail());
			
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println("insert 예외 : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return 0;
	}
}
