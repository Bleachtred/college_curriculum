package com.test.jdbc;

import java.sql.Connection;//获取连接
import java.sql.DriverManager;//加载驱动时的驱动管理类
import java.sql.PreparedStatement;//SQL执行器
import java.sql.ResultSet;//查询返回结果集
import java.sql.SQLException;//处理异常

/**
 * JDBC连接测试类
 * 
 * 1.加载驱动
 * 2.获取连接
 * 3.获取sql执行器
 * 4.执行sql
 * 
 * @author Bleachtred
 *
 */
public class JDBCDelete {
	public static void main(String[] args) {
		//加载驱动
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("JDBC加载成功！");
		try {
			//获取连接  getConnection（数据库连接地址，用户名，密码）
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
			System.out.println("连接成功："+conn);
			//定义sql语句
			String sql = "delete from stu where id = ?";//？ 表示占位符
			//获取SQL执行器
			PreparedStatement ps = conn.prepareStatement(sql);
			//设置参数  ps.setInt(问号的位置，要设置的值)
			ps.setInt(1, 20190917);
			//开始执行SQL
			int count = ps.executeUpdate();
			System.out.println("受影响的行数："+count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
