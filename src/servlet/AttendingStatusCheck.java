package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AmsDAO;


/**
 * Servlet implementation class AttendingStatusCheck
 */
@WebServlet("/AttendingStatusCheck")
public class AttendingStatusCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AttendingStatusCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "/WEB-INF/view/attendingstatuscheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//formに入力された値を取得
		request.setCharacterEncoding("UTF-8");
		//遷移先を格納する変数
		int result;

		if(Login.destination == 3){

			String userId = request.getParameter("userName");
			String pass = request.getParameter("pw");
			String user;

			result = AmsDAO.login(userId, pass);

			//ログインしたユーザが教員の場合
			if(result == 0){

				//HttpSessionインスタンスの取得
				HttpSession session = request.getSession(false);

				user = AmsDAO.getUserName(userId, pass);
				session.setAttribute("user", user);

				Login.destination = 0;		//フラグをログイン状態にする。

				session = request.getSession(true);

				String view = "/WEB-INF/view/attendingstatuscheck.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);

				//ログインしたユーザが管理者の場合
			} else if(result == 1){
				//HttpSessionインスタンスの取得
				HttpSession session = request.getSession(false);

				user = AmsDAO.getUserName(userId, pass);
				session.setAttribute("user", user);

				Login.destination = 1;		//フラグをログイン状態にする。

				session = request.getSession(true);

				String view = "/WEB-INF/view/adminmenu.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			} else {
				//エラーアラートの表示
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<script>");
				printWriter.println("alert('ユーザ名またはパスワードに誤りがあります。');");		//アラート表示
				printWriter.println("history.go(-1)");											//前のページに戻るスクリプト
				printWriter.println("</script>");
			}


		} else if(Login.destination == 0){			//教員でログインしている場合

			String view = "/WEB-INF/view/attendingstatuscheck.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);

		} else if(Login.destination == 1){			//管理者でログインしている場合

			String view = "/WEB-INF/view/adminmenu.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}
}