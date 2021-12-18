package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CSReplyVO;
import Model.DAO;
import Model.MemberVO;

public class CorUpdCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("mvo");
		
		try {
			request.setCharacterEncoding("euc-kr");
			
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			System.out.println("어디?");
			String m_pw=request.getParameter("m_pw");
			String m_phone=request.getParameter("m_phone");
			String m_car_num=request.getParameter("m_car_num");
			String m_account=request.getParameter("m_account");
			String m_id = request.getParameter(mvo.getM_id());

			DAO dao = new DAO();
			
			int cnt = dao.CorUpd(m_pw,m_phone,m_car_num,m_account,mvo.getM_id());
			if (cnt > 0) {
				System.out.println("회원정보 수정 성공");
				request.setAttribute("mvo", new MemberVO(m_pw,m_phone,m_car_num,m_account,mvo.getM_id()));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("mypage.jsp");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("회원정보 수정 실패");
				response.sendRedirect("main.jsp");
			}
		} catch (Exception e) {

		}

	}

}
