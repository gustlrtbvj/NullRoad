package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberVO;
import Model.ParkingVO;
import Model.ReservationVO;

public class PayUseService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1. 파라미터 수집
		try {

		HttpSession session = request.getSession();
		ParkingVO pvo = null;
		if (session.getAttribute("pvo")!=null){
			pvo = (ParkingVO)session.getAttribute("pvo");
			session.setAttribute("pvo", pvo);
		}
		MemberVO mvo = null;
		if (session.getAttribute("mvo")!=null){
			mvo = (MemberVO)session.getAttribute("mvo");
			session.setAttribute("mvo", mvo);
		}else{
			response.sendRedirect("Pay1LoginCheck.jsp");
		}
	
		//DAO 객체 생성
		DAO dao= new DAO();
		int cnt = dao.PayResCon(pvo.getPrk_seq(),pvo.getPrk_fee(),mvo.getM_id());
		if(cnt>0) {
			System.out.println("예약 성공");
			response.sendRedirect("Pay3UseComplete.jsp");
		}else {
			System.out.println("예약 실패");
		}

		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
