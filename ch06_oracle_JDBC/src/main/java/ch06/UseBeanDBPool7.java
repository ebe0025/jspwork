package ch06;

import java.sql.*;
import java.util.*;

public class UseBeanDBPool7 {
	private DBConnectionMgr pool = null;
	
	public UseBeanDBPool7() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<BeanEmployee> getList(){
		ArrayList<BeanEmployee> alist = new ArrayList<BeanEmployee>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select emp_id, emp_name, email,job_name, phone "
					+ " from employee, job "
					+ " where employee.job_code = job.job_code");
			while(rs.next()) {
				BeanEmployee bean = new BeanEmployee();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setJob_name(rs.getString("job_name"));
				
				alist.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		
		return alist;
	}
}
