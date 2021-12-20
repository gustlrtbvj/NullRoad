package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CustomerCenterVO;
import Model.DAO;
import Model.MemberVO;

public class OneCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");
			HttpSession session = request.getSession();
			

			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String cs_art_subject = request.getParameter("cs_art_subject");
			String cs_art_content = request.getParameter("cs_art_content");
			String m_id = request.getParameter(mvo.getM_id());

			
			DAO dao = new DAO();
			
			int cnt = dao.One(cs_art_subject, cs_art_content,mvo.getM_id());
			if (cnt > 0) {
				System.out.println("고객센터 글작성 성공");
				request.setAttribute("csvo", new CustomerCenterVO(cs_art_subject,cs_art_content, m_id));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("회원정보 수정 실패");
				response.sendRedirect("one.jsp");
			}
		} catch (Exception e) {

		}
	}

}
