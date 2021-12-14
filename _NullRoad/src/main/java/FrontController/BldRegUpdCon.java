package FrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.BuildingVO;
import Model.DAO;
import Model.MemberVO;

public class BldRegUpdCon implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("euc-kr");

			// 1. 실제로 실행되는 프로젝트 파일 위치
			// request.getServletContext();
			// work spaece > 아파치톰캣 업로드(폴더의 위치들이 바뀜)
			// 저장할 경로
			String savePath = request.getServletContext().getRealPath("img");

			// 2. 최대파일 크기(단위 : byte) : 5MB
			int maxSize = 5 * 1024 * 1024;

			// 3. 인코딩 타입
			String encoding = "euc-kr";

			// 4. request를 대신 해서 받아온 데이터를 정제해줄 MultipartRequest 객체
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding,
					new DefaultFileRenamePolicy());

			HttpSession session = request.getSession();

			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			BuildingVO bldvo = (BuildingVO) session.getAttribute("bldvo");
			int bld_prk_lots = Integer.parseInt(multi.getParameter("bld_prk_lots"));
			String bld_owner = multi.getParameter("bld_owner");
			String bld_owner_phone = multi.getParameter("bld_owner_phone");
			String sigungu = multi.getParameter("sigungu");
			String emdong = multi.getParameter("emdong");
			String detail_addr = multi.getParameter("detail_addr");
			String bld_name = multi.getParameter("bld_name");
			String bld_picture1 = multi.getParameter("bld_picture1");
			String bld_picture2 = multi.getParameter("bld_picture2");

			DAO dao = new DAO();
			int cnt = dao.BldRegUpdCon(mvo.getM_id(), bldvo.getBld_seq(), bld_prk_lots, bld_owner, bld_owner_phone, sigungu, emdong,
					detail_addr, bld_name, bld_picture1, bld_picture2);

			if (cnt > 0) {
				System.out.println("건물등록 성공");

				request.setAttribute("bldvo", new BuildingVO(mvo.getM_id(), bldvo.getBld_seq(), bld_owner, bld_owner_phone,
						sigungu, emdong, detail_addr, bld_name, bld_picture1, bld_picture2));
				// Forward 방식
				RequestDispatcher rd = request.getRequestDispatcher("");
				// 페이지 이동
				rd.forward(request, response);
			} else {
				System.out.println("건물등록 실패");
				response.sendRedirect("main.jsp");
			}

		} catch (Exception e) {
		}
	}

}
