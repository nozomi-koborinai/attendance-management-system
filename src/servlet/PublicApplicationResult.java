package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class PublicApplicationResult
 */
@WebServlet("/PublicApplicationResult")
public class PublicApplicationResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicApplicationResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int studentNumber = Integer.parseInt(request.getParameter("sNumber"));
		String applicationDate = request.getParameter("applicationDate");
		String reason = request.getParameter("reason");
		String place = request.getParameter("place");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String period = date1.concat("～").concat(date2);

		request.setAttribute("sNum", studentNumber);
		request.setAttribute("studentName", AmsDAO.getStudentName(studentNumber));

		//公欠申請
		AmsDAO.registerPublic(studentNumber, applicationDate, reason, place, period);

		String view = "/WEB-INF/view/publicapplicationresult.jsp";
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
