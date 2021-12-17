package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberVO;
import Model.ParkingVO;
import Model.ReservationVO;

public class PayLoginCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 파라미터 수집
		String m_id=request.getParameter("m_id");
		String m_pw=request.getParameter("m_pw");
		
		HttpSession session = request.getSession();
		String lot = null;
		if (session.getAttribute("lot")!=null){
			lot = (String)session.getAttribute("lot");
			session.setAttribute("lot", lot);
		}
	
		//DAO 객체 생성
		DAO dao= new DAO();
		MemberVO mvo = dao.Login(m_id, m_pw);

		try {
		if(mvo !=null) {
			System.out.println("로그인 성공");
			session.setAttribute("mvo", mvo);
			
			ParkingVO pvo = dao.ParkSelect(lot);
			if(pvo !=null) {
				System.out.println("주차장정보 불러오기");
				session.setAttribute("pvo", pvo);
			}
			
			
			ReservationVO resvo = dao.IdResSelect(m_id);
			if(resvo !=null) {
				// 성공
				System.out.println("사용하던 주차장이 있습니다.");
				session.setAttribute("resvo", resvo);
				response.sendRedirect("Pay4Receipt.jsp");
			}else {
				// 실패
				System.out.println("사용중인 주차장이 없습니다.");
				response.sendRedirect("Pay2LotUseCon.jsp");
			}

			
		}else {
			// 실패
			System.out.println("로그인 실패!");
			//객체에서는 페이지를 이동할 때, try/catch 써줘야한다. 
			response.sendRedirect("Pay1LoginCheck.jsp");


		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
