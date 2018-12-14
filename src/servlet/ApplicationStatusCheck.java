package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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
 * Servlet implementation class ApplicationStatusCheck
 */
@WebServlet("/ApplicationStatusCheck")
public class ApplicationStatusCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplicationStatusCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//その生徒の公欠申請情報IDを取得
		int publicID = Integer.parseInt(request.getParameter("check"));
		//IDをもとに公欠申請情報を取得
		request.setAttribute("studentNo", publicID);
		request.setAttribute("publicList", AmsDAO.getApplicationStatus(publicID));
		String view = "/WEB-INF/view/applicationstatuscheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		Calendar calendar = Calendar.getInstance();
		String[] publicList = request.getParameterValues("public");
		String[] publicLst = null;

		if(publicList == null){
			//チェックボックスにチェックをしていない場合
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script>");
			printWriter.println("alert('チェックボックスにチェックがされていません。');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
		} else {

			int sNo = Integer.parseInt(request.getParameter("sNo"));

			for(String s : publicList){
				int i = 0;
				publicLst = s.split(" ");

				for(String st : publicLst){
					if(i == 0){
						AmsDAO.publicFlagDataUP(Integer.parseInt(st), sNo);;
					} else if(i == 1){
						AmsDAO.incrementPublic(sNo, Integer.parseInt(st));
					} else if(i == 2){		//公欠情報登録

						try {
							Date startDate = sdf.parse(st);
							Date endDate = sdf.parse(publicLst[3]);
							while(true){
								if(startDate.compareTo(endDate) == -1 || startDate.compareTo(endDate) == 0){
									for(int a = 1; a <= 6; a++){
										AmsDAO.insertPublicData(sNo, sdf.format(startDate), a);
									}
									calendar.setTime(startDate);
									calendar.add(Calendar.DAY_OF_MONTH, 1);
									startDate = sdf.parse(sdf.format(calendar.getTime()));

								} else {
									break ;
								}
							}
						}  catch (ParseException e) {
							e.printStackTrace();
						}

					}
					i++;
				}

			}

			String view = "/WEB-INF/view/applicationstatuscheckresult.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}
