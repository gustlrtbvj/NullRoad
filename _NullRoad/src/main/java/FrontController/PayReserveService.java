package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BuildingVO;
import Model.DAO;
import Model.MemberVO;
import Model.ParkingVO;

public class PayReserveService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
		String page=request.getParameter("page");
		HttpSession session = request.getSession();
		MemberVO mvo = null;
		if (session.getAttribute("mvo")!=null){
			mvo = (MemberVO)session.getAttribute("mvo");
			session.setAttribute("mvo", mvo);
		}else{
			response.sendRedirect(page);
		}
		BuildingVO bldvo = null;
		if (session.getAttribute("bldvo")!=null){
			bldvo = (BuildingVO)session.getAttribute("bldvo");
			session.setAttribute("bldvo", bldvo);
		}else{
			response.sendRedirect(page);
		}
		
		System.out.println("예약을 시도한다.");
		DAO dao= new DAO();
		String park = dao.PayReserSelect(bldvo.getBld_seq(),mvo.getM_id());
		ParkingVO pvo =  dao.ParkSelect(park);
		
		if (pvo == null) {
			response.sendRedirect(page);
		}else {
			session.setAttribute("pvo", pvo);
			response.sendRedirect("Pay6ReserveComplete.jsp");
		}
		//객체에서는 페이지를 이동할 때, try/catch 써줘야한다. 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	

}
