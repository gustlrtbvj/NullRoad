package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.MemberVO;
import Model.ParkingVO;

public class PrkRegCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");
			
			int prk_seq = Integer.parseInt(request.getParameter("prk_seq"));
			int prk_area_num = Integer.parseInt(request.getParameter("prk_area_num"));
			String prk_time = request.getParameter("prk_time");
			String prk_day = request.getParameter("prk_day");
			int prk_fee = Integer.parseInt(request.getParameter("prk_fee"));
			String prk_status = request.getParameter("prk_status");
			String prk_memo = request.getParameter("prk_memo");
			int bld_seq = Integer.parseInt(request.getParameter("bld_seq"));
			
			
			DAO dao = new DAO();
			
			int cnt = dao.PrkRegCon(prk_seq, prk_area_num, prk_time, prk_day, prk_fee,
					prk_status, prk_memo, bld_seq);
			if(cnt>0) {
				System.out.println("주차장 등록 성공");
		
	         request.setAttribute("pvo", new ParkingVO(prk_seq, prk_area_num, prk_time, prk_day, prk_fee,
						prk_status, prk_memo, bld_seq));
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("#");
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("주차장 등록 실패");
		         response.sendRedirect("main.jsp");
			}
		
		
		} catch (Exception e) {

		}
	}

}
