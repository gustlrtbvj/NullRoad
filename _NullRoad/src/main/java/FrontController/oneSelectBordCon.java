package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.CommunityVO;
import Model.CustomerCenterVO;
import Model.DAO;

public class oneSelectBordCon implements Command
{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 1. 파라미터 수집
			System.out.println("생생정보통");
			// 2. DAO 객체 생성
			DAO dao = new DAO();

			System.out.print("DAO");
			int cs_art_seq = Integer.parseInt(request.getParameter("cs_art_seq"));
			// 3. DAO의 메서드 사용해서 BoardVO 받아오기
			System.out.println(cs_art_seq);
			CustomerCenterVO csvo = dao.CsSelectOne(cs_art_seq);
			System.out.println("여기여기>>"+csvo);

			request.setAttribute("csvo", csvo);

			// 5. Forward 방식으로 viewBoard.jsp로 이동
			RequestDispatcher rd = request.getRequestDispatcher("oneboardview.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

		}
	}

}
