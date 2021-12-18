package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CustomerCenterVO;
import Model.DAO;
import Model.MemberVO;
import Model.RefundVO;

public class CustomerCenterUpdAdmCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("cscentreupdate");

			HttpSession session = request.getSession();
			
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			int cs_art_status = Integer.parseInt(request.getParameter("cs_art_status"));
			int cs_art_seq = Integer.parseInt(request.getParameter("cs_art_seq"));

			DAO dao = new DAO();
			System.out.println(cs_art_seq);
			int cnt = dao.CsCenterUpAdmin(cs_art_status,cs_art_seq);
			
			if (cnt > 0) {
				System.out.println("리펀드 성공");

				request.setAttribute("refduptvo", new CustomerCenterVO(mvo.getM_id(), cs_art_status, cs_art_seq));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("고객센터");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("리펀드 실패");
				response.sendRedirect("#고객센터");
			}
		} catch (Exception e) {
		}	
	}

}
