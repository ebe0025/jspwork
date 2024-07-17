package ch06;

import java.sql.*;


public class OracleDBTest1 {
	public static void main(String[] args) {
		/* JDBC의 위치 C:\app\ImSeongHun\product\18.0.0\dbhomeXE\jdbc\lib  ojdbc8.jar*/
		/* scr>main>webapp>WEB-INF-lib 에 넣기 */
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe", "tjoeun", "1234");
			System.out.println("Success");
			
		} catch (SQLException e) {
			System.out.println("접속오류");
		}
		catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류");
		}
	}
}
