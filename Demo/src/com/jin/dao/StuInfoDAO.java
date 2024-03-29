package com.jin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.entity.StuInfoEntity;
import com.jin.util.DBConnection;

public class StuInfoDAO {

	//定义数据库连接对象
	private Connection conn=null;
	//定义数据库操作对象
	private PreparedStatement pstm=null;
	//定义数据库结果集对象
	private ResultSet rs=null;
	
	//查询所有学生信息方法
	public List<StuInfoEntity> QueryAllStuInfo(){
		//定义集合保存所有学生对象
		List<StuInfoEntity> stuList=new ArrayList<StuInfoEntity>();
		
		try {
			conn=DBConnection.getConn();
			String sql="select * from stuInfo";
			pstm=conn.prepareStatement(sql);
			rs=pstm.executeQuery();
			
			/****循环遍历结果***/
			while(rs.next()){
				//实例化一个学生对象
				StuInfoEntity stuInfo=new StuInfoEntity();
				stuInfo.setStuId(rs.getInt("stuId"));
				stuInfo.setStuName(rs.getString("stuName"));
				stuInfo.setStuSex(rs.getInt("stuSex"));
				stuInfo.setStuAge(rs.getInt("stuAge"));
				
				//将对象到保存集合中
				stuList.add(stuInfo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stuList;
	}
	
	//新增学生信息方法
	public int insertStuInfo(StuInfoEntity stuInfo){
		//定义变量保存受影响行数
		int count=0;
		
		try {
			conn=DBConnection.getConn();
			String sql="insert into StuInfo values(null,?,?,?)";
			pstm=conn.prepareStatement(sql);
			//设置占位符
			pstm.setString(1, stuInfo.getStuName());
			pstm.setInt(2, stuInfo.getStuSex());
			pstm.setInt(3, stuInfo.getStuAge());
			count=pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	//根据学号删除对应学生信息方法
	public int deleteStuInfoByStuId(int stuId){
		//定义变量保存受影响行数
		int count=0;
		
		try {
			conn=DBConnection.getConn();
			String sql="delete from stuInfo where stuid=?";
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, stuId);
			count=pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}
	
	//根据学号修改学生信息方法
	public int updateStuInfo(StuInfoEntity stuInfo) {
		//定义变量保存受影响行数
		int count=0;
		try {
			conn=DBConnection.getConn();
			String sql="update stuInfo set stuname=?,stusex=?,stuAge=? where stuId=?";
			pstm=conn.prepareStatement(sql);
			//设置占位符
			pstm.setString(1, stuInfo.getStuName());
			pstm.setInt(2, stuInfo.getStuSex());
			pstm.setInt(3, stuInfo.getStuAge());
			pstm.setInt(4, stuInfo.getStuId());
			//执行SQL语句，返回一个受影响行数
			count=pstm.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

	//根据学号查询学生信息方法
	public StuInfoEntity queryStuInfoByStuId(int stuId) {
		//定义学生对象
		StuInfoEntity stuInfo=new StuInfoEntity();
		
		try {
			conn=DBConnection.getConn();
			String sql="select * from stuInfo where stuId=?";
			pstm=conn.prepareStatement(sql);
			pstm.setInt(1, stuId);
			rs=pstm.executeQuery();
			//循环遍历
			while(rs.next()) {
				//获取学生信息，将信息封装学生对象中
				stuInfo.setStuId(rs.getInt("stuId"));
				stuInfo.setStuName(rs.getString("stuName"));
				stuInfo.setStuSex(rs.getInt("stuSex"));
				stuInfo.setStuAge(rs.getInt("stuAge"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stuInfo;
	}
	
}
