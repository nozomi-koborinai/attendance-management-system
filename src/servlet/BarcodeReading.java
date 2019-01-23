package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

		//フォワードするか否かを表すフラグ
		int fFlag = 1;			//0・・・フォワードしない、1・・・フォワードする

		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));
		if(AmsDAO.numberCheck(barcodeData) == 0){
			String view = "/WEB-INF/view/noBarcodeExits.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

		//日付取得
		Date date = new Date();

		//日付フォーマットの定義
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");

		//時刻のみで比較するためにフォーマットを定義
		SimpleDateFormat sdf = new SimpleDateFormat("kk:mm");

		//出欠インスタンスの生成
		AttendanceStatus as = new AttendanceStatus();

		//授業時間インスタンスの生成
		Time jikan = new Time();

		//時刻のみに変換
		String nowTime = sdf.format(date);

		System.out.println("早退時刻：" + nowTime);
		//時刻チェック
		try {
			if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTimeReading()))) < 0){
				System.out.println("読取時間外");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<script>");
				printWriter.println("alert('時間外読取');");
				printWriter.println("history.go(-1)");					//前のページに戻る
				printWriter.println("window.location.reload(true);");	//ページのリロード
				printWriter.println("</script>");

				//フラグにフォワードなしを設定
				fFlag = 0;

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime1()))) < 0){
				System.out.println("1時間目早退です。\n1時間目を早、2時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 1);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 2);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 3);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime2()))) < 0){
				System.out.println("2時間目から欠席です。\n2時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 2);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 3);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime2()))) < 0){
				System.out.println("2時間目早退です。\n2時間目を遅、3時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 2);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 3);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime3()))) < 0){
				System.out.println("3時間目から欠席です。\n3時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 3);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime3()))) < 0){
				System.out.println("3時間目早退です。\n3時間目を早、4時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 3);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime4()))) < 0){
				System.out.println("4時間目から欠席です。\n4時間目～6時間目を欠とします。");

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime4()))) < 0){
				System.out.println("4時間目早退です。。\n4時間目を早、5時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 4);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 5);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 6);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime5()))) < 0){
				System.out.println("5時間目からの欠席です。\n5時間目～6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 5);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 6);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime5()))) < 0){
				System.out.println("5時間目早退です。。\n5時間目を早、6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 5);
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 6);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getStartTime6()))) < 0){
				System.out.println("6時間目欠席です。\n6時間目を欠とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.deleteAttendanceData(barcodeData, sdf2.format(date), 6);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));

			} else if(nowTime.compareTo(sdf.format(sdf.parse(jikan.getEndTime6()))) < 0){
				System.out.println("6時間目早退です。\n6時間目を早とします。");
				//学籍番号を基に出席情報をデータベースへ追加
				AmsDAO.updateEarlyData(barcodeData, sdf2.format(date), 6);

				request.setAttribute("studentData", AmsDAO.getStudent(barcodeData));
				//フォワード先で早退時間を表示するための処理
				request.setAttribute("ealryData", sdf2.format(date));
			} else {
				System.out.println("読取時間外");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<script>");
				printWriter.println("alert('時間外読取');");
				printWriter.println("history.go(-1)");					//前のページに戻る
				printWriter.println("window.location.reload(true);");	//ページのリロード
				printWriter.println("</script>");

				//フラグにフォワードなしを設定
				fFlag = 0;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		if(fFlag == 1){
			String view = "/WEB-INF/view/leaveEarly.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}
