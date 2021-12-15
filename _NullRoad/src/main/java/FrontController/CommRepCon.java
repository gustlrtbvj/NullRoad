package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.CommunityRepVO;
import Model.CommunityVO;
import Model.DAO;

public class CommRepCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("EUC-KR");
			System.out.println("실행?");
			
			
			//2. 최대파일 크기(단위 : byte) : 5MB			
			//3. 인코딩 타입
			//4. request를 대신 해서 받아온 데이터를 정제해줄 MultipartRequest 객체
			// 파라미터 수집
			// MultipartRequest 객체로부터 파라미터 수집
			int comm_seq = Integer.parseInt(request.getParameter("num"));
			String comm_rep_content = request.getParameter("message");
			
			System.out.println(comm_seq);
			
			System.out.println(comm_rep_content);
			BoardDAO dao = new BoardDAO();
			
			int cnt = dao.CommRepCon(comm_seq, comm_rep_content); 
			System.out.println(cnt);
			if(cnt>0) {
				System.out.println("댓글 작성 성공");
		
	         request.setAttribute("bvo", new CommunityVO(comm_seq));
						
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("SelectBoard.do?comm_seq="+comm_seq);
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("댓글 작성 실패");
			}
			
			
		} catch (Exception e) {
			
		}
		
	}
		
	}


