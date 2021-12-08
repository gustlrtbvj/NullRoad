package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.ReservationVO;
import Model.ReviewVO;

public class ReviewCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");

			int rev_seq= Integer.parseInt(request.getParameter("rev_seq"));
			String rev_subject= request.getParameter("rev_subject");
			String rev_content= request.getParameter("rev_content");
			int res_seq = Integer.parseInt(request.getParameter("res_seq"));
			String m_id = request.getParameter("m_id");
			String rev_reg_date= request.getParameter("rev_reg_date");
			int rev_cnt = Integer.parseInt(request.getParameter("rev_cnt"));
			
			DAO dao = new DAO();
			
			int cnt = dao.ReviewCon(rev_seq, rev_subject, rev_content, res_seq,m_id,rev_reg_date,rev_cnt);
			
			
			if (cnt > 0) {
				System.out.println("리뷰작성 성공");
				request.setAttribute("revvo", new ReviewVO(rev_seq, rev_subject, rev_content, res_seq, m_id, rev_reg_date, rev_cnt));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("#");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("리뷰작성 실패");
				response.sendRedirect("main.jsp");
			}
			
		} catch (Exception e) {
		}
		
	}

}
