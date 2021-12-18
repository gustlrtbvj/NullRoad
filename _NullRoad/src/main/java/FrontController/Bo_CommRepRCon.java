package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BoardDAO;
import Model.CommunityRepVO;
import Model.CommunityVO;
import Model.DAO;

public class Bo_CommRepRCon implements Command{

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
			int rev_seq = Integer.parseInt(request.getParameter("num"));
			String rev_ment_content = request.getParameter("message");
			String m_id = request.getParameter("m_id");
			
			System.out.println(rev_seq);
			
			System.out.println(rev_ment_content);
			BoardDAO dao = new BoardDAO();
			
			int cnt = dao.CommRepCon(rev_seq, rev_ment_content, m_id); 
			System.out.println(cnt);
			if(cnt>0) {
				System.out.println("댓글 작성 성공");
		
	         request.setAttribute("bvo", new CommunityVO(rev_seq));
						
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("SelectRBoard.do?rev_seq="+rev_seq);
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("댓글 작성 실패");
			}
			
			
		} catch (Exception e) {
			
		}
		
	}
		
	}


