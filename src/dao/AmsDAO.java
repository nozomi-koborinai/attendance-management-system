package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Login;
import util.PasswordUtil;

public class AmsDAO {
	//ログイン
	public static int login(String name, String pw){
		int result = 2;		//ユーザーが見つかっていない状態
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String safetyPw = PasswordUtil.getSafetyPassword(name, pw);
			System.out.println(safetyPw);

			String sql = "SELECT user_id, password, auth FROM teacher_and_admin WHERE user_id = ? AND password = ?;";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, safetyPw);

			rs = pstmt.executeQuery();
			int auth;		//権限(教員・管理者)

			if(rs.next()){
				auth = rs.getInt("auth");
				if(auth == 0){
					result = 0;
				} else if(auth == 1){
					result = 1;
				}
			} else {
				result = 2;
			}

		} catch (ClassNotFoundException e) {
			System.out.println("JDBCドライバが見つかりません。");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DBアクセス時にエラーが発生しました。");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
		}
		return result;
	}

	//ユーザインスタンスを取得
	public static Login getUserName(String name, String pw){
		Login login = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String safetyPw = PasswordUtil.getSafetyPassword(name, pw);

			String sql = "SELECT * FROM teacher_and_admin WHERE user_id = ? AND password = ?;";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, safetyPw);

			rs = pstmt.executeQuery();

			rs.next();
			String uId = rs.getString("user_id");
			String uName = rs.getString("user_name");
			String pwd = rs.getString("password");
			int auth = rs.getInt("auth");

			login = new Login(uId, uName, pwd, auth);

		} catch (ClassNotFoundException e) {
			System.out.println("JDBCドライバが見つかりません。");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DBアクセス時にエラーが発生しました。");
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("DBアクセス時にエラーが発生しました。");
				e.printStackTrace();
			}
		}
		return login;
	}

	//クラス登録
	public static void addToClass(String className){
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO class(class_name) values(?);";

			pstmt = con.prepareStatement(sql);

			String cName = className;
			pstmt.setString(1, cName);

			pstmt.executeUpdate();

		} catch (SQLException e){
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		} finally {

			try {
				if( pstmt != null){
					pstmt.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}

			try {
				if( con != null){
					con.close();
				}
			} catch (SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
		}
	}
}
