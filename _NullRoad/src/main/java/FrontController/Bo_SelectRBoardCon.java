package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.CommunityVO;
import Model.DAO;
import Model.ReviewVO;

public class Bo_SelectRBoardCon implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 1. 파라미터 수집
			System.out.println("생생정보통");
			// 2. DAO 객체 생성
			BoardDAO dao = new BoardDAO();

			System.out.print("DAO");
			int rev_seq = Integer.parseInt(request.getParameter("rev_seq"));
			// 3. DAO의 메서드 사용해서 BoardVO 받아오기
			System.out.println(rev_seq);
			ReviewVO bvo = dao.SelectROne(rev_seq);
			System.out.println("여기여기>>"+bvo);

			request.setAttribute("bvo", bvo);

			// 5. Forward 방식으로 viewBoard.jsp로 이동
			RequestDispatcher rd = request.getRequestDispatcher("Bo_viewReviewboard.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

		}

	}
}
