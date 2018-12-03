package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PublicApplicationConfirmation
 */
@WebServlet("/PublicApplicationConfirmation")
public class PublicApplicationConfirmation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicApplicationConfirmation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//日付取得
		Date date = new Date();

		//日付フォーマットの定義
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'");

		int sNumber = Integer.parseInt(request.getParameter("barcodeDate"));
		String why = request.getParameter("why");
		String place = request.getParameter("place");

		String year1 = request.getParameter("year");
		String month1 = request.getParameter("month");
		String day1 = request.getParameter("day");
		String hour1 = request.getParameter("hour");
		String minute1 = request.getParameter("minute");

		String year2 = request.getParameter("year2");
		String month2 = request.getParameter("month2");
		String day2 = request.getParameter("day2");
		String hour2 = request.getParameter("hour2");
		String minute2 = request.getParameter("minute2");

		String date1 = year1.concat("年").concat(month1).concat("月").concat(day1).concat("日").concat(hour1).concat("時").concat(minute1).concat("分");	//結合
		String date2 = year2.concat("年").concat(month2).concat("月").concat(day2).concat("日").concat(hour2).concat("時").concat(minute2).concat("分");	//結合

		request.setAttribute("applicationDate", sdf.format(date));
		request.setAttribute("sNumber", sNumber);
		request.setAttribute("reason", why);
		request.setAttribute("place", place);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);

		String view = "/WEB-INF/view/publicapplicationconfirmation.jsp";
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
