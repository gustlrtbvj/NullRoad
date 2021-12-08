package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CustomerCenterVO;
import Model.DAO;

public class CustomerCenterCon implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");

			int cs_art_seq = Integer.parseInt(request.getParameter("cs_art_seq"));
			String cs_art_subject = request.getParameter("cs_art_subject");
			String cs_art_content = request.getParameter("cs_art_content");
			String cs_art_reg_date = request.getParameter("cs_art_reg_date");
			int cs_art_cnt = Integer.parseInt(request.getParameter("cs_art_cnt"));
			String m_id = request.getParameter("m_id");

			DAO dao = new DAO();

			int cnt = dao.CustomerCenterCon(cs_art_seq, cs_art_subject, cs_art_content, cs_art_reg_date, cs_art_cnt,
					m_id);

			if (cnt > 0) {
				System.out.println("게시글 작성 성공");
				request.setAttribute("vo", new CustomerCenterVO(cs_art_seq, cs_art_subject, cs_art_content,
						cs_art_reg_date, cs_art_cnt, m_id));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("#");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("게시글 작성 실패");
				response.sendRedirect("main.jsp");
			}

		} catch (Exception e) {

		}
	}

}
