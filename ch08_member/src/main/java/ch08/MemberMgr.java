package ch08;

import java.sql.*;

public class MemberMgr {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean checkId(String id) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	public boolean loginRegister(String id, String pwd) {
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
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return false;
	}
	
	public boolean insertMember(Member bean) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetailAddress());

			String[] hobby = bean.getHobby();
			char hb[] = {'0', '0', '0', '0', '0'};
			String lists[] = {"internet", "travel", "game", "movie", "sport"};
			if(hobby != null) {
				for(int i = 0; i < hobby.length; i++) {
					for(int j = 0; j < lists.length; j++) {
						if(hobby[i].equals(lists[j])) {
							hb[j] = '1';
							break;
						}
					}
				}
			}
			pstmt.setString(10, new String(hb));
			pstmt.setString(11, bean.getJob());
			if(pstmt.executeUpdate() == 1) { // 반환값 : 0이면 => insert가 안됨 1=> 잘되었음
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
