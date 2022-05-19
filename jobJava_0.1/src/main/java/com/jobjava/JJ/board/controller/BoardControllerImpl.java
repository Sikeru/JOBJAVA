package com.jobjava.JJ.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.board.service.BoardService;
import com.jobjava.JJ.board.vo.EmploymentVO;
import com.jobjava.JJ.board.vo.OnlineVO;
import com.jobjava.JJ.board.vo.QnAVO;


@Controller("BoardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController{
	@Autowired
	BoardService boardservice;

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

}
	
