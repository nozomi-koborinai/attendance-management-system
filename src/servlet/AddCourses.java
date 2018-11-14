package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class AddCourses
 */
@WebServlet("/AddCourses")
public class AddCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCourses() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//追加コース名に属するクラスIDを取得
		int classId = Integer.parseInt(request.getParameter("classId"));
		//追加コース名取得
		String courseName = request.getParameter("courseName");
		//資格をデータベースへ追加
		AmsDAO.addToCourse(classId, courseName);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = response.getWriter();

		//登録するクラス名が既に存在する場合
		if(Login.error == 1){
			printWriter.println("<script>");
			printWriter.println("alert('入力したコース名は既に登録されています。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
			Login.error = 0;

		//コース名が入力されていない場合
		}else if(Login.error == 2){
			printWriter.println("<script>");
			printWriter.println("alert('コース名が入力されていません');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
			Login.error = 0;
		} else {
			//前のページに戻る処理
			printWriter.println("<script>");
			printWriter.println("alert('1件のコース情報を登録しました。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
