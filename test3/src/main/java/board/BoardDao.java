package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnectionMgr;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		pool = DBConnectionMgr.getInstance();
	}

	public boolean insertBoard(Board board) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into board values(SEQ_BOARDNUM.NEXTVAL, ?, ?, ?, 0, SEQ_BOARDNUM.CURRVAL, 0, default, default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyField == null || keyField.equals("")) {
			
				
				sql = "select count(*) from board";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord +"%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	
	public List<Board> getBoardList(String keyField, String keyWord, int start, int end){
		List<Board> aList = new ArrayList<Board>();
		
		try {
			con = pool.getConnection();
			
			if(keyWord == null || keyWord.equals(""))
			{
				sql = "select ROWNUM, B.* "
						+ " from (select * from board order by ref desc, pos) B "
						+ " where ROWNUM between ? and ?";
				pstmt= con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql = "select ROWNUM, B.* "
						+ "from (select * from board "
						+ " where "+ keyField +" like ? order by ref desc, pos) B "
						+ " where ROWNUM between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				System.out.println("계산중");
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(
							rs.getInt("num"),
							rs.getString("name"),
							rs.getString("subject"),
							rs.getString("content"),
							rs.getInt("pos"),
							rs.getInt("ref"),
							rs.getInt("depth"),
							rs.getString("regdate"),
							rs.getInt("count")
						);
				aList.add(board);
				
			}
				
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return aList;
	}

	public Board getBoardDetail(int num) {
		Board board = new Board();
		try {
			con = pool.getConnection();
			sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				board.setNum(num);
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return board;
	}
	public void updateboardCount(int num, int count) {
		try {
			con = pool.getConnection();
			sql = "update board set count = count + ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, num);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	public boolean deleteBoard(int num) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			if(pstmt.executeUpdate() == 1) {
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
