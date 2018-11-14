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
 * Servlet implementation class AddStudentsAndAddTeachers
 */
@WebServlet("/AddStudentsAndAddTeachers")
public class AddStudentsAndAddTeachers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddStudentsAndAddTeachers() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//コース情報とクラス情報を取得
		request.setAttribute("classData", AmsDAO.getAllClassData());
		request.setAttribute("courseData", AmsDAO.getAllCourseData());

		String view = "/WEB-INF/view/addstudentsandaddteachers.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//formに入力された値を取得
		request.setCharacterEncoding("UTF-8");
		//学籍番号
		int studentNo = Integer.parseInt(request.getParameter("studentsNo"));
		//氏名
		String shi = request.getParameter("shi");
		String mei = request.getParameter("mei");
		String shimei = shi.concat("　" + mei);
		//性別
		String gender = request.getParameter("gender");
		//クラス
		int classId = Integer.parseInt(request.getParameter("selectName1"));
		//コース
		int courseId = Integer.parseInt(request.getParameter("selectName2"));

		//データの挿入
		AmsDAO.addToStudent(studentNo, shimei, gender, classId, courseId);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = response.getWriter();

		//登録する学生の学籍番号が既に存在する場合
		if(Login.error == 1){
			printWriter.println("<script>");
			printWriter.println("alert('入力した学生(学籍番号)は既に登録されています。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
			Login.error = 0;
		} else {
			//前のページに戻る処理
			printWriter.println("<script>");
			printWriter.println("alert('1件の学生情報を登録しました。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
		}
	}

}
