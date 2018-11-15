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

import dao.AmsDAO;
import dto.AttendanceStatus;

/**
 * Servlet implementation class BarcodeReading
 */
@WebServlet("/BarcodeReading")
public class BarcodeReading extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BarcodeReading() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//バーコードから学籍番号を取得
		int barcodeStatus = Integer.parseInt(request.getParameter("action"));

		//早退
		if(barcodeStatus == 1){
			String view = "/WEB-INF/view/barcodereading.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

		//公欠申請
		else if(barcodeStatus == 2){
			String view = "/WEB-INF/view/barcodereading2.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

		//公欠申請状況
		else if(barcodeStatus == 3){
			String view = "/WEB-INF/view/barcodereading3.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//早退処理
		request.setCharacterEncoding("UTF-8");

		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		//日付取得
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");
		//出席状況
		AttendanceStatus as = new AttendanceStatus();
		//学籍番号を基に出席情報をデータベースへ追加
		AmsDAO.addToAttendance(barcodeData, sdf.format(date), as.getEarly());
		request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
		//フォワード先で早退時間を表示するための処理
		request.setAttribute("ealryData", sdf.format(date));

		String view = "/WEB-INF/view/leaveEarly.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
