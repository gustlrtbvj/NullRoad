package FrontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.BuildingVO;
import Model.DAO;
import Model.MemberVO;

/**
 * Servlet implementation class BldRegConn
 */
@WebServlet("/BldRegConn")
public class BldRegConn extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.setCharacterEncoding("euc-kr");

			//1. 실제로 실행되는 프로젝트 파일 위치
			//request.getServletContext();
			//work spaece > 아파치톰캣 업로드(폴더의 위치들이 바뀜)
			//저장할 경로
			String savePath = request.getServletContext().getRealPath("img");
			
			//2. 최대파일 크기(단위 : byte) : 5MB
			int maxSize = 5*1024*1024;
			
			//3. 인코딩 타입
			String encoding = "euc-kr";
			
			System.out.println("RegBld.do 여기니???");	
			//4. request를 대신 해서 받아온 데이터를 정제해줄 MultipartRequest 객체
			MultipartRequest multi = new MultipartRequest(request, 
															savePath, 
															maxSize, 
															encoding,
															new DefaultFileRenamePolicy()	
															);
									
						
			System.out.println("어디니1");
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO)session.getAttribute("mvo");
			int bld_prk_lots= Integer.parseInt(multi.getParameter("bld_prk_lots"));
			String bld_owner = multi.getParameter("bld_owner");
			String bld_owner_phone = multi.getParameter("bld_owner_phone");
			String detail_addr = multi.getParameter("sample6_detailAddress");
			String bld_name = multi.getParameter("bld_name");
			String bld_picture1 = multi.getParameter("chooseFile");
			String bld_picture2 = multi.getParameter("bld_picture2");
			
			
			String se = multi.getParameter("se");
			String[] siem = se.split(" ");
			String sigungu = siem[0]+siem[1];
			String emdong = siem[2];
			System.out.println(sigungu);
			System.out.println(emdong);
			DAO dao = new DAO();
			int cnt = dao.BldRegCon(mvo.getM_id(), bld_prk_lots, bld_owner, bld_owner_phone, 
					sigungu, emdong, detail_addr, bld_name, bld_picture1,bld_picture2);
			System.out.println("어디니");
			if (cnt > 0) {
				System.out.println("건물등록 성공");
				
				request.setAttribute("bldvo", new BuildingVO(mvo.getM_id(), bld_prk_lots, bld_owner, bld_owner_phone, 
						sigungu, emdong, detail_addr, bld_name, bld_picture1,bld_picture2));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("건물등록 실패");
				response.sendRedirect("main.jsp");
			}
				
		} catch (Exception e) {
			System.out.println(e);
		}
		

	}	
}
