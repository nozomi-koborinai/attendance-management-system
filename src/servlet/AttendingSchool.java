package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class AttendingSchool
 */
@WebServlet("/AttendingSchool")
public class AttendingSchool extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendingSchool() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		//時刻取得
		Date date = new Date();
		//学籍番号を基に出席情報をデータベースへ追加
		AmsDAO.addToAttendance(barcodeData, date);
		request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));

		String view = "/WEB-INF/view/attendingschool.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
