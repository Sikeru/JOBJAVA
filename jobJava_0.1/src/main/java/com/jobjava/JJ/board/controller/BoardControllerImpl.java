package com.jobjava.JJ.board.controller;

import java.io.File;
import java.security.Principal;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.service.BoardService;
import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
import com.jobjava.JJ.board.vo.QnAVO;
import com.jobjava.JJ.cafe.vo.FileVO;
import com.jobjava.JJ.main.service.MainService;


@Controller("BoardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController{
	private static String CURR_FILE_REPO_PATH = "C:\\project\\file";
	@Autowired
	BoardService boardservice;
	@Autowired
	MainService mainservice;

	@Override
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		{
			String viewName = (String)request.getAttribute("viewName");

			ModelAndView mav = new ModelAndView(viewName);

			return mav;
		}
	}

	@Override
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	@RequestMapping(value="/qnATable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnATable(@RequestParam HashMap<String, Integer> paging,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		mainservice.mnLog("질의응답");
		if(paging.isEmpty()) {
			paging.put("section", 1);
			paging.put("pageNum", 1);
		}
		
		List<QnAVO> qnavo = boardservice.qnaSelectAll(paging);
		int qnaTotalTable = boardservice.qnaTotalTable();
		mav.addObject("qnaTotal", qnaTotalTable);
		mav.addObject("qna", qnavo);
		mav.addObject("paging", paging);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/qnAAddTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnAAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/qnAAddTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String qnAAddTable(@ModelAttribute("QnAVO") QnAVO _qnAVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardservice.insertQnATable(_qnAVO);
		return "redirect:/board/qnATable.do";
	}
	
	@RequestMapping(value="/qnATableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView qnATableView(@RequestParam("QNA_NO") int _QNA_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		QnAVO qnavo = boardservice.qnaSelectOne(_QNA_NO);
		mav.addObject("qna", qnavo);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/qnAUpDateTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity qnAUpDateTable(@ModelAttribute("QnAVO") QnAVO _qnAVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardservice.upDateQnATable(_qnAVO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATableView.do?QNA_NO="+_qnAVO.getQNA_NO()+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATableView.do?QNA_NO='"+_qnAVO.getQNA_NO()+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/searchQNATable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchQNATable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		if(search.get("section") == null && search.get("pageNum") == null) {
			search.put("section", 1);
			search.put("pageNum", 1);
		}
		
		HashMap<String, Integer> paging = new HashMap<String, Integer>();
		List<QnAVO> qnavo = boardservice.qnaSelectSearch(search);
		int	qnaTotalTable = boardservice.qnaSelectTotalSearch(search);
		
		paging.put("section", Integer.parseInt(String.valueOf(search.get("section"))));
		paging.put("pageNum", Integer.parseInt(String.valueOf(search.get("pageNum"))));
		mav.addObject("qnaTotal", qnaTotalTable);
		mav.addObject("qna", qnavo);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		
		mav.setViewName("/board/qnATable");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/qnADeleteTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity qnADeleteTable(@RequestParam("QNA_NO") int _QNA_NO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardservice.qnADeleteTable(_QNA_NO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('삭제을 마쳤습니다. QNA페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATable.do;'";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/qnATable.do;'";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/onlineConTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView onlineConTable(@RequestParam HashMap<String, Integer> paging, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		mainservice.mnLog("온라인상담");
		if(paging.isEmpty()) {
			paging.put("section", 1);
			paging.put("pageNum", 1);
		}
		
		List<OnlineVO> onlinevo = boardservice.onlineSelectAll(paging);
		int onlineTotalTable = boardservice.onlineTotalTable();
		mav.addObject("onlineTotal", onlineTotalTable);
		mav.addObject("online", onlinevo);
		mav.addObject("paging", paging);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/onlineAddTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView onlineAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value="/onlineAddTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String onlineAddTable(@ModelAttribute("OnlineVO") OnlineVO _onlineVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		boardservice.insertOnlineTable(_onlineVO);
		return "redirect:/board/onlineConTable.do";
	}

	
	@Override
	@RequestMapping(value="/onlineTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView onlineTableView(@RequestParam("ON_COM_NO") int ON_COM_NO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav=new ModelAndView();
		OnlineVO onlinevo = boardservice.onlineSelectOne(ON_COM_NO);
		mav.addObject("online", onlinevo);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/onlineDeleteTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity onlineDeleteTable(@RequestParam("ON_COM_NO") int ON_COM_NO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		boardservice.onlineDeleteTable(ON_COM_NO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('삭제을 마쳤습니다. 온라인 상담 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/onlineTable.do;'";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/onlineTable.do;'";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/upDateonlineTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity upDateonlineTable(@ModelAttribute("OnlineVO") OnlineVO _onlineVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boardservice.upDateonlineTable(_onlineVO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/onlineTableView.do?ON_COM_NO="+_onlineVO.getON_COM_NO()+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/onlineTableView.do?ON_COM_NO='"+_onlineVO.getON_COM_NO()+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/searchOnlineTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchOnlineTable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		if(search.get("section") == null && search.get("pageNum") == null) {
			search.put("section", 1);
			search.put("pageNum", 1);
		}
		
		HashMap<String, Integer> paging = new HashMap<String, Integer>();
		List<OnlineVO> onlinevo = boardservice.onlineSelectSearch(search);
		int	onlineTotalTable = boardservice.onlineSelectTotalSearch(search);
		
		paging.put("section", Integer.parseInt(String.valueOf(search.get("section"))));
		paging.put("pageNum", Integer.parseInt(String.valueOf(search.get("pageNum"))));
		mav.addObject("onlineTotal", onlineTotalTable);
		mav.addObject("online", onlinevo);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		
		mav.setViewName("/board/onlineConTable");
		return mav;
		
	}

	@Override
	@RequestMapping(value="/employmentConTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView employmentConTable(HashMap<String, Integer> paging, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		mainservice.mnLog("취업상담");
		if(paging.isEmpty()) {
			paging.put("section", 1);
			paging.put("pageNum", 1);
		}
		
		List<EmploymentVO> employmentvo = boardservice.employmentSelectAll(paging);
		int employmentTotalTable = boardservice.employmentTotalTable();
		mav.addObject("employmentTotal", employmentTotalTable);
		mav.addObject("employment", employmentvo);
		mav.addObject("paging", paging);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/employmentTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView employmentTableView(@RequestParam("EMP_CON_NO") int _EMP_CON_NO ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		EmploymentVO employmentvo = boardservice.employmentSelectOne(_EMP_CON_NO);
		mav.addObject("employment", employmentvo);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/employmentAddTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView employmentAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/employmentDeleteTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity employmentDeleteTable(@RequestParam("EMP_CON_NO") int EMP_CON_NO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		boardservice.employmentDeleteTable(EMP_CON_NO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('삭제을 마쳤습니다. 온라인 상담 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/employmentConTable.do;'";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/employmentConTable.do;'";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/upDateEmploymentTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity upDateEmploymentTable(@ModelAttribute("EmploymentVO") EmploymentVO _employmentVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boardservice.upDateemploymentTable(_employmentVO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/employmentTableView.do?ON_COM_NO="+_employmentVO.getEMP_CON_NO()+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/employmentTableView.do?ON_COM_NO='"+_employmentVO.getEMP_CON_NO()+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/employmentAddTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String employmentAddTable(@ModelAttribute("EmploymentVO") EmploymentVO _employmentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardservice.insertEmploymentTable(_employmentVO);
		return "redirect:/board/employmentConTable.do";
	}
	
	
	@Override
	@RequestMapping(value="/searchEmploymentTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView searchEmploymentTable(@RequestParam HashMap<String, Object> search, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		if(search.get("section") == null && search.get("pageNum") == null) {
			search.put("section", 1);
			search.put("pageNum", 1);
		}
		
		HashMap<String, Integer> paging = new HashMap<String, Integer>();
		List<EmploymentVO> employmentvo = boardservice.employmentSelectSearch(search);
		int	employmentTotalTable = boardservice.employmentSelectTotalSearch(search);
		
		paging.put("section", Integer.parseInt(String.valueOf(search.get("section"))));
		paging.put("pageNum", Integer.parseInt(String.valueOf(search.get("pageNum"))));
		mav.addObject("employmentTotal", employmentTotalTable);
		mav.addObject("employment", employmentvo);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		
		mav.setViewName("/board/employmentConTable");
		return mav;
		
	}

	@Override
	@RequestMapping(value="/supportAddTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView supportAddTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	@Override
	@RequestMapping(value="/supportAddTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String supportAddTable(Principal principal,MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		articleMap.put("ID", principal.getName());
		
		List<String> fileName = upload(multipartRequest,articleMap);
		
		try {
			int BOARD_NO = boardservice.insertFileTable(fileName, articleMap);
			File destDir = new File(CURR_FILE_REPO_PATH + "\\support\\" + BOARD_NO);
			destDir.mkdir();
			if (fileName != null && fileName.size() != 0) {
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			
		}catch(Exception e) {
			if (fileName != null && fileName.size() != 0) {
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					srcFile.delete();
				}
			}
			return "redirect:/board/supportAddTableView.do";
		}
		
		
		return "redirect:/main/supportTable.do";
	}
	
	@Override
	@RequestMapping(value="/supportTableView.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView supportTableView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		try {
			String BOARD_NO = request.getParameter("BOARD_NO");
			HashMap<String, String> f_board = boardservice.selectOneFileTable(BOARD_NO);
			List<HashMap<String, String>> fileList = boardservice.selectFileNames(BOARD_NO);
			mav.addObject("fileList", fileList);
			mav.addObject("board", f_board);
			
			String viewName=(String)request.getAttribute("viewName");
			mav.setViewName(viewName);
		}catch(Exception e) {
			mav.setViewName("redirect:/main/supportTable.do");
		}
		return mav;
	}

	@Override
	@RequestMapping(value="/supportUpdateTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity supportUpdateTable(Principal principal, MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		articleMap.put("ID", principal.getName());
		
		List<String> fileName = upload(multipartRequest, articleMap);
		
		try {
			File destDir = new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("BOARD_NO"));
			boardservice.updateFileTable(articleMap);
			if(articleMap.get("delfile1") != null || articleMap.get("delfile2") != null || articleMap.get("delfile3") != null
					|| articleMap.get("delfile4") != null || articleMap.get("delfile5") != null) {
				for(int i=0; i<articleMap.size();i++) {
					if(articleMap.get("delfile"+i) != null && articleMap.get("delfile"+i) != "") {
						boardservice.deleteFile(articleMap);
						File delfile = new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("BOARD_NO") + "\\"+ articleMap.get("delfile"+i));
						delfile.delete();
					}
				}
			}
			
			
			if (fileName != null && fileName.size() != 0) {
				boardservice.updateTableFile(fileName, articleMap);
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			

		    message  = "<script>";
		    message +=" alert('수정을 마쳤습니다. 원래 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/board/supportTableView.do?BOARD_NO="+ articleMap.get("BOARD_NO")+"';";
		    message += " </script>";
		    
		}catch(Exception e) {
			if (fileName != null && fileName.size() != 0) {
				for (String filename : fileName) {
					File srcFile = new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + filename);
					srcFile.delete();
				}
			}
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/board/supportTableView.do?BOARD_NO='"+ articleMap.get("BOARD_NO")+"';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	

	@Override
	@RequestMapping(value="/supportDeleteTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity supportDeleteTable(@RequestParam("BOARD_NO") String BOARD_NO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		boardservice.deleteFileTable(BOARD_NO);
		File foder = new File(CURR_FILE_REPO_PATH + "\\support\\" + BOARD_NO);
        FileUtils.deleteDirectory(foder);
        
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('삭제을 마쳤습니다.  파일 게시판 페이지로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/supportTable.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/main/supportTable.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	private List<String> upload(MultipartHttpServletRequest multipartRequest, Map<String, Object> articleMap) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			int count = 1;
			
			if (originalFileName != "" && originalFileName != null) {
				for(String FN : fileList) {
					String result = originalFileName.substring(0,originalFileName.lastIndexOf("."));
					String fnTest = FN.substring(0,FN.lastIndexOf("."));
				
					if(fnTest.equals(result)) {
						if(result.contains("("+(count-1)+")")) {
						originalFileName = result.substring(0,originalFileName.lastIndexOf("("))+" ("+count+")" + originalFileName.substring(originalFileName.lastIndexOf("."));
						count++;
						}else {
							originalFileName = result+" ("+count+")" + originalFileName.substring(originalFileName.lastIndexOf("."));
							count++;
						}
					}
				}
			}
			
			if(new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("BOARD_NO") + "\\" + originalFileName).exists()
					&& originalFileName != ""){
				String result = originalFileName.substring(0,originalFileName.lastIndexOf("."));
				while(true) {
					originalFileName = result+" ("+count+")" + originalFileName.substring(originalFileName.lastIndexOf("."));
					if(!new File(CURR_FILE_REPO_PATH + "\\support\\" + articleMap.get("BOARD_NO") + "\\" + originalFileName).exists()) {
						break;
					}
					count++;
				}
			}
			
			if (originalFileName != "" && originalFileName != null) {
				fileList.add(originalFileName);
				File file = new File(CURR_FILE_REPO_PATH + "\\support" + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					mFile.transferTo(new File(CURR_FILE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); // 임시로
				}
			}
		}
		return fileList;
	}

}
	
