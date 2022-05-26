package com.jobjava.JJ.cafe.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.cafe.Calendar;
import com.jobjava.JJ.cafe.service.CafeService;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.Paging;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;

@Controller("CafeController")
@RequestMapping(value = "/cafe")
public class CafeControllerImpl implements CafeController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\project\\file";
	@Autowired
	private CafeService cafeService;

	// 카페메인페이지호출
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// 구직등록창호출
	@RequestMapping("/jobapp.do")
	public String jobapp(Model model) {
		return "/cafe/jobapp";
	}

	// 구직등록insert

	@RequestMapping("/cafe/jobresult.do")
	public String jobAppresult(@ModelAttribute("JobAppVO") JobAppVO _jobAppVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		cafeService.insertJob(_jobAppVO);

		return "/cafe/main";

	}

	// 프로그램신청페이지호출
	@RequestMapping("/mypage.do")
	public String mypage(Model model) {
		return "/cafe/mypage";
	}

	// 프로그램신청페이지에 첨부파일 등록(다중파일)
	@Override
	@RequestMapping(value = "/result.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");

		String fILENAME = null;

		Map articleMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		// 로그인 시 세션에 저장된 회원 정보에서 글쓴이 아이디를 얻어와서 Map에 저장합니다.
//			HttpSession session = multipartRequest.getSession();
//			CMemberVO cmemberVO = (CMemberVO) session.getAttribute("cmember");
//			String ID = cmemberVO.getID();
//			 articleMap.put("ID", ID); 
//			
		List<String> fileList = upload(multipartRequest);
		List<FileVO> imageFileList = new ArrayList<FileVO>();

		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				FileVO fileVO = new FileVO();
				fileVO.setEMP_FILENAME(fileName);
				imageFileList.add(fileVO);
			}
			articleMap.put("imageFileList", imageFileList);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		response.setCharacterEncoding("UTF-8");
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {
			int pROGRAM_NO = cafeService.addResult(articleMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (FileVO fileVO : imageFileList) {
					fILENAME = fileVO.getEMP_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fILENAME);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + articleMap.get("PROGRAM_NO"));

					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('신청이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/cafe/main.do" + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (FileVO fileVO : imageFileList) {
					fILENAME = fileVO.getEMP_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fILENAME);
					srcFile.delete();
				}
			}

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 프로그램신청시 다중 파일 업로드하기
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {

			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			// originalFileName = new String(mFile.getOriginalFilename().getBytes("8859_1"),
			// "UTF-8");

			if (originalFileName != "" && originalFileName != null) {

				fileList.add(originalFileName);
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
						file.getParentFile().mkdirs(); // 경로에 해당하는 디렉토리들을 생성

						mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); // 임시로
																													// 전송
					}
				}
			}

		}
		return fileList;
	}

	// 수정하기에서 이미지 삭제 기능
	@RequestMapping(value = "/cafe/removeModImage.do", method = RequestMethod.POST)
	@ResponseBody
	public void removeModImage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		try {
			String eMP_FILE = (String) request.getParameter("EMP_FILE");
			String eMP_FILENAME = (String) request.getParameter("EMP_FILENAME");
			String pROGRAM_NO = (String) request.getParameter("PROGRAM_NO");

			FileVO fileVO = new FileVO();
			fileVO.setPROGRAM_NO(Integer.parseInt(pROGRAM_NO));
			fileVO.setEMP_FILE(Integer.parseInt(eMP_FILE));
			cafeService.removeModImage(fileVO);

			File oldFile = new File(CURR_IMAGE_REPO_PATH + "\\" + pROGRAM_NO + "\\" + eMP_FILE);
			oldFile.delete();

			writer.print("완료");
		} catch (Exception e) {
			writer.print("대실패");
		}

	}

	// 수정 시 다중 이미지 업로드하기
	private ArrayList<String> uploadModImageFile(MultipartHttpServletRequest multipartRequest) throws Exception {
		ArrayList<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
						file.getParentFile().mkdirs(); // 경로에 해당하는 디렉토리들을 생성
						mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); // 임시로
					}
				}
			} else {
				fileList.add(null);
			}
		}
		return fileList;
	}

	// 채용정보 페이징..필요한데 x
	@RequestMapping(value = "/hireinfo/hireinfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView hireinfo(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List<ProgramVO> board = cafeService.boardList();
		mav.addObject("boardList", board);
		mav.setViewName(viewName);
		return mav;

	}

	// 채용정보 조회, 페이징

	@RequestMapping(value = "/hireinfopaging.do")
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		// 전체 글 개수
		int boardListCnt = cafeService.boardListCnt(scri);
		System.out.println(boardListCnt);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = cafeService.boardList(scri);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return mav;
	}

	// 채용정보 상세창
	@RequestMapping(value = "/hireInfoDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView hireInfoDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("programNO") String programNO) throws Exception {
        ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		ProgramVO detail = cafeService.selectProgram(programNO);
		List<Map<String, String>> fileName = cafeService.file(programNO);
		System.out.println(fileName);
		List<String> fileNO = cafeService.selectFileNO(programNO);
		
		mav.addObject("detail", detail);		
		mav.addObject("empFile", fileName);
		mav.addObject("empFileNO", fileNO);
		mav.setViewName(viewName);
		return mav;
	}

	 @RequestMapping(value = "/updateView", method = RequestMethod.GET)
	   public String updateView(ProgramVO programVO, Model model) throws Exception {
	      model.addAttribute("update", programVO);
	      System.out.println("updateView");
	      return "/cafe/updateView";
	   }

	// 채용정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ProgramVO programVO) throws Exception {
		System.out.println(programVO.getPROGRAM_NO());
		System.out.println("update");
		cafeService.update(programVO);

		return "redirect:/cafe/hireInfoDetail.do?programNO=" + programVO.getPROGRAM_NO();
	}

	// 채용정보 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProgramVO programVO) throws Exception {
		System.out.println("delete");
		cafeService.delete(programVO.getPROGRAM_NO());

		return "redirect:/cafe/hireinfopaging.do?programNO=" + programVO.getPROGRAM_NO();
	}

	// 캘린더
	@RequestMapping(value = "/celender.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView calendar(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		Date date = new Date();
		Calendar cal = new Calendar();
		String viewName = (String) request.getAttribute("viewName");
		String year;
		String month;
		String lastDay;

		if (request.getParameter("year") == null && request.getParameter("month") == null) {
			year = String.valueOf(date.getYear() + 1900);
			month = String.valueOf(date.getMonth() + 1);
			lastDay = String.valueOf(cal.lastDay(date.getYear() + 1900, date.getMonth() + 1));
		} else {
			year = request.getParameter("year");
			month = request.getParameter("month");
			lastDay = String.valueOf(cal.lastDay(Integer.parseInt(request.getParameter("year")),
					Integer.parseInt(request.getParameter("month"))));
		}

		for (int i = 1; i <= Integer.parseInt(lastDay); i++) {
			List sDate = cafeService.sDate(year + "-" + month + "-" + i);
			List dDate = cafeService.dDate(year + "-" + month + "-" + i);
			mav.addObject("sdate" + i, sDate);
			mav.addObject("ddate" + i, dDate);
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	// 취업특강(이미지랑 내용 4개표시)

		@RequestMapping(value = "/lecture.do")
		public ModelAndView joblecture(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			// 전체 글 개수
			int boardListCnt2 = cafeService.boardListCnt2(scri);
			System.out.println(boardListCnt2);

			// 페이징 객체
			Paging paging = new Paging();
			paging.setCri(scri);
			paging.setTotalCount(boardListCnt2);

			List<Map<String, Object>> list2 = cafeService.boardList2(scri);
			System.out.println(list2);
			model.addAttribute("list2", list2);
			model.addAttribute("paging", paging);
			return mav;
		}

		// 취업컨설팅(이미지랑 내용 4개표시)

		@RequestMapping(value = "/consulting.do")
		public ModelAndView jobconsulting(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);

			// 전체 글 개수
			int boardListCnt2 = cafeService.boardListCnt2(scri);
			System.out.println(boardListCnt2);

			// 페이징 객체
			Paging paging = new Paging();
			paging.setCri(scri);
			paging.setTotalCount(boardListCnt2);

			List<Map<String, Object>> list2 = cafeService.boardList2(scri);
			System.out.println(list2);
			model.addAttribute("list2", list2);
			model.addAttribute("paging", paging);
			return mav;
		}
		
		
		// 채용공고 조회, 페이징

		@RequestMapping(value = "/jobposting.do")
		public ModelAndView jobposting(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			System.out.println(viewName);

			// 전체 글 개수
			int postingListCnt = cafeService.postingListCnt(scri);
			System.out.println(postingListCnt);

			// 페이징 객체
			Paging paging = new Paging();
			paging.setCri(scri);
			paging.setTotalCount(postingListCnt);

			List<Map<String, Object>> list = cafeService.postingList(scri);
			System.out.println(list);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			return mav;
		}

		@Override
		public ModelAndView postingList(SearchCriteria scri, Model model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}

		// 채용공고 상세창
		@RequestMapping(value = "/jobpostingdetail.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView jobpostingdetail(HttpServletRequest request, HttpServletResponse response,
				@RequestParam("JOB_NO") int JOB_NO) throws Exception {

			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			System.out.println(viewName);
			JobInfoVO detail = cafeService.jobpostingdetail(JOB_NO);
			mav.addObject("detail", detail);
			mav.setViewName(viewName);
			return mav;
		}

		// 채용공고 수정
		@RequestMapping(value = "/jobpostingupdate.do", method = RequestMethod.POST)
		public String jobpostingupdate(JobInfoVO jobinfoVO) throws Exception {
			System.out.println(jobinfoVO.getJOB_NO());
			System.out.println("update");
			cafeService.jobpostingupdate(jobinfoVO);

			return "redirect:/cafe/jobpostingdetail.do?JOB_NO=" + jobinfoVO.getJOB_NO();
		}

		// 채용공고 수정뷰
		@RequestMapping(value = "/jobPostingUpdateView.do", method = RequestMethod.GET)
		public String jobPostingUpdateView(JobInfoVO jobinfoVO, Model model) throws Exception {
			model.addAttribute("update", jobinfoVO);
			System.out.println("update");
			return "jobPostingUpdateView";
		}

		// 채용공고 삭제
		@RequestMapping(value = "/jobPostingDelete.do", method = RequestMethod.POST)
		public String jobPostingDelete(JobInfoVO jobinfoVO) throws Exception {
			cafeService.jobPostingDelete(jobinfoVO.getJOB_NO());

			return "redirect:/cafe/jobposting.do?JOB_NO=" + jobinfoVO.getJOB_NO();
		}


}