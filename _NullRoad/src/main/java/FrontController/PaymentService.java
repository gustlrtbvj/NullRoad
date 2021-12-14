package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberVO;
import Model.ParkingVO;
import Model.ReservationVO;

public class PaymentService implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 파라미터 수집
		try {
			int price=Integer.parseInt(request.getParameter("price"));
			
			HttpSession session = request.getSession();
			ParkingVO pvo = null;
			if (session.getAttribute("pvo") != null) {
				pvo = (ParkingVO) session.getAttribute("pvo");
				session.setAttribute("pvo", pvo);
			}
			ReservationVO resvo = null;
			if (session.getAttribute("resvo") != null) {
				resvo = (ReservationVO) session.getAttribute("resvo");
				session.setAttribute("resvo", resvo);
			}

			MemberVO mvo = null;
			if (session.getAttribute("mvo") != null) {
				mvo = (MemberVO) session.getAttribute("mvo");
				session.setAttribute("mvo", mvo);
			} else {
				response.sendRedirect("Pay1LoginCheck.jsp");
			}

			// DAO 객체 생성
			DAO dao = new DAO();
			int num = dao.PaySetGold(mvo.getM_id(),-price);
			if (num > 0) {
				System.out.println("포인트 성공");
				int cnt = dao.PayResSet(resvo.getRes_seq(),resvo.getPrk_seq(),price);
				if (cnt > 0) {
					System.out.println("결제 성공");
					response.sendRedirect("Pay5PayComplete.jsp");
				} else {
					System.out.println("결제 실패");
					response.sendRedirect("Pay4Receipt.jsp");
				}
			} else {
				System.out.println("포인트 실패");
				response.sendRedirect("Pay4Receipt.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
