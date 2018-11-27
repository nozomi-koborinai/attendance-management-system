package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class RefineSearch
 */
@WebServlet("/RefineSearch")
public class RefineSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefineSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String item = request.getParameter("selectName1");
		String condition = request.getParameter("selectName2");

		//Calenderクラスのインスタンス生成
		Calendar cl = Calendar.getInstance();
		//現在時刻取得
		Date date = new Date();
		//日付フォーマットの定義
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");
		SimpleDateFormat sdf3 = new SimpleDateFormat("kk:mm");
		//フォーマット後の現在時刻
		String nowTime = sdf2.format(date);
		System.out.println("教員ログイン時刻" + nowTime);

		//曜日を求める
		cl.setTime(date);
		System.out.println(date);

		request.setAttribute("date", date);
		request.setAttribute("nowTime", sdf3.format(date));
		request.setAttribute("classList", AmsDAO.getAllClassData());
		request.setAttribute("courseList", AmsDAO.getAllCourseData());

		switch (cl.get(Calendar.DAY_OF_WEEK)) {
		case Calendar.SUNDAY:     // Calendar.SUNDAY:1
			cl.add(Calendar.DAY_OF_MONTH, -6);
			date = cl.getTime();
			request.setAttribute("userAttendanceList1", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("userAttendanceList2", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			//水曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("userAttendanceList3", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			//木曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("userAttendanceList4", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			//金曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("userAttendanceList5", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			request.setAttribute("day", "Sunday");

			String view = "/WEB-INF/view/attendingstatuscheckSturdaySunday.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);

			break;
		case Calendar.MONDAY:     // Calendar.MONDAY:2
			request.setAttribute("userAttendanceList1", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			String view1 = "/WEB-INF/view/attendingstatuscheckMonday.jsp";
			RequestDispatcher dispatcher1 = request.getRequestDispatcher(view1);
			dispatcher1.forward(request, response);

			break;
		case Calendar.TUESDAY:    // Calendar.TUESDAY:3
			cl.add(Calendar.DAY_OF_MONTH, -1);
			date = cl.getTime();

			request.setAttribute("userAttendanceList1", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("userAttendanceList2", AmsDAO.getUserAttendanceInformation(sdf2.format(date), item, condition));

			String view2 = "/WEB-INF/view/attendingstatuscheckTuesday.jsp";
			RequestDispatcher dispatcher2 = request.getRequestDispatcher(view2);
			dispatcher2.forward(request, response);

			break;
		case Calendar.WEDNESDAY:  // Calendar.WEDNESDAY:4
			cl.add(Calendar.DAY_OF_MONTH, -2);
			date = cl.getTime();
			request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date)));	//月

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList2", AmsDAO.getAttendanceInformation(sdf2.format(date))); //火

			//水曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList3", AmsDAO.getAttendanceInformation(sdf2.format(date))); //水

			String view3 = "/WEB-INF/view/attendingstatuscheckWednesday.jsp";
			RequestDispatcher dispatcher3 = request.getRequestDispatcher(view3);
			dispatcher3.forward(request, response);

			break;
		case Calendar.THURSDAY:   // Calendar.THURSDAY:5
			cl.add(Calendar.DAY_OF_MONTH, -3);
			date = cl.getTime();
			request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date)));	//月

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList2", AmsDAO.getAttendanceInformation(sdf2.format(date))); //火

			//水曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList3", AmsDAO.getAttendanceInformation(sdf2.format(date))); //水

			//木曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList4", AmsDAO.getAttendanceInformation(sdf2.format(date))); //木

			String view4 = "/WEB-INF/view/attendingstatuscheckThursday.jsp";
			RequestDispatcher dispatcher4 = request.getRequestDispatcher(view4);
			dispatcher4.forward(request, response);


			break;
		case Calendar.FRIDAY:     // Calendar.FRIDAY:6
			cl.add(Calendar.DAY_OF_MONTH, -4);
			date = cl.getTime();
			request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date)));	//月

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList2", AmsDAO.getAttendanceInformation(sdf2.format(date))); //火

			//水曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList3", AmsDAO.getAttendanceInformation(sdf2.format(date))); //水

			//木曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList4", AmsDAO.getAttendanceInformation(sdf2.format(date))); //木

			//金曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList5", AmsDAO.getAttendanceInformation(sdf2.format(date))); //金

			String view5 = "/WEB-INF/view/attendingstatuscheckFriday.jsp";
			RequestDispatcher dispatcher5 = request.getRequestDispatcher(view5);
			dispatcher5.forward(request, response);

			break;
		case Calendar.SATURDAY:   // Calendar.SATURDAY:7
			cl.add(Calendar.DAY_OF_MONTH, -5);
			date = cl.getTime();
			request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date)));	//月

			//火曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList2", AmsDAO.getAttendanceInformation(sdf2.format(date))); //火

			//水曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList3", AmsDAO.getAttendanceInformation(sdf2.format(date))); //水

			//木曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList4", AmsDAO.getAttendanceInformation(sdf2.format(date))); //木

			//金曜日に更新
			cl.add(Calendar.DAY_OF_MONTH, 1);
			date = cl.getTime();
			request.setAttribute("attendanceList5", AmsDAO.getAttendanceInformation(sdf2.format(date))); //金

			request.setAttribute("day", "Saturday");

			String view6 = "/WEB-INF/view/attendingstatuscheckSturdaySunday.jsp";
			RequestDispatcher dispatcher6 = request.getRequestDispatcher(view6);
			dispatcher6.forward(request, response);
			break;
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
