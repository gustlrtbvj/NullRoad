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

			int bld_seq = Integer.parseInt(request.getParameter("bld_seq"));
			String m_id= request.getParameter("m_id");
			int bld_lati = Integer.parseInt(request.getParameter("bld_lati"));
			int bld_longi = Integer.parseInt(request.getParameter("bld_longi"));
			int bld_prk_lots= Integer.parseInt(request.getParameter("bld_prk_lots"));
			String bld_owner = request.getParameter("bld_owner");
			String bld_owner_phone = request.getParameter("bld_owner_phone");
			String sigungu = request.getParameter("sigungu");
			String emdong = request.getParameter("emdong");
			String detail_addr = request.getParameter("detail_addr");
			String bld_reg_date= request.getParameter("bld_reg_date");
			String bld_approve = request.getParameter("bld_approve");
			
			DAO dao = new DAO();
			int cnt = dao.BldRegCon(bld_seq, m_id, bld_lati, bld_longi, bld_prk_lots,
					bld_owner, bld_owner_phone, sigungu, emdong, detail_addr, bld_reg_date, bld_approve);

			if (cnt > 0) {
				System.out.println("�ǹ���� ����");
				
				request.setAttribute("bvo", new BuildingVO(bld_seq, m_id, bld_lati, bld_longi, bld_prk_lots, bld_owner, bld_owner_phone, 
						sigungu, emdong, detail_addr, bld_reg_date, bld_approve));
				// Forward ���
				RequestDispatcher rd = request.getRequestDispatcher("#");
				// ������ �̵�
				rd.forward(request, response);
			} else {
				System.out.println("�ǹ���� ����");
				response.sendRedirect("main.jsp");
			}
				
		} catch (Exception e) {
		}

	}

}