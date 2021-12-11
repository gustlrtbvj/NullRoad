package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberVO;

public class LoginCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 파라미터 수집
		String m_id=request.getParameter("m_id");
		String m_pw=request.getParameter("m_pw");
	
		//DAO 객체 생성
		DAO dao= new DAO();
		MemberVO mvo = dao.Login(m_id, m_pw);
	
	
		//로그인 실패 / 성공 판단
		//vo가 null이면 : 로그인 실패
		//vo가 null이 아니면 : 로그인 성공
		
		if(mvo !=null) {
			// 성공
			System.out.println("로그인 성공");
			// 세션에 유저의 정보를 담아서 전달
			// 1. 세션 객체 생성
			HttpSession session = request.getSession();
			
			//2. 세션에 Attribute 추가 session.setAttribute("", mvo);
			session.setAttribute("mvo", mvo);
			
		}else {
			// 실패
			System.out.println("로그인 실패!");


		}
		
		//객체에서는 페이지를 이동할 때, try/catch 써줘야한다. 
		try {
			response.sendRedirect("main2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
