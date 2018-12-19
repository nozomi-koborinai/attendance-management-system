package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AmsDAO;
import dto.AttendanceStatus;
import dto.Time;

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
		//HttpSessionインスタンスの取得(ダブりエラーの際の比較用)
		HttpSession session = request.getSession(false);

		int fFlag = 1;

		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		String sNum = request.getParameter("barcodeData");

		//日付取得
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");

		//出欠ステータスのインスタンス生成
		AttendanceStatus as = new AttendanceStatus();

		//授業時間インスタンスの生成
		Time jikan = new Time();

		//時刻のみで比較するためにフォーマットを定義
		SimpleDateFormat sdf = new SimpleDateFormat("kk:mm");

		Date date = new Date();

		String nowTime = sdf.format(date);

		if(AmsDAO.numberCheck(barcodeData) == 1){

			//出席確認
			try {
				if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTimeReading()))) < 0){
					String view = "/WEB-INF/view/extraTimeBarcodeReading.jsp";
					RequestDispatcher dispatcher = request.getRequestDispatcher(view);
					dispatcher.forward(request, response);

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime1()))) < 0){

					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("1時間目から出席です。\n1時間目～3時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 1, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 2, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getAttendance());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime1()))) < 0){
					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("1時間目遅刻です。\n1時間目を遅、2時間目～3時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 1, as.getLate());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 2, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getAttendance());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime2()))) < 0){
					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("2時間目からの出席です。\n1時間目を欠、2時間目～3時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 2, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getAttendance());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime2()))) < 0){
					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("2時間目遅刻です。\n1時間目を欠、2時間目を遅、3時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 2, as.getLate());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getAttendance());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime3()))) < 0){
					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("3時間目からの出席です。\n1時間目～2時間目を欠、3時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getAttendance());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime3()))) < 0){
					if((String)session.getAttribute(sNum + "1") == null){
						session.removeAttribute(sNum + "2");
						System.out.println("3時間目遅刻です。\n1時間目～2時間目を欠、3時間目を遅とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 3, as.getLate());
						session.setAttribute(sNum + "1", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));

					} else {
						fFlag = 2;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTimeReading2()))) < 0){
					String view = "/WEB-INF/view/extraTimeBarcodeReading.jsp";
					RequestDispatcher dispatcher = request.getRequestDispatcher(view);
					dispatcher.forward(request, response);

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime4()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("4時間目出席です。\n1時間目から3時間目を欠、4時間目～6時間目を〇にします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 4, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 5, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getAttendance());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 3;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime4()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("4時間目遅刻です。。\n1時間目から3時間目を欠、4時間目を遅、5時間目～6時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 4, as.getLate());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 5, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getAttendance());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 3;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime5()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("5時間目からの出席です。\n1時間目から3時間目を欠、4時間目を欠、5時間目～6時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 5, as.getAttendance());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getAttendance());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 3;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime5()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("5時間目遅刻です。。\n1時間目から3時間目を欠、4時間目を欠、5時間目を遅、6時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 5, as.getLate());
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getAttendance());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 3;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartLateTime6()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("6時間目から出席です。\n1時間目～5時間目を欠、6時間目を〇とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getAttendance());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
					} else {
						fFlag = 3;
					}

				} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime6()))) < 0){
					if((String)session.getAttribute(sNum + "2") == null){
						session.removeAttribute(sNum + "1");
						System.out.println("6時間目からの出席です。\n1時間目～5時間目を欠、6時間目を遅とします。");
						//学籍番号を基に出席情報をデータベースへ追加
						AmsDAO.addToAttendance(barcodeData, sdf2.format(date), 6, as.getLate());
						session.setAttribute(sNum + "2", sNum);
						request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));

					} else {
						fFlag = 3;
					}
				} else {
					String view = "/WEB-INF/view/extraTimeBarcodeReading.jsp";
					RequestDispatcher dispatcher = request.getRequestDispatcher(view);
					dispatcher.forward(request, response);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}

			if(fFlag == 1){
				String view = "/WEB-INF/view/attendingschool.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			} else if(fFlag == 2){
				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				request.setAttribute("time", "午前");
				String view = "/WEB-INF/view/sameBarcodeReading.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			} else if(fFlag == 3){
				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				request.setAttribute("time", "午後");
				String view = "/WEB-INF/view/sameBarcodeReading.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			}

		} else {
			String view = "/WEB-INF/view/noBarcodeExits.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
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
