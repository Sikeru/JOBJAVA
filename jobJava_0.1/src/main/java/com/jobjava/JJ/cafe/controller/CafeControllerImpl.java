package com.jobjava.JJ.cafe.controller;

import java.io.File;
import java.security.Principal;
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
import org.springframework.security.core.context.SecurityContextHolder;
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
import com.jobjava.JJ.cafe.vo.ApplyVO;
import com.jobjava.JJ.cafe.vo.EmpVO;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.cafe.vo.JobAppVO;
import com.jobjava.JJ.cafe.vo.JobFileVO;
import com.jobjava.JJ.cafe.vo.JobInfoVO;
import com.jobjava.JJ.cafe.vo.Paging;
import com.jobjava.JJ.cafe.vo.ProgramVO;
import com.jobjava.JJ.cafe.vo.SearchCriteria;
import com.jobjava.JJ.cafe.vo.ShopBasketVO;

@Controller("CafeController")
@RequestMapping(value = "/cafe")
public class CafeControllerImpl implements CafeController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\project\\file";
	@Autowired
	private CafeService cafeService;

	// 메인
	@RequestMapping(value = "/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView cafeMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}

	// 구직신청창 호출
	@RequestMapping("/jobapp.do")
	public String jobapp(Model model) {
		return "/cafe/jobapp";
	}

	// 구직신청결과
	@Override
	@RequestMapping(value = "/jobresult.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ResponseEntity addNewArticle2(JobAppVO jobappVO, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {

		multipartRequest.setCharacterEncoding("utf-8");

		String fILENAME = null;

		Map articleMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		List<String> fileList = upload2(multipartRequest, articleMap);
		List<JobFileVO> imageFileList = new ArrayList<JobFileVO>();

		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				JobFileVO jobfilVO = new JobFileVO();
				jobfilVO.setJA_FILENAME(fileName);
				imageFileList.add(jobfilVO);
			}
			articleMap.put("imageFileList", imageFileList);
		}

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		response.setCharacterEncoding("UTF-8");
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {

			int jOB_APP_NO = cafeService.JobaddResult(articleMap);

			if (imageFileList != null && imageFileList.size() != 0) {

				for (JobFileVO jobfilVO : imageFileList) {
					fILENAME = jobfilVO.getJA_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "job" + "\\" + "temp" + "\\" + fILENAME);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "job" + "\\" + articleMap.get("JOB_APP_NO"));

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
				for (JobFileVO jobfilVO : imageFileList) {
					fILENAME = jobfilVO.getJA_FILENAME();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "job" + "\\" + "temp" + "\\" + fILENAME);
					srcFile.delete();
				}
			}

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 한번 확인부탁드립니다.');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 업로드
	private List<String> upload2(MultipartHttpServletRequest multipartRequest, Map articleMap) throws Exception {
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

			if (new File(CURR_IMAGE_REPO_PATH + "\\job\\" + articleMap.get("JOB_APP_NO") + "\\" + originalFileName)
					.exists() && originalFileName != "") {
				String result = originalFileName.substring(0, originalFileName.lastIndexOf("."));
				while (true) {
					originalFileName = result + " (" + count + ")"
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
					if (!new File(
							CURR_IMAGE_REPO_PATH + "\\job\\" + articleMap.get("JOB_APP_NO") + "\\" + originalFileName)
									.exists()) {
						break;
					}
					count++;
				}
			}

			if (originalFileName != "" && originalFileName != null) {

				fileList.add(originalFileName);
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "job" + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) { 
						file.getParentFile().mkdirs(); 

						mFile.transferTo(new File(
								CURR_IMAGE_REPO_PATH + "\\" + "job" + "\\" + "temp" + "\\" + originalFileName));

					}
				}
			}

		}
		return fileList;
	}

	// 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage(Model model) {
		return "/cafe/mypage";
	}

	// 학생프로그램신청서
	@RequestMapping(value = "/apply.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView apply(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("PROGRAM_NO") String PROGRAM_NO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		ProgramVO detail = cafeService.selectProgram(PROGRAM_NO);
		mav.addObject("detail", detail);

		mav.setViewName(viewName);
		return mav;
	}

	// 신청결과창
	@RequestMapping("/applyresult.do")
	public String jobAppresult(@ModelAttribute("ApplyVO") ApplyVO _applyVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		cafeService.apply(_applyVO);

		return "/cafe/main";

	}

	
	
	// 다중파일있는 글작성창
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

		List<String> fileList = upload(multipartRequest, articleMap);
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
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + "temp" + "\\" + fILENAME);
					File destDir = new File(
							CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + articleMap.get("PROGRAM_NO"));

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
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + "temp" + "\\" + fILENAME);
					srcFile.delete();
				}

			}

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 한번 확인해 주세요.');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/mypage.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}
		return resEnt;
	}

	// 업로드
	private List<String> upload(MultipartHttpServletRequest multipartRequest, Map articleMap) throws Exception {
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

			if (new File(CURR_IMAGE_REPO_PATH + "\\program\\" + articleMap.get("PROGRAM_NO") + "\\" + originalFileName)
					.exists() && originalFileName != "") {
				String result = originalFileName.substring(0, originalFileName.lastIndexOf("."));
				while (true) {
					originalFileName = result + " (" + count + ")"
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
					if (!new File(CURR_IMAGE_REPO_PATH + "\\program\\" + articleMap.get("PROGRAM_NO") + "\\"
							+ originalFileName).exists()) {
						break;
					}
					count++;
				}
			}

			if (originalFileName != "" && originalFileName != null) {

				fileList.add(originalFileName);
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) { 
						file.getParentFile().mkdirs(); 

						mFile.transferTo(new File(
								CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + "temp" + "\\" + originalFileName)); 
						
					}
				}
			}

		}
		return fileList;
	}

	
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

	// 페이징

	@RequestMapping(value = "/hireinfopaging.do")
	public ModelAndView boardList(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		// �쟾泥� 湲� 媛쒖닔
		int boardListCnt = cafeService.boardListCnt(scri);
		System.out.println(boardListCnt);

		// �럹�씠吏� 媛앹껜
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		List<Map<String, Object>> list = cafeService.boardList(scri);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		return mav;
	}

	// 프고그램목록상세뷰
	@RequestMapping(value = "/hireInfoDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView hireInfoDetail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("PROGRAM_NO") String PROGRAM_NO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		ProgramVO detail = cafeService.selectProgram(PROGRAM_NO);
		List<Map<String, String>> fileName = cafeService.file(PROGRAM_NO);
		System.out.println(fileName);
		List<String> fileNO = cafeService.selectFileNO(PROGRAM_NO);

		mav.addObject("detail", detail);
		mav.addObject("empFile", fileName);
		mav.addObject("empFileNO", fileNO);
		mav.setViewName(viewName);
		return mav;
	}

	// 프로그램목록 수정뷰호출
	@Override
	@RequestMapping("/updateView.do")
	public ModelAndView updateView(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("PROGRAM_NO") String PROGRAM_NO) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		ProgramVO update = cafeService.selectProgram(PROGRAM_NO);
		List<Map<String, String>> fileName = cafeService.file(PROGRAM_NO);

		System.out.println(fileName);
		mav.addObject("empFile", fileName);
		mav.addObject("update", update);
		mav.setViewName(viewName);
		return mav;
	}

	// 프로그램목록 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseEntity proupdate(ProgramVO programVO, MultipartHttpServletRequest multipartRequest,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("1" + programVO.getPROGRAM_NO());
		cafeService.proupdate(programVO);

		multipartRequest.setCharacterEncoding("utf-8");
		int pROGRAM_NO = programVO.getPROGRAM_NO();

		Map articleMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		String fILENAME = null;
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);

		}
		try {
			List<String> fileName = upload(multipartRequest, articleMap);
			List<FileVO> imageFileList = new ArrayList<FileVO>();

			if (fileName != null && fileName.size() != 0) {
				for (String fileName1 : fileName) {
					FileVO fileVO = new FileVO();
					fileVO.setEMP_FILENAME(fileName1);
					imageFileList.add(fileVO);
				}
			}

			articleMap.put("imageFileList", imageFileList);

			File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + articleMap.get("PROGRAM_NO"));
			if (articleMap.get("delete1") != null) {
				cafeService.updatefile(articleMap);
				for (int i = 0; i < articleMap.size(); i++) {
					if (articleMap.get("delete" + i) != null && articleMap.get("delete" + i) != "") {
						cafeService.deletefile(articleMap);
						File delete = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\"
								+ articleMap.get("PROGRAM_NO") + "\\" + articleMap.get("delete" + i));
						delete.delete();
					}
				}
			}
			articleMap.put("PROGRAM_NO", pROGRAM_NO);
			System.out.println(fileName);
			if (fileName != null && fileName.size() != 0) {
				cafeService.updatefile2(articleMap);
				for (String filename : fileName) {

					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + "program" + "\\" + "\\temp\\" + filename);
					FileUtils.moveFileToDirectory(destDir, srcFile, true);
				}
			}

			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/cafe/hireInfoDetail.do?PROGRAM_NO="
					+ articleMap.get("PROGRAM_NO") + "';";
			message += " </script>";

		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 한번 확인해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/cafe/hireInfoDetail.do?PROGRAM_NO="
					+ articleMap.get("PROGRAM_NO") + "';";
			message += " </script>";
			e.printStackTrace();
		}
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEnt;

	}

	// 프로그램목록 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ProgramVO programVO) throws Exception {
		System.out.println("delete");
		cafeService.prodelete(programVO.getPROGRAM_NO());

		return "redirect:/cafe/hireinfopaging.do?PROGRAM_NO=" + programVO.getPROGRAM_NO();
	}

	//캘린더
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

	// 특강4개씩 보여주기

	@RequestMapping(value = "/lecture.do")
	public ModelAndView joblecture(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		
		int boardListCnt3 = cafeService.boardListCnt3(scri);
		System.out.println(boardListCnt3);

		
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt3);

		List<Map<String, Object>> list3 = cafeService.boardList3(scri);
		System.out.println(list3);
		model.addAttribute("list3", list3);
		model.addAttribute("paging", paging);
		return mav;
	}

	// 컨설팅4개씩 보여주기

	@RequestMapping(value = "/consulting.do")
	public ModelAndView jobconsulting(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);

		
		int boardListCnt2 = cafeService.boardListCnt2(scri);
		System.out.println(boardListCnt2);

		
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt2);

		List<Map<String, Object>> list2 = cafeService.boardList2(scri);
		System.out.println(list2);
		model.addAttribute("list2", list2);
		model.addAttribute("paging", paging);
		return mav;
	}

	//채용정보

	@RequestMapping(value = "/jobposting.do")
	public ModelAndView jobposting(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response, Principal principal) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		List<Integer> JOB_NO = cafeService.bascketList();
		mav.addObject("JOB_NO", JOB_NO);

		// System.out.println(viewName);

		
		int postingListCnt = cafeService.postingListCnt(scri);
		// System.out.println(postingListCnt);

		
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(postingListCnt);

		List<Map<String, String>> list = cafeService.postingList(scri);
		System.out.println(list.toString());

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

	// 채용정보상세뷰
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

	// 채용정보수정
	@RequestMapping(value = "/jobpostingupdate.do", method = RequestMethod.POST)
	public String jobpostingupdate(JobInfoVO jobinfoVO) throws Exception {
		System.out.println(jobinfoVO.getJOB_NO());
		cafeService.jobpostingupdate(jobinfoVO);

		return "redirect:/cafe/jobpostingdetail.do?JOB_NO=" + jobinfoVO.getJOB_NO();
	}

	// 채용정보수정뷰
	@RequestMapping(value = "/jobPostingUpdateView.do", method = RequestMethod.GET)
	public String jobPostingUpdateView(JobInfoVO jobinfoVO, Model model) throws Exception {
		model.addAttribute("update", jobinfoVO);
		return "jobPostingUpdateView";
	}

	// 채용정보삭제
	@RequestMapping(value = "/jobPostingDelete.do", method = RequestMethod.POST)
	public String jobPostingDelete(JobInfoVO jobinfoVO) throws Exception {
		cafeService.jobPostingDelete(jobinfoVO.getJOB_NO());

		return "redirect:/cafe/jobposting.do?JOB_NO=" + jobinfoVO.getJOB_NO();
	}

	//채용정보장바구니
	@RequestMapping(value = "/jobPostingInCart.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String jobPostingInCart(@RequestParam("JOB_NO") int JOB_NO, HttpServletRequest request,
			HttpServletResponse response, JobInfoVO JobInfoVO, ShopBasketVO ShopBasketVO, EmpVO EmpVO)
			throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String ID = (String) principal;

		ShopBasketVO.setID(ID); 
		cafeService.selectJobPostingInCart(ShopBasketVO);
		return "jobPostingInCart";
	}

	// 채용정보장바구니
	@RequestMapping("/jobPostingInsertInCart.do")
	public String jobPostingInsertInCart(@RequestParam("JOB_NO") int JOB_NO, ShopBasketVO ShopBasketVO, EmpVO EmpVO,
			HttpServletRequest request, HttpServletResponse response, Principal principal) throws Exception {

		String ID = principal.getName();
		System.out.println(JOB_NO);
		System.out.println(ID);
		ShopBasketVO.setJOB_NO(JOB_NO);
		ShopBasketVO.setID(ID); 
		int EMP_NO = cafeService.empnoid(ID);
		ShopBasketVO.setEMP_NO(EMP_NO);

		cafeService.jobPostingInsertInCart(ShopBasketVO);
		return "redirect:/cafe/jobposting.do";

	}
	//채용정보리스트

	@RequestMapping(value = "/jobPostingInCartList.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView jobPostingInCartList(SearchCriteria scri, Model model, HttpServletRequest request,
			ShopBasketVO ShopBasketVO, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		System.out.println(viewName);
		List<ShopBasketVO> list = cafeService.jobPostingInCartList(); 
		mav.addObject("list", list); 
		return mav;
	}

	// 채용정보삭제
	@RequestMapping(value = "/jobPostingInCartDelete.do", method = RequestMethod.GET)
	public String jobPostingInCartDelete(JobInfoVO jobinfoVO, ShopBasketVO ShopBasketVO, EmpVO EmpVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		cafeService.jobPostingInCartDelete(ShopBasketVO.getJOB_NO());
		return "redirect:/cafe/jobposting.do";
	}

	@Override
	public String delete(int PROGRAM_NO, FileVO programVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String apply(ApplyVO applyVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String applyresult(ApplyVO applyVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 사업소개
	@RequestMapping(value = "/cafeBusinessGuide.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView cafeBusinessGuide(SearchCriteria scri, Model model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}
	
	// 기업마이페이지 리스트

		@RequestMapping(value = "/companymypagelist.do", method = { RequestMethod.POST, RequestMethod.GET })
		public ModelAndView companymypagelist(SearchCriteria scri, Model model, HttpServletRequest request,
				ProgramVO ProgramVO, Principal principal, HttpServletResponse response) throws Exception {
			String user_id = principal.getName();
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			System.out.println(viewName);
			List<ProgramVO> companymypagelist = cafeService.companymypagelist(user_id);
			mav.addObject("companymypagelist", companymypagelist);
			
			return mav;
		}

			
		// 기업마이페이지 상태수정
		@RequestMapping("/companymypageupdate.do")
		public String companymypageupdate(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String APP = request.getParameter("APP");
			String EMP_PAR_NO = request.getParameter("EMP_PAR_NO");
			System.out.println(APP + "," + EMP_PAR_NO);

			cafeService.companymypageupdate(APP, EMP_PAR_NO);
			return "redirect:/cafe/companymypagelist.do";
		}


		// 학생마이페이지 리스트

			@RequestMapping(value = "/studentmypagelist.do", method = { RequestMethod.POST, RequestMethod.GET })
			public ModelAndView studentmypagelist(SearchCriteria scri, Model model, HttpServletRequest request,
					ProgramVO ProgramVO, Principal principal, HttpServletResponse response) throws Exception {
				String user_id = principal.getName();
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				System.out.println(viewName);
				List<ProgramVO> studentmypagelist = cafeService.studentmypagelist(user_id);
				mav.addObject("studentmypagelist", studentmypagelist);
				return mav;
			}
			
		// 학생마이페이지 상세창
			@RequestMapping(value = "/studentmypageview.do", method = { RequestMethod.POST, RequestMethod.GET })
			public ModelAndView studentmypageview(HttpServletRequest request, HttpServletResponse response,
				@RequestParam("PROGRAM_NO") String PROGRAM_NO, String EMP_PAR_NO) throws Exception {
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				ProgramVO detail = cafeService.selectProgram2(PROGRAM_NO);
				
				List<Map<String, String>> fileName = cafeService.file(PROGRAM_NO);
				System.out.println(fileName);
				List<String> fileNO = cafeService.selectFileNO(PROGRAM_NO);

				mav.addObject("detail", detail);
				
				mav.addObject("empFile", fileName);
				mav.addObject("empFileNO", fileNO);
				mav.setViewName(viewName);
				return mav;
			}

			@Override
			public ModelAndView studentmypagelist(Model model, HttpServletRequest request, HttpServletResponse response)
					throws Exception {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public ModelAndView companymypagelist(SearchCriteria scri, Model model, HttpServletRequest request,
					HttpServletResponse response, Principal principal) throws Exception {
				// TODO Auto-generated method stub
				return null;
			}


	
	

}
