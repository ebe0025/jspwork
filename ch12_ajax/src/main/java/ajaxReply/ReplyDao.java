package ajaxReply;

import java.sql.*;
import java.util.ArrayList;

import ajax01.DBConnectionMgr;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	
	public ArrayList<Reply> getReplyList(int ref){
		ArrayList<Reply> alist = new ArrayList<Reply>();
		
		try {
			con = pool.getConnection();
			sql = "select * from REPLY where ref = ? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setNo(rs.getInt("no"));
				reply.setName(rs.getString("name"));
				reply.setRef(rs.getInt("ref"));
				reply.setContent(rs.getString("content"));
				reply.setRedate(rs.getString("redate"));
				alist.add(reply);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}
}
