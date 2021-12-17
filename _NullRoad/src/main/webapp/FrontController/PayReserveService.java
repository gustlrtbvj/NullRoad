package FrontController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BuildingVO;
import Model.DAO;
import Model.MemberVO;

public class PayReserveService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
		String page=request.getParameter("page");
		int bld_seq=Integer.parseInt(request.getParameter("bld_seq"));
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
		
		DAO dao= new DAO();
		int cnt = dao.PayReserSelect(bldvo.getBld_seq(),mvo.getM_id());
		if (cnt >0) {
			response.sendRedirect("Pay6ReserveComplete.jsp");
		}else {
			response.sendRedirect(page);
		}
		//객체에서는 페이지를 이동할 때, try/catch 써줘야한다. 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
