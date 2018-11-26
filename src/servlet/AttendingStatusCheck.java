package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
			dto.LoginUser user;

			result = AmsDAO.login(userId, pass);

			//ログインしたユーザが教員の場合
			if(result == 0){

				//HttpSessionインスタンスの取得
				HttpSession session = request.getSession(false);

				user = AmsDAO.getUserName(userId, pass);
				session.setAttribute("user", user);

				Login.destination = 0;		//フラグをログイン状態にする。

				session = request.getSession(true);

				//Calenderクラスのインスタンス生成
				Calendar cl = Calendar.getInstance();
				//現在時刻取得
				Date date = new Date();
				//日付フォーマットの定義
				SimpleDateFormat sdf = new SimpleDateFormat("MM'月'dd'日'");
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

				switch (cl.get(Calendar.DAY_OF_WEEK)) {
				case Calendar.SUNDAY:     // Calendar.SUNDAY:1
					cl.add(Calendar.DAY_OF_MONTH, -6);
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

					request.setAttribute("day", "Sunday");

					String view = "/WEB-INF/view/attendingstatuscheckSturdaySunday.jsp";
					RequestDispatcher dispatcher = request.getRequestDispatcher(view);
					dispatcher.forward(request, response);

					break;
				case Calendar.MONDAY:     // Calendar.MONDAY:2
					request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date))); //月

					String view1 = "/WEB-INF/view/attendingstatuscheckMonday.jsp";
					RequestDispatcher dispatcher1 = request.getRequestDispatcher(view1);
					dispatcher1.forward(request, response);

					break;
				case Calendar.TUESDAY:    // Calendar.TUESDAY:3
					cl.add(Calendar.DAY_OF_MONTH, -1);
					date = cl.getTime();

					request.setAttribute("attendanceList", AmsDAO.getAttendanceInformation(sdf2.format(date)));	//月

					//火曜日に更新
					cl.add(Calendar.DAY_OF_MONTH, 1);
					date = cl.getTime();
					request.setAttribute("attendanceList2", AmsDAO.getAttendanceInformation(sdf2.format(date))); //火

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


				//ログインしたユーザが管理者の場合
			} else if(result == 1){
				//HttpSessionインスタンスの取得
				HttpSession session = request.getSession(false);

				user = AmsDAO.getUserName(userId, pass);
				session.setAttribute("user", user);

				Login.destination = 1;		//フラグをログイン状態にする。

				session = request.getSession(true);

				response.sendRedirect("/Attendance_management_system/AdminMenu");
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

			response.sendRedirect("/Attendance_management_system/AdminMenu");
		}

	}
}