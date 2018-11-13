package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class AddCoursesAndClasses
 */
@WebServlet("/AddCoursesAndClasses")
public class AddCoursesAndClasses extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCoursesAndClasses() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//クラス情報を取得
		request.setAttribute("classData", AmsDAO.getAllClassData());

		String view = "/WEB-INF/view/addcoursesandclasses.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		//追加クラス名を取得
		String className = request.getParameter("className");
		//資格をデータベースへ追加
		AmsDAO.addToClass(className);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = response.getWriter();

		//登録するクラス名が既に存在する場合
		if(Login.error == 1){
			printWriter.println("<script>");
			printWriter.println("alert('入力したクラス名は既に登録されています。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
			Login.error = 0;
		} else {
		//前のページに戻る処理
		printWriter.println("<script>");
		printWriter.println("alert('1件のクラス情報を登録しました。');");
		printWriter.println("history.go(-1)");					//前のページに戻る
		printWriter.println("window.location.reload(true);");	//ページのリロード
		printWriter.println("</script>");
		}
	}

}
