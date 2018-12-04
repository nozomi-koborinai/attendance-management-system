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
		 String[] publicList = request.getParameterValues("public");
		 int sNo = Integer.parseInt(request.getParameter("sNo"));
		 for(String s : publicList){
			AmsDAO.publicFlagDataUP(Integer.parseInt(s), sNo);
		 }

//ここからお願いします小成さん
//		String view = "/WEB-INF/view/※※※※.jsp";
//		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
//		dispatcher.forward(request, response);
	}

}
