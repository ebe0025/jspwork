package member;

import java.sql.*;
import db.DBConnectionMgr;

public class MemberMgr {
	private DBConnectionMgr pool;
	Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginCheck(String id, String pwd) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from member where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) == 1)
				return true;
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;

	}

	public boolean checkId(String id) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) == 1)
				return true;
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}

	public boolean InsertMember(Member member) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ? ,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirthday());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getZipcode());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getDetailAddress());
			pstmt.setString(10, member.getJob());
			
			if(pstmt.executeUpdate() == 1) { // 반환값 : 0이면 => insert가 안됨 1=> 잘되었음
				flag = true;
			}
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return flag;
	}
}
