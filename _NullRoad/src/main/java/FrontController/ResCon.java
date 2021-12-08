package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.MemberVO;
import Model.ReservationVO;

public class ResCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");
			
			int res_seq= Integer.parseInt(request.getParameter("res_seq"));
			int prk_seq= Integer.parseInt(request.getParameter("prk_seq"));
			String res_time = request.getParameter("res_time");
			String chk_in_time = request.getParameter("chk_in_time");
			String chk_out_time = request.getParameter("chk_out_time");
			int res_status = Integer.parseInt(request.getParameter("res_status"));
			String res_reg_date = request.getParameter("res_reg_date");
			int user_prk_fee = Integer.parseInt(request.getParameter("user_prk_fee"));
			String m_id = request.getParameter("m_id");
			
			DAO dao = new DAO();
			

			int cnt = dao.ResCon(res_seq, prk_seq, res_time, chk_in_time, chk_out_time, res_status, res_reg_date,
					user_prk_fee, m_id);
			
			if (cnt > 0) {
				System.out.println("예약 성공");
				request.setAttribute("resvo", new ReservationVO(res_seq, prk_seq, res_time, chk_in_time, chk_out_time, res_status, res_reg_date,
						user_prk_fee, m_id));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("#");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("예약 실패");
				response.sendRedirect("main.jsp");
			}

		} catch (Exception e) {
			
		}
		
	}

}
