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

		//授業時間インスタンスの生成
		Time jikan = new Time();

		//時刻のみで比較するためにフォーマットを定義
		SimpleDateFormat sdf = new SimpleDateFormat("kk:mm");

		Date date = new Date();

		String nowTime = sdf.format(date);

		System.out.println("登校時刻：" + nowTime);

		//出席確認
		try {
			if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTimeReading()))) < 0){
				System.out.println("読取時間外");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime1()))) < 0){
				System.out.println("1時間目から出席です。\n1時間目～3時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime1()))) < 0){
				System.out.println("1時間目遅刻です。\n1時間目を遅、2時間目～3時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime2()))) < 0){
				System.out.println("2時間目からの出席です。\n1時間目を欠、2時間目～3時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime2()))) < 0){
				System.out.println("2時間目遅刻です。\n1時間目を欠、2時間目を遅、3時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime3()))) < 0){
				System.out.println("3時間目からの出席です。\n1時間目～2時間目を欠、3時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime3()))) < 0){
				System.out.println("3時間目遅刻です。\n1時間目～2時間目を欠、3時間目を遅とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTimeReading2()))) < 0){
				System.out.println("読取時間外");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime4()))) < 0){
				System.out.println("4時間目出席です。\n4時間目～6時間目を〇にします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime4()))) < 0){
				System.out.println("4時間目遅刻です。。\n4時間目を遅、5時間目～6時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime5()))) < 0){
				System.out.println("5時間目からの出席です。\n4時間目を欠、5時間目～6時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime5()))) < 0){
				System.out.println("5時間目遅刻です。。\n4時間目を欠、5時間目を遅、6時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime6()))) < 0){
				System.out.println("6時間目から出席です。\n4時間目～5時間目を欠、6時間目を〇とします。");
			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime6()))) < 0){
				System.out.println("6時間目からの出席です。\n4時間目～5時間目を欠、3時間目を遅とします。");
			} else {
				System.out.println("読取時間外");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		System.out.println(barcodeData);
		//日付取得
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");
		//出席状況
		AttendanceStatus as = new AttendanceStatus();

		//学籍番号を基に出席情報をデータベースへ追加
		AmsDAO.addToAttendance(barcodeData, sdf2.format(date), as.getAttendance());
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
