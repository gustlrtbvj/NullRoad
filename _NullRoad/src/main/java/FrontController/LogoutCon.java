package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			

		// 로그아웃 기능
		// vo 가 null인지 아닌지
		// vo --> Session 영역 저장
		// 세션을 지워줄것
		
		// 1. 세션 객체 생성
		HttpSession session = request.getSession();
		
		// 2. 세션 삭제
		// removeAttribute() --> 1개 삭제
		// invalidate() --> 세션에 저장된 모든 값 삭제
		session.invalidate();
		
		//3. 페이지 이동
		response.sendRedirect("main2.jsp");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
}
