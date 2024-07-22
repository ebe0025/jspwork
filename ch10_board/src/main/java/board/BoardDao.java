package board;

import java.sql.*;
import java.util.*;

import board.DBConnectionMgr;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao(){
		pool = DBConnectionMgr.getInstance();
	}
	
	// 게시판 리스트
	
	public ArrayList<Board> getBoardList(){
		ArrayList<Board> alist = new ArrayList<Board>();
		try {
			con = pool.getConnection();
			sql = "select * from board";
			stmt= con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setPass(rs.getString("pass"));
				board.setIp(rs.getString("ip"));
				board.setCount(rs.getInt("count"));
				
				alist.add(board);
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
