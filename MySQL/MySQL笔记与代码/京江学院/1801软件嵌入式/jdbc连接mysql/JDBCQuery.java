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
 * 4.执行sql，得到返回结果集
 * 
 * @author Bleachtred
 *
 */
public class JDBCQuery {
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
			String sql = "select * from stu";
			//获取SQL执行器
			PreparedStatement ps = conn.prepareStatement(sql);
			//开始执行SQL
			//此时执行的是查询操作，有返回结果集
			ResultSet rs = ps.executeQuery();
			//从返回结果集中获取每一行数据
			System.out.println("------------查询到的学生信息------------");
			while(rs.next()) {//rs.next()判断是否有数据，如果没有返回false，结束循环
				int id = rs.getInt("id");//rs.getInt(表字段名)
				String stuName = rs.getString("stuName");//rs.getString(表字段名)
				int age = rs.getInt("age");//get什么是和表字段类型相关的
				String className = rs.getString("className");
				System.out.println("学号："+id+"\t姓名："+stuName+"\t年龄："+age+"\t班级："+className);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
