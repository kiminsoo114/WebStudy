package com.sist.dao;
import java.util.*;
import java.sql.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DBCPConnection dbcp=new DBCPConnection(); //연결해제
	
	public String isLogin(String id, String pwd)
	{
		String result="";
		
		try
		{
			conn=dbcp.getConnection();
			String sql="SELECT COUNT(*) FROM project_member "
						+"WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			////////////////////////////////////ID존재 여부 확인
			if(count==0)//ID가 없는 상태
			{
				result="NOID";
			}
			else//ID가 있는 상태
			{	
				sql="SELECT pwd,name,admin FROM project_member "
					+"WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String name=rs.getString(2);
				int admin=rs.getInt(3);
				rs.close();
				
				if(db_pwd.equals(pwd))//로그인
				{
					return name+"|"+admin;
				}
				else//비밀번호가 다르다
				{
					result="NOPWD";
				}
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbcp.disConnection(conn, ps);
		}
		return result;
	}
}
