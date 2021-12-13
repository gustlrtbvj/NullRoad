package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BuildingVO;
import Model.DAO;
import Model.MemberVO;

public class BldRegCon implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");

			String m_id= request.getParameter("m_id");
			double  bld_lati = Double.parseDouble(request.getParameter("bld_lati"));
			double bld_longi = Double.parseDouble(request.getParameter("bld_longi"));
			int bld_prk_lots= Integer.parseInt(request.getParameter("bld_prk_lots"));
			String bld_owner = request.getParameter("bld_owner");
			String bld_owner_phone = request.getParameter("bld_owner_phone");
			String sigungu = request.getParameter("sigungu");
			String emdong = request.getParameter("emdong");
			String detail_addr = request.getParameter("detail_addr");
			String bld_reg_date= request.getParameter("bld_reg_date");
			int bld_approve = Integer.parseInt(request.getParameter("bld_approve"));
			String bld_name = request.getParameter("bld_name");
			String bld_picture1 = request.getParameter("bld_picture1");
			String bld_picture2 = request.getParameter("bld_picture2");
			
			DAO dao = new DAO();
			int cnt = dao.BldRegCon(m_id, bld_lati, bld_longi, bld_prk_lots,
					bld_owner, bld_owner_phone, sigungu, emdong, detail_addr, bld_reg_date, 
					bld_approve,bld_name,bld_picture1,bld_picture2);

			if (cnt > 0) {
				System.out.println("건물등록 성공");
				
				request.setAttribute("bvo", new BuildingVO(m_id, bld_lati, bld_longi, bld_prk_lots, bld_owner, bld_owner_phone, 
						sigungu, emdong, detail_addr, bld_reg_date, bld_approve,bld_name,bld_picture1,bld_picture2));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("#");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("건물등록 실패");
				response.sendRedirect("main.jsp");
			}
				
		} catch (Exception e) {
		}

	}

}
