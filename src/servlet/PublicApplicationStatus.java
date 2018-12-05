package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AmsDAO;

/**
 * Servlet implementation class PublicApplicationStatus
 */
@WebServlet("/PublicApplicationStatus")
public class PublicApplicationStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicApplicationStatus() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));

		request.setAttribute("bDate", barcodeData);
		request.setAttribute("studentName", AmsDAO.getStudentName(barcodeData));
		request.setAttribute("applicatinstatus", AmsDAO.getApplicationStatus(barcodeData));

		String view = "/WEB-INF/view/publicapplicationstatus.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//バーコードから学籍番号を取得
		int barcodeData = Integer.parseInt(request.getParameter("barcodeData"));

		if(AmsDAO.numberCheck(barcodeData) == 1){
			request.setAttribute("bDate", barcodeData);
			request.setAttribute("studentName", AmsDAO.getStudentName(barcodeData));
			request.setAttribute("applicatinstatus", AmsDAO.getApplicationStatus(barcodeData));

			String view = "/WEB-INF/view/publicapplicationstatus.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<script>");
			printWriter.println("alert('不正なバーコード');");
			printWriter.println("history.go(-1)");					//前のページに戻る
			printWriter.println("window.location.reload(true);");	//ページのリロード
			printWriter.println("</script>");
		}
	}

}
