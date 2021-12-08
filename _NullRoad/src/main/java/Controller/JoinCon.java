package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.MemberVO;

public class JoinCon implements Command {

	@Override

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");
			

		
			String m_id = request.getParameter("m_id");
			String m_pw = request.getParameter("m_pw");
			String m_name = request.getParameter("m_name");
			String m_jumin = request.getParameter("m_jumin");
			String m_phone = request.getParameter("m_phone");
			String m_car_num = request.getParameter("m_car_num");
			int m_point = Integer.parseInt(request.getParameter("m_point"));
			String m_type = request.getParameter("m_type");
			String m_account = request.getParameter("m_account");
			String m_joindate = request.getParameter("m_joindate");
			String admin_yn = request.getParameter("admin_yn");
			
			DAO dao = new DAO();
			
			int cnt = dao.Join(m_id, m_pw, m_name, m_jumin, m_phone,
					m_car_num, m_point, m_type, m_account, m_joindate, admin_yn);
			
			if(cnt>0) {
				System.out.println("회원가입 성공");
		
	         request.setAttribute("vo", new MemberVO(m_id, m_pw, m_name, m_jumin, m_phone, m_car_num, m_point, m_type, m_account, m_joindate, admin_yn));
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("#");
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("회원가입 실패");
		         response.sendRedirect("main.jsp");
			}
		      
		} catch (Exception e) {
		}
		

	
	}

}
