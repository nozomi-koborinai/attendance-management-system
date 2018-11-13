package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;
import util.PasswordUtil;

/**
 * Servlet implementation class AddTeacher
 */
@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//氏名
		String shi = request.getParameter("shi");
		String mei = request.getParameter("mei");
		String shimei = shi.concat("　" + mei);
		//ユーザID
		String userId = request.getParameter("id");
		//安全なパスワードに変換
		String password = request.getParameter("pass");
		String safetyPass = PasswordUtil.getSafetyPassword(password, userId);
		//資格をデータベースへ追加
		AmsDAO.addToUser(userId, shimei, safetyPass);

		//前のページに戻る処理
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = response.getWriter();
		printWriter.println("<script>");
		printWriter.println("alert('1件の教員情報を登録しました。');");
		printWriter.println("history.go(-1)");					//前のページに戻る
		printWriter.println("window.location.reload(true);");	//ページのリロード
		printWriter.println("</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
