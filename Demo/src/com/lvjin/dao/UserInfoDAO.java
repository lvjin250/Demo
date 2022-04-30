package com.lvjin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lvjin.entity.UserInfoEntity;
import com.lvjin.util.DBConnection;

public class UserInfoDAO {

	//定义数据库连接对象
	private Connection conn=null;
	//定义数据库操作对象
	private PreparedStatement pstm=null;
	//定义数据库结果集对象
	private ResultSet rs=null;
	
	//根据用户名登录方法
	public UserInfoEntity UserLogin(String userName) {
		//定义用户对象
		UserInfoEntity userInfo=new UserInfoEntity();
		
		try {
			conn=DBConnection.getConn();
			String sql="select * from UserInfo where userName=?";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1, userName);
			rs=pstm.executeQuery();
			//循环遍历
			while(rs.next()) {
				//获取用户信息，将信息封装到用户对象中
				userInfo.setUserId(rs.getInt("userId"));
				userInfo.setUserName(rs.getString("userName"));
				userInfo.setUserPwd(rs.getString("userPwd"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userInfo;
	}
	
}
