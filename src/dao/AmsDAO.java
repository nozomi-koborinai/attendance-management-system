package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import dto.AttendanceInfo;
import dto.ClassData;
import dto.CourseData;
import dto.LoginUser;
import dto.PublicStatus;
import dto.Student;
import servlet.Login;
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

			String safetyPw = PasswordUtil.getSafetyPassword(pw, name);
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

	//学籍番号チェック
	public static int numberCheck(int barcodeDate){
		int result = 0;		//ユーザーが見つかっていない状態
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM students WHERE s_number = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, barcodeDate);

			rs = pstmt.executeQuery();

			if(rs.next()){
				result = 1;
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

	//生徒氏名を取得
	public static String getStudentName(int sNumber){

		String sName = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s_name FROM students WHERE s_number = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sNumber);
			rs = pstmt.executeQuery();

			rs.next();
			sName = rs.getString("s_name");

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return sName;

	}

	//ユーザインスタンスを取得
	public static LoginUser getUserName(String name, String pw){
		LoginUser login = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String safetyPw = PasswordUtil.getSafetyPassword(pw, name);

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

			login = new LoginUser(uId, uName, pwd, auth);

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

	//生徒インスタンスを取得
	public static Student getStudent(int sNumber){
		Student student = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s.s_number, s.s_name, s.sex, s.year, s.absence, s.public, s.late,"
					+ " s.public_flag, s.attendance_rate, cla.class_name, cou.course_name"
					+ " FROM students s INNER JOIN class cla"
					+ " ON s.s_class_id = cla.class_id"
					+ " INNER JOIN course cou"
					+ " ON s.s_course_id = cou.course_id"
					+ " WHERE s.s_number = ?";

			pstmt = con.prepareStatement(sql);
			int no = sNumber;
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			rs.next();

			int sNo  = rs.getInt("s.s_number");
			String sName = rs.getString("s.s_name");
			String gen = rs.getString("s.sex");
			int year = rs.getInt("s.year");
			int absence = rs.getInt("s.absence");
			int pblc = rs.getInt("s.public");
			int late = rs.getInt("s.late");
			int flg = rs.getInt("s.public_flag");
			int rate = rs.getInt("s.attendance_rate");
			String className = rs.getString("cla.class_name");
			String courseName = rs.getString("cou.course_name");

			student = new Student(sNo, sName, gen, year, absence, pblc, late, flg, rate, className, courseName);

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return student;

	}

	//生徒インスタンスを取得
	public static ArrayList<Student> getStudentAll(){
		ArrayList<Student> studentList = new ArrayList<Student>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s.s_number, s.s_name, s.sex, s.year, s.absence, s.public, s.late,"
					+ " s.public_flag, s.attendance_rate, cla.class_name, cou.course_name"
					+ " FROM students s INNER JOIN class cla"
					+ " ON s.s_class_id = cla.class_id"
					+ " INNER JOIN course cou"
					+ " ON s.s_course_id = cou.course_id";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next() == true){
				int sNo  = rs.getInt("s.s_number");
				String sName = rs.getString("s.s_name");
				String gen = rs.getString("s.sex");
				int year = rs.getInt("s.year");
				int absence = rs.getInt("s.absence");
				int pblc = rs.getInt("s.public");
				int late = rs.getInt("s.late");
				int flg = rs.getInt("s.public_flag");
				int rate = rs.getInt("s.attendance_rate");
				String className = rs.getString("cla.class_name");
				String courseName = rs.getString("cou.course_name");

				studentList.add(new Student(sNo, sName, gen, year, absence, pblc, late, flg, rate, className, courseName));
			}

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return studentList;

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

			if(className.length() == 0){
				Login.error = 2;
			} else {
				String cName = className;
				pstmt.setString(1, cName);
				pstmt.executeUpdate();
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//同じクラス名を入力した場合
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

	//コース登録
	public static void addToCourse(int classId, String courseName){
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO course(class_id, course_name) values(?,?);";

			pstmt = con.prepareStatement(sql);

			if(courseName.length() == 0){
				Login.error = 2;			//courseNameが空の場合
			} else {
				int cId = classId;
				String cName = courseName;
				pstmt.setInt(1, cId);
				pstmt.setString(2, cName);

				pstmt.executeUpdate();
			}


		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//同じクラス名を入力した場合
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

	//クラス情報を取得
	public static ArrayList<ClassData> getAllClassData(){

		ArrayList<ClassData> classList = new ArrayList<ClassData>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM class";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int classId = rs.getInt("class_id");
				String className = rs.getString("class_name");

				classList.add(new ClassData(classId, className));
			}


		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return classList;

	}

	//コース情報を取得
	public static ArrayList<CourseData> getAllCourseData(){

		ArrayList<CourseData> courseList = new ArrayList<CourseData>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM course";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int courseId = rs.getInt("course_id");
				int classId = rs.getInt("class_id");
				String courseName = rs.getString("course_name");

				courseList.add(new CourseData(courseId, classId, courseName));
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//同じコース名を入力した場合
		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return courseList;

	}

	//コース名からコースIDを取得
	public static int getCourseID(String courseName){

		int courseID = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT course_id FROM course WHERE course_name = ?";

			pstmt = con.prepareStatement(sql);
			String cName = courseName;
			pstmt.setString(1, cName);

			rs = pstmt.executeQuery();
			rs.next();

			courseID = rs.getInt("course_id");


		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return courseID;

	}

	//クラス名からクラスIDを取得
	public static int getClassID(String className){

		int classID = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT class_id FROM class WHERE class_name = ?";

			pstmt = con.prepareStatement(sql);
			String cName = className;
			pstmt.setString(1, cName);

			rs = pstmt.executeQuery();
			rs.next();

			classID = rs.getInt("class_id");


		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return classID;

	}


	//学生登録
	public static void addToStudent(int studentNo, String shimei, String gender, int classId, int courseId){
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO students values(?,?,?,?,?,?,?,?,?,?,?);";

			pstmt = con.prepareStatement(sql);

			if(String.valueOf(studentNo).length() == 7){
				int no = studentNo;
				String name = shimei;
				String gen = gender;
				int claId = classId;
				int couId = courseId;

				pstmt.setInt(1, no);
				pstmt.setString(2, name);
				pstmt.setString(3, gen);
				pstmt.setInt(4, 1);
				pstmt.setInt(5, 0);
				pstmt.setInt(6, 0);
				pstmt.setInt(7, 0);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 100);
				pstmt.setInt(10, claId);
				pstmt.setInt(11, couId);

				pstmt.executeUpdate();
			} else {
				Login.error = 2;		//入力した学籍番号が7桁ではない場合
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//既に登録してある学籍番号を入力した場合
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

	//教員追加
	public static void addToUser(String userId, String userName, String password){
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO teacher_and_admin values(?,?,?,?);";

			pstmt = con.prepareStatement(sql);

			if(userId.length() == 0 || userName.length() == 0 || password.length() == 0){
				Login.error = 2;			//引数の文字列に0文字のものがあった場合
			} else {
				String id = userId;
				String name = userName;
				String pass = password;

				pstmt.setString(1, id);
				pstmt.setString(2, name);
				pstmt.setString(3, pass);
				pstmt.setInt(4, 0);			//教員を示す"0"

				pstmt.executeUpdate();
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//既に登録してあるユーザーIDとパスワードの組み合わせを入力した場合
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

	//出席情報登録
	public static void addToAttendance(int barcodeData, String date, int time, String info) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO attendance_information(s_number, date, time, info) values(?,?,?,?);";

			pstmt = con.prepareStatement(sql);

			int bData = barcodeData;
			String dt = String.valueOf(date);
			int tm = time;
			String information = info;

			if("遅".equals(info)){
				incrementLate(bData);
			}

			pstmt.setInt(1, bData);
			pstmt.setString(2, dt);
			pstmt.setInt(3, tm);
			pstmt.setString(4, information);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//早退処理
	public static void updateEarlyData(int barcodeData, String date, int time) {
		Connection con = null;
		PreparedStatement pstmt = null;

		//set用
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "UPDATE attendance_information"
					+ " SET info = '早' , date = ?"
					+ " WHERE s_number = ?"
					+ " AND date LIKE ?"
					+ " AND time = ?";

			pstmt = con.prepareStatement(sql);

			int bData = barcodeData;
			String dt = String.valueOf(date);
			int tm = time;

			pstmt.setString(1, dt);
			pstmt.setInt(2, bData);
			pstmt.setString(3, sdf.format(sdf.parse(dt)) + "%");
			pstmt.setInt(4, tm);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//遅刻の場合の遅刻数インクリメント処理
	public static void incrementLate(int studentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "UPDATE students SET late = late + 1 where s_number = ?";

			pstmt = con.prepareStatement(sql);

			int sNo = studentNo;

			pstmt.setInt(1, sNo);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//早退後の欠席処理
	public static void deleteAttendanceData(int barcodeData, String date, int time) {
		Connection con = null;
		PreparedStatement pstmt = null;

		//set用
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "DELETE FROM attendance_information"
					+ " WHERE s_number = ?"
					+ " AND date LIKE ?"
					+ " AND time = ?";

			pstmt = con.prepareStatement(sql);

			int bData = barcodeData;
			String dt = String.valueOf(date);
			int tm = time;

			pstmt.setInt(1, bData);
			pstmt.setString(2, sdf.format(sdf.parse(dt)) + "%");
			pstmt.setInt(3, tm);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//公欠申請登録
	public static void registerPublic(int studentNumber, String applicationDate, String reason, String place, String period) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "INSERT INTO public(s_number, application_date, reason, place, period, auth_frag) values(?,?,?,?,?,0);";

			pstmt = con.prepareStatement(sql);

			int sNumber = studentNumber;
			String apDate = applicationDate;
			String rsn = reason;
			String plc = place;
			String prod = period;

			pstmt.setInt(1, sNumber);
			pstmt.setString(2, apDate);
			pstmt.setString(3, rsn);
			pstmt.setString(4, plc);
			pstmt.setString(5, prod);


			pstmt.executeUpdate();
			publicFlagUP(studentNumber);

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//出席情報取得
	public static ArrayList<AttendanceInfo> getAttendanceInformation(String date){

		ArrayList<AttendanceInfo> attendanceInfoList = new ArrayList<AttendanceInfo>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//set用
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s.s_number, s.s_name, ai.date, ai.time, ai.info, s.absence, s.late, s.public_flag"
					+ " FROM students s"
					+ " LEFT JOIN attendance_information ai"
					+ " ON s.s_number = ai.s_number"
					+ " AND ai.date LIKE ?";

			pstmt = con.prepareStatement(sql);
			String dt = date;
			pstmt.setString(1, sdf.format(sdf.parse(dt)) + "%");
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int sNumber = rs.getInt("s.s_number");
				String name = rs.getString("s.s_name");
				String daTe = rs.getString("ai.date");
				int time = rs.getInt("ai.time");
				String info = rs.getString("ai.info");
				int absence = rs.getInt("s.absence");
				int late = rs.getInt("s.late");
				int flag = rs.getInt("s.public_flag");

				attendanceInfoList.add(new AttendanceInfo(sNumber, name, daTe, time, info, absence, late, 100, flag));
			}

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return attendanceInfoList;

	}

	//絞込検索後の出席状況取得
	public static ArrayList<AttendanceInfo> getUserAttendanceInformation(String date, String item, String condition){

		ArrayList<AttendanceInfo> attendanceInfoList = new ArrayList<AttendanceInfo>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//set用
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'");
		int cdtn = 0;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s.s_number, s.s_name, ai.date, ai.time, ai.info, s.absence, s.late, s.public_flag"
					+ " FROM students s"
					+ " LEFT JOIN attendance_information ai"
					+ " ON s.s_number = ai.s_number"
					+ " AND ai.date LIKE ?"
					+ " WHERE " + item + " = ?";

			//取得したitemがクラスの場合
			if(item.equals("s.s_class_id")){
				cdtn = getClassID(condition);

				//取得したitemがコースの場合
			} else if(item.equals("s.s_course_id")){
				cdtn = getCourseID(condition);
			}

			pstmt = con.prepareStatement(sql);
			String dt = date;
			pstmt.setString(1, sdf.format(sdf.parse(dt)) + "%");
			pstmt.setInt(2, cdtn);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int sNumber = rs.getInt("s.s_number");
				String name = rs.getString("s.s_name");
				String daTe = rs.getString("ai.date");
				int time = rs.getInt("ai.time");
				String info = rs.getString("ai.info");
				int absence = rs.getInt("s.absence");
				int late = rs.getInt("s.late");
				int flag = rs.getInt("s.public_flag");

				attendanceInfoList.add(new AttendanceInfo(sNumber, name, daTe, time, info, absence, late, 100, flag));
			}


		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return attendanceInfoList;

	}

	//公欠申請状況取得
	public static ArrayList<PublicStatus> getApplicationStatus(int barcodeData){

		ArrayList<PublicStatus> publicList = new ArrayList<PublicStatus>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM public WHERE s_number = ?";

			pstmt = con.prepareStatement(sql);
			int bData = barcodeData;
			pstmt.setInt(1, bData);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int publicId = rs.getInt("public_id");
				String appliDate = rs.getString("application_date");
				String reason = rs.getString("reason");
				String place = rs.getString("place");
				String period = rs.getString("period");
				int auth = rs.getInt("auth_frag");

				publicList.add(new PublicStatus(publicId, appliDate, reason, place, period, auth));
			}

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return publicList;

	}

	//削除をする公欠申請状況表示
	public static ArrayList<PublicStatus> getApplicationStatusDelete(int deleteData){

		ArrayList<PublicStatus> publicList = new ArrayList<PublicStatus>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM public WHERE public_id = ?";

			pstmt = con.prepareStatement(sql);
			int dData = deleteData;
			pstmt.setInt(1, dData);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int publicId = rs.getInt("public_id");
				String appliDate = rs.getString("application_date");
				String reason = rs.getString("reason");
				String place = rs.getString("place");
				String period = rs.getString("period");
				int auth = rs.getInt("auth_frag");

				publicList.add(new PublicStatus(publicId, appliDate, reason, place, period, auth));
			}

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return publicList;

	}

	//生徒取得
	public static ArrayList<Student> getStudentInfo(){

		ArrayList<Student> StudentList = new ArrayList<Student>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT s_number, s_name FROM students";

			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next() == true){
				int number = rs.getInt("s_number");
				String name = rs.getString("s_name");

				StudentList.add(new Student(number, name));
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;		//同じコース名を入力した場合
		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return StudentList;

	}

	//公欠申請削除
	public static void deletePublic(int publicId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "DELETE FROM public WHERE public_id = ?";

			pstmt = con.prepareStatement(sql);

			int pi = publicId;

			pstmt.setInt(1, pi);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//公欠フラグ立てる
	public static void publicFlagUP(int studentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "UPDATE students SET public_flag = 1 where s_number = ?";

			pstmt = con.prepareStatement(sql);

			int sNo = studentNo;

			pstmt.setInt(1, sNo);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//生徒に未確認の公欠申請情報があるか
	public static boolean checkPublic(int studentNo){

		boolean result = true;		//公欠申請情報が残っている状態

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "SELECT * FROM public WHERE s_number = ? AND auth_frag = 0";

			pstmt = con.prepareStatement(sql);
			int sNo = studentNo;
			pstmt.setInt(1, sNo);

			rs = pstmt.executeQuery();

			if(rs.next() != true){
				result = false;		//その生徒の公欠申請情報がなくなった場合
			}

		} catch (SQLException se){
			se.printStackTrace();
		} catch (Exception e){

		} finally {
			try {
				if( rs != null){
					rs.close();
				}
			} catch(SQLException e){
				System.out.println("DB切断時にエラーが発生しました。");
				e.printStackTrace();
			}
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

		return result;

	}

	//生徒の公欠申請状況をすべて確認した際にその生徒のフラグを降ろす
	public static void publicFlagDataDOWN(int studentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "UPDATE students SET public_flag = 0 WHERE s_number = ?";

			pstmt = con.prepareStatement(sql);

			int sNo = studentNo;

			pstmt.setInt(1, sNo);

			pstmt.executeUpdate();

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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

	//生徒の公欠申請状況を確認したときにDBの情報を確認した状態にする
	public static void publicFlagDataUP(int publicID, int studentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try{

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/attendance_management?useSSL=false",
					"attendance",
					"attendance01");

			String sql = "UPDATE public SET auth_frag = 1 where public_id = ?";

			pstmt = con.prepareStatement(sql);

			int pId = publicID;

			pstmt.setInt(1, pId);

			pstmt.executeUpdate();

			//公欠申請情報がまだ残っているか
			//公欠申請情報がない場合は生徒テーブルのフラグを降ろす
			if(!(checkPublic(studentNo))){
				publicFlagDataDOWN(studentNo);
			}

		} catch(MySQLIntegrityConstraintViolationException e){
			Login.error = 1;
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
