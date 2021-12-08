package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CommunityRepVO;
import Model.CommunityVO;
import Model.DAO;

public class CommRepCon implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("euc-kr");
			
			
			int comm_rep_seq= Integer.parseInt(request.getParameter("comm_rep_seq"));
			int comm_seq= Integer.parseInt(request.getParameter("comm_seq"));
			String comm_rep_content= request.getParameter("comm_rep_content");
			String comm_rep_reg_date= request.getParameter("comm_rep_reg_date");
			String m_id= request.getParameter("m_id");
			
			DAO dao = new DAO();
			
			int cnt = dao.CommRepCon(comm_rep_seq,comm_seq,comm_rep_content,comm_rep_reg_date,m_id); 
			
			if(cnt>0) {
				System.out.println("댓글 작성 성공");
		
	         request.setAttribute("commrepvo", new CommunityRepVO(comm_rep_seq, comm_seq, comm_rep_content, comm_rep_reg_date, m_id));
						
	         // Forward 방식
	         RequestDispatcher rd = request.getRequestDispatcher("#");
	         // 페이지 이동
	         rd.forward(request, response);
			}else{
		         System.out.println("댓글 작성 실패");
		         response.sendRedirect("main.jsp");
			}
			
			
		} catch (Exception e) {
			
		}
		
	}

}
