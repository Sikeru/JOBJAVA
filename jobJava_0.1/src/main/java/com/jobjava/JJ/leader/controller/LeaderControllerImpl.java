package com.jobjava.JJ.leader.controller;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

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
import com.jobjava.JJ.leader.vo.UniVO;
import com.jobjava.JJ.leader.vo.UserVO;

@Controller("LeaderController")
@RequestMapping(value = "/leader")
public class LeaderControllerImpl implements LeaderController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\project\\file";
	private static final String CURR_FILE_REPO_PATH = "C:\\project\\file";
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

	// 뉴리더 사업안내 페이지로 이동
	@Override
	@RequestMapping(value = "/bessinfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		leaderService.mnLog(request.getParameter("mnName"));
		mav.setViewName(viewName);
		return mav;
	}

	// 기업 등록 화면 호출
	@Override
	@RequestMapping(value = "/company.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView companyLegister(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		ModelAndView mav = new ModelAndView();
		String id = principal.getName();
		String viewName = (String) request.getAttribute("viewName");
		CRegVO list = leaderService.selectCompanyInfo(id);

		mav.addObject("list", list);
		mav.setViewName(viewName);

		return mav;
	}

	@Override
	// 기업 등록 insert
	@RequestMapping(value = "/legister.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity legister(MultipartHttpServletRequest multipartRequest, HttpServletResponse response,
			@RequestParam("UNI_B_NO") String uniBNO, Model model) throws Exception {
		// 사용자가 입력한 정보를 파라미터로 넘김

		multipartRequest.setCharacterEncoding("utf-8");
		String fILENAME = null;
		String uniBno = multipartRequest.getParameter("uniBNO");

		Map articleMap = new HashMap();

		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);

		}

		List<String> fileList = upload(multipartRequest, articleMap);
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
			String rEGI_NO = leaderService.addCompany(articleMap, fileList);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (FileVO fileVO : imageFileList) {
					fILENAME = fileVO.getREGI_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fILENAME);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\support\\" + rEGI_NO);

					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('신청이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/leader/companyLegisterList.do" + "';";
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
	private List<String> upload(MultipartHttpServletRequest multipartRequest, Map<String, Object> articleMap)
			throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			int count = 1;

			if (originalFileName != "" && originalFileName != null) {
				for (String FN : fileList) {
					String result = originalFileName.substring(0, originalFileName.lastIndexOf("."));
					String fnTest = FN.substring(0, FN.lastIndexOf("."));

					if (fnTest.equals(result)) {
						if (result.contains("(" + (count - 1) + ")")) {
							originalFileName = result.substring(0, originalFileName.lastIndexOf("(")) + " (" + count
									+ ")" + originalFileName.substring(originalFileName.lastIndexOf("."));
							count++;
						} else {
							originalFileName = result + " (" + count + ")"
									+ originalFileName.substring(originalFileName.lastIndexOf("."));
							count++;
						}
					}
				}
			}

			if (new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("REGI_NO") + "\\" + originalFileName)
					.exists() && originalFileName != "") {
				String result = originalFileName.substring(0, originalFileName.lastIndexOf("."));
				while (true) {
					originalFileName = result + " (" + count + ")"
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
					if (!new File(
							CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("REGI_NO") + "\\" + originalFileName)
									.exists()) {
						break;
					}
					count++;
				}
			}

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

	// 기업등록수정뷰 호출
	@Override
	@RequestMapping("/legisterUpdateView.do")
	public ModelAndView legisterUpdateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uniBNO") int uniBNO, Principal principal) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = principal.getName();
		String viewName = (String) request.getAttribute("viewName");

		CRegVO list = leaderService.selectCompany(id, uniBNO);
		List<Map<String, String>> fileName = leaderService.file(uniBNO);

		mav.addObject("list", list);
		mav.addObject("regiFile", fileName);

		mav.setViewName(viewName);
		return mav;
	}

	// 기업등록수정
	@Override
	@RequestMapping(value = "/legisterUpdate.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ResponseEntity legisterUpdate(CRegVO cRegVO, Principal principal,
			MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		leaderService.legisterUpdate(cRegVO);
		System.out.println(cRegVO);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		articleMap.put("ID", principal.getName());
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		List<String> fileName = upload(multipartRequest, articleMap);

		try {
			File destDir = new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("REGI_NO"));
			if (articleMap.get("delfile1") != null) {
				leaderService.legisterFileDel(articleMap);
				for (int i = 0; i < articleMap.size(); i++) {
					if (articleMap.get("delfile" + i) != null && articleMap.get("delfile" + i) != "") {
						leaderService.legisterFileDel(articleMap);
						File delfile = new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("REGI_NO") + "\\"
								+ articleMap.get("delfile" + i));
						delfile.delete();
					}
				}
			}

			if (fileName != null && fileName.size() != 0) {
				leaderService.legisterFileUpdate(fileName, articleMap);
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
			message += " location.href='" + request.getContextPath() + "/leader/legisterUpdateView.do?uniBNO="
					+ articleMap.get("UNI_B_NO") + "';";
			message += " </script>";

		} catch (Exception e) {
			if (fileName != null && fileName.size() != 0) {
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += " alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + request.getContextPath() + "/leader/legisterUpdateView.do?uniBNO='"
					+ articleMap.get("UNI_B_NO") + "';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	// 기업등록삭제
	@Override
	@RequestMapping(value = "/legisterDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String legisterDelete(int REGI_NO) {
		leaderService.legisterDelete(REGI_NO);
		System.out.println(REGI_NO);

		return "redirect:/leader/companyLegisterList.do";
	}

	@Override
	// //대학사업 목록 페이지 호출
	@RequestMapping(value = "/companyLegisterList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response, Principal principal) throws Exception {
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

		// 신청여부 확인하기
		try {
			String userID = principal.getName();
			List<Integer> appCheck = leaderService.appCheck(userID);
			List<Integer> appCheckCom = leaderService.appCheckCom(userID);
			mav.addObject("appCheck", appCheck);
			mav.addObject("appCheckCom", appCheckCom);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);

			return mav;
		} catch (NullPointerException e) {
			mav.addObject("appCheck", null);
			mav.addObject("appCheckCom", null);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);

			return mav;
		}
	}

	// 사업신청 참여학생 목록 호출
	@RequestMapping(value = "/companyLegisterStuList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView legisterStuList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response, Principal principal) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		// 전체 글 개수
		int boardListStuCnt = leaderService.boardListStuCnt(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListStuCnt);

		List<Map<String, Object>> list = leaderService.boardListStu(scri);
		// 한페이지당 보여줄 게시물 갯수

		// 신청여부 확인하기
		try {
			String userID = principal.getName();
			List<Integer> appCheckCom = leaderService.appCheckCom(userID);
			mav.addObject("appCheckCom", appCheckCom);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);

			return mav;
		} catch (NullPointerException e) {
			mav.addObject("appCheckCom", null);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);

			return mav;
		}
	}

	// 사업참여학생 참여를 기업이 승인(승인여부등록)
	@RequestMapping(value = "/studentApprove.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String studentApprove(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uniBNO") int uniBNO, Principal principal) throws Exception {
		leaderService.updatePermission(uniBNO);
		return "redirect:/leader/companyLegisterStuList.do";
	}

	// 사업참여학생 참여를 기업이 취소(승인여부취소)
	@RequestMapping(value = "/studentApproveDel.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String studentApproveDel(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uniBNO") int uniBNO, Principal principal) throws Exception {
		leaderService.updatePermissionDel(uniBNO);
		return "redirect:/leader/companyLegisterStuList.do";
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
			@RequestParam("uniBNO") int uniBNO, Principal principal) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String userID = principal.getName();
		UniVO uniInfo = leaderService.bName(uniBNO);
		UserVO userInfo = leaderService.userInfo(userID);

		mav.addObject("uniBNO", uniBNO);
		mav.addObject("userID", userID);
		mav.addObject("uniInfo", uniInfo);
		mav.addObject("userInfo", userInfo);
		mav.setViewName(viewName);
		return mav;
	}

	// 사업신청 상세창&수정, 삭제창
	@RequestMapping(value = "/appDetail.do", method = RequestMethod.GET)
	public ModelAndView appDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("uniBNO") int uniBNO, Principal principal) {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String userID = principal.getName();

		UniVO uniInfo = leaderService.bName(uniBNO);
		UserVO userInfo = leaderService.userInfo(userID);
		AppVO appInfo = leaderService.appInfo(userID, uniBNO);

		mav.addObject("uniBNO", uniBNO);
		mav.addObject("userID", userID);
		mav.addObject("appInfo", appInfo);
		mav.addObject("uniInfo", uniInfo);
		mav.addObject("userInfo", userInfo);
		mav.setViewName(viewName);
		return mav;
	}

	// 사업신청 학생 수정 update
	@RequestMapping(value = "/appUpdate.do", method = RequestMethod.POST)
	public String updateApp(HttpServletRequest request, Principal principal, @RequestParam("uniBNO") int uniBNO) {
		String userID = principal.getName();
		String hopeJob = request.getParameter("hopeJob");
		String reason = request.getParameter("reason");

		if (hopeJob != null) {
			leaderService.modStuApp(hopeJob, reason, uniBNO, userID);
		}
		return "redirect:/leader/appDetail.do?uniBNO=" + uniBNO;
	}

	// 학생사업신청취소
	@RequestMapping(value = "/appDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String delApplicateion(Principal principal, @RequestParam("uniBNO") int uniBNO) {
		String userID = principal.getName();
		leaderService.delStuApp(uniBNO, userID);

		return "redirect:/leader/companyLegisterList.do";
	}

	@RequestMapping(value = "/addApplicationfrom.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String addApplication(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("hopeJob") String hopeJob, @RequestParam("reason") String reason,
			@RequestParam("userID") String userID, @RequestParam("uniBNO") int uniBNO) throws Exception {
		leaderService.addApplication(userID, uniBNO, hopeJob, reason);
		return "redirect:/leader/companyLegisterList.do";
	}

	// 설문조사리스트
	@RequestMapping(value = "/surveylist.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView surveylist(HttpServletRequest request, HttpServletResponse response, SearchCriteria scri,
			Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SurveyVO> surverList = leaderService.SurveyList(scri);
		mav.addObject("surverList", surverList);

		String viewName = (String) request.getAttribute("viewName");

		// 전체 글 개수
		int surverListCnt = leaderService.SurveyListcnt();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(surverListCnt);

//				List<Map<String, Object>> list = leaderService.viewCommuteList(userID);
		// 한페이지당 보여줄 게시물 갯수

//				model.addAttribute("list", list);
		model.addAttribute("paging", paging);
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

		char tmp;

		for (int i = 1;; i++) {
			try {
				String[] lang = request.getParameterValues("question" + i);
				if (lang[0] != null) {
					for (int j = 1; j < 6; j++) {
						for (int k = 0; k < lang[j].length(); k++) {
							tmp = lang[j].charAt(k);
							if (!('0' <= tmp && tmp <= '9')) {
								leaderService.addAnswer(Integer.parseInt(lang[0]), lang[j],
										request.getParameter("userID"));
								break;
							}
						}

					}
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

	// 출퇴근 조회
	@RequestMapping(value = "/commuteCheck.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView commuteCheckView(Model model, SearchCriteria scri, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String userID = principal.getName();
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		String toDate = dateFormat.format(new Date());

		int checkATT = leaderService.searchATT(toDate, userID);
		int checkQUT = leaderService.searchQUT(toDate, userID);
		String checkMac = leaderService.checkMac(userID);

		mav.addObject("checkMac", checkMac);
		mav.addObject("sdate", sdate);
		mav.addObject("edate", edate);

		if (checkATT != 0) {
			mav.addObject("checkATT", checkATT);
		}
		if (checkQUT != 0) {
			mav.addObject("checkQUT", checkQUT);
		}

		if ((sdate == null || sdate.equals("")) || (edate == null || edate.equals(""))) {
			List<Map<String, Object>> commuteList = leaderService.viewCommuteList(scri, userID);
			mav.addObject("commuteList", commuteList);
		} else {
			List<Map<String, Object>> commuteList = leaderService.dateSearchCommute(userID, sdate, edate);
			mav.addObject("commuteList", commuteList);
		}

		// 전체 글 개수
		int commuteListCnt = leaderService.commuteListCnt(userID);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(commuteListCnt);

//		List<Map<String, Object>> list = leaderService.viewCommuteList(userID);
		// 한페이지당 보여줄 게시물 갯수

//		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/addCommute.do", method = RequestMethod.POST)
	public String addCommute(HttpServletRequest request, HttpServletResponse response, Principal principal,
			SearchCriteria scri) {
		String userID = principal.getName();
		String commutebtn = request.getParameter("commutebtn");
		SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		String toDate = dateFormat.format(new Date());
		String toDateTime = dateTimeFormat.format(new Date());

		if (commutebtn.equals("출근")) {
			leaderService.goToWork(userID, toDate, toDateTime);
		} else {
			leaderService.leaveWork(userID, toDate, toDateTime);
		}
		return "redirect:/leader/commuteCheck.do";
	}

	// 업무일지조회
	@RequestMapping(value = "/viewJournal.do", method = RequestMethod.GET)
	public ModelAndView viewJournal(HttpServletRequest request, HttpServletResponse response, Principal principal,
			Model model, SearchCriteria scri) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		String userID = principal.getName();
		mav.setViewName(viewName);
		List<Map<String, Object>> JournalList = leaderService.viewJournal(userID, scri);
		mav.addObject("JournalList", JournalList);

		// 전체 글 개수
		int commuteListCnt = leaderService.viewJournalCnt(userID);
//
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(commuteListCnt);


		model.addAttribute("paging", paging);
		return mav;
	}

	// 업무일지등록폼이동
	@RequestMapping(value = "/addJournal.do", method = RequestMethod.GET)
	public ModelAndView addJournalForm(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 업무일지등록
	@RequestMapping(value = "/addJournal.do", method = RequestMethod.POST)
	public String addJournal(Principal principal, @RequestParam("title") String title,
			@RequestParam("content") String content) {
		String userID = principal.getName();
		leaderService.addJournal(userID, title, content);
		return "redirect:/leader/viewJournal.do";
	}

	// 업무일지상세
	@RequestMapping(value = "/journalDetail.do", method = RequestMethod.GET)
	public ModelAndView journalDetail(HttpServletRequest request, HttpServletResponse response, Principal principal,
			@RequestParam("jnNO") int jnNO) {
		ModelAndView mav = new ModelAndView();
		String userID = principal.getName();
		String viewName = (String) request.getAttribute("viewName");

		mav.setViewName(viewName);
		mav.addObject("usreID", userID);

		Map<String, Object> journalDetailList = leaderService.journalDetail(jnNO);
		mav.addObject("journalDetailList", journalDetailList);
		return mav;
	}

	// 업무일지수정
	@RequestMapping(value = "/journalUpdate.do", method = RequestMethod.POST)
	public String journalUpdate(Principal principal, @RequestParam("title") String title,
			@RequestParam("content") String content, @RequestParam("jnNO") int jnNO) {
		String userID = principal.getName();
		leaderService.modJournal(userID, title, content, jnNO);
		return "redirect:/leader/journalDetail.do?jnNO=" + jnNO;
	}

	// 업무일지삭제
	@RequestMapping(value = "/journalDelete.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String deljournal(Principal principal, @RequestParam("jnNO") int jnNO) {
		String userID = principal.getName();
		leaderService.deljournal(jnNO, userID);

		return "redirect:/leader/viewJournal.do";
	}
}
