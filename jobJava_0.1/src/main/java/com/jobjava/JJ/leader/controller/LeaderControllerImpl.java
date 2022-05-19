package com.jobjava.JJ.leader.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.leader.service.LeaderService;
import com.jobjava.JJ.leader.vo.AppVO;
import com.jobjava.JJ.leader.vo.CRegVO;
import com.jobjava.JJ.leader.vo.FileVO;
import com.jobjava.JJ.leader.vo.Paging;
import com.jobjava.JJ.leader.vo.SearchCriteria;
import com.jobjava.JJ.leader.vo.SurveyVO;

@Controller("LeaderController")
@RequestMapping(value = "/leader")
public class LeaderControllerImpl implements LeaderController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\project\\file";
	@Autowired
	LeaderService leaderService;

	// 리더메인 홈페이지로 이동
	@Override
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView leaderMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 기업 등록 화면 호출
	@Override
	@RequestMapping("/company.do")
	public String companyLegister(Model model) {
		return "/leader/companyLegister";
	}

	@Override
	// 기업 등록 insert
	@RequestMapping("/legister.do")
	public ResponseEntity legister(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		// 사용자가 입력한 정보를 파라미터로 넘김
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
//		HttpSession session = multipartRequest.getSession();
//		CMemberVO cmemberVO = (CMemberVO) session.getAttribute("cmember");
//		String ID = cmemberVO.getID();
//		 articleMap.put("ID", ID); 
//		
		List<String> fileList = upload(multipartRequest);
		List<FileVO> imageFileList = new ArrayList<FileVO>();
		
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				FileVO fileVO = new FileVO();
				fileVO.setREGI_FILENAME(fileName);
				imageFileList.add(fileVO);
			}
			articleMap.put("imageFileList", imageFileList);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
		try {
			int rEGI_NO = leaderService.addCompany(articleMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (FileVO fileVO : imageFileList) {
					fILENAME = fileVO.getREGI_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fILENAME);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + rEGI_NO);
					
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('신청이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/main.do?REGI_NO=" + articleMap.get("rEGI_NO") + "';" ;
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (FileVO fileVO : imageFileList) {
					fILENAME = fileVO.getREGI_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fILENAME);
					srcFile.delete();
				}
			}

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/main.do";
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
			
		   if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				File file = new File(CURR_IMAGE_REPO_PATH + "\\"  + fileName);
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

	@Override
	// //기업등록 목록 페이지 호출
	@RequestMapping("/companyLegisterList.do")
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		// 전체 글 개수
		int boardListCnt = leaderService.boardListCnt(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = leaderService.boardList(scri);
		// 한페이지당 보여줄 게시물 갯수

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return mav;
	}

	// 기업정보 상세창
	@RequestMapping(value = "/companyDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView companyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") String regiNO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		CRegVO detail = leaderService.selectRegi(regiNO);
		mav.addObject("detailList", detail);
		mav.setViewName(viewName);
		return mav;
	}

	// 사업신청페이지(학생용)
	@RequestMapping(value = "/viweApplicationfrom.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView viweApplication(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("regiNO") int regiNO, @RequestParam("userID") String userID,
			@RequestParam("sdate") String sdate) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String title = leaderService.cregTitle(regiNO);
		AppVO userInfo = leaderService.userInfo(userID);

		mav.addObject("title", title);
		mav.addObject("userID", userID);
		mav.addObject("userInfo", userInfo);
		mav.addObject("sdate",sdate);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/addApplicationfrom.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String addApplication(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("신청완료 테스트");
		return "/leader/companyLegisterList";
	}

	// 설문조사리스트
	@RequestMapping(value = "/surveylist.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView surveylist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SurveyVO> surverList = leaderService.SurveyList();
		mav.addObject("surverList", surverList);

		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 설문조사등록폼으로이동
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.GET)
	public ModelAndView addSurveryFrom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 설문조사등록
	@RequestMapping(value = "/addsurveryfrom.do", method = RequestMethod.POST)
	public ModelAndView addSurvery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		String viewName = (String) request.getAttribute("viewName");
		List<String> qList = new ArrayList();
		Enumeration enu = request.getParameterNames();
		int empNO = leaderService.selectEmpno(request.getParameter("name"));
		String title = request.getParameter("title");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");

		leaderService.addSurvery(empNO, title, sDate, eDate);

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			if (name.substring(0, 3).equals("qno") && !value.equals("")) {
				qList.add(value);
			}
		}

		int svNO = leaderService.selectSvNO(title);
		for (String ql : qList) {
			System.out.println(ql);
			leaderService.addQuestion(ql, svNO);
		}
		mav.setViewName("redirect:/leader/surveylist.do");
		return mav;
	}

	// 설문조사상세
	@RequestMapping(value = "/surveyDetail.do", method = RequestMethod.GET)
	public ModelAndView surveyDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("svNO") int svNO) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		SurveyVO surveyDetail = leaderService.surveyDetail(svNO);
		List<SurveyVO> surveyinfo = leaderService.viewSurvey(svNO);
		mav.addObject("svNO", svNO);
		mav.addObject("surveyinfo", surveyinfo);
		mav.addObject("surveyDetail", surveyDetail);
		mav.setViewName(viewName);
		return mav;
	}

	// 설문문항등록
	@RequestMapping(value = "/surveyDetail.do", method = RequestMethod.POST)
	public ModelAndView addAnswer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		for (int i = 1;; i++) {
			try {
				String[] lang = request.getParameterValues("question" + i);
				if (lang[i - 1] != null) {
					System.out.println(lang[i - 1] + ", " + lang[i] + ", " + request.getParameter("userID"));
					leaderService.addAnswer(Integer.parseInt(lang[i - 1]), lang[i], request.getParameter("userID"));
				} else {
					mav.setViewName("redirect:/leader/surveylist.do");
					return mav;
				}

			} catch (NullPointerException e) {
				mav.setViewName("redirect:/leader/surveylist.do");
				return mav;
			}
		}
	}
}
