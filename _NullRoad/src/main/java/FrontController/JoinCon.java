package FrontController;

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
			
		//바인드 변수 가져오는 값들
			String m_id = request.getParameter("m_id");
			String m_pw = request.getParameter("m_pw");
			String m_name = request.getParameter("m_name");
			String m_jumin = request.getParameter("m_jumin");
			String m_phone = request.getParameter("m_phone");
			String m_car_num = request.getParameter("m_car_num");
			String m_account = request.getParameter("m_account");

			
			DAO dao = new DAO();
			
			int cnt = dao.Join(m_id, m_pw, m_name, m_jumin, m_phone,
					m_car_num, m_account);
			
			if(cnt>0) {
				System.out.println("회원가입 성공");
				
				//받아오는 (입력하는) 값에 맞는새 로운 멤버vo 오버로딩해서 생성 
	         request.setAttribute("vo", dao.Login(m_id,m_pw));
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("main2.jsp");
	        
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("회원가입 실패");
		         response.sendRedirect("main2.jsp");
			}
		      
		} catch (Exception e) {
		}
		

	
	}

}
