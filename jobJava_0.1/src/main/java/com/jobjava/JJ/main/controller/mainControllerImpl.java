package com.jobjava.JJ.main.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jobjava.JJ.main.service.MainService;
import com.jobjava.JJ.main.vo.Paging;
import com.jobjava.JJ.main.vo.SearchCriteria;

@Controller("mainController")
@RequestMapping(value="/main")
public class mainControllerImpl implements mainController{
	private static String CURR_FILE_REPO_PATH = "C:\\project\\file";
	@Autowired
	MainService mainservice;
	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView tomain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		mainservice.mnLog("메인페이지");
		List<HashMap<String,String>> fboard = mainservice.selectF_BoardTOP3();
		mav.addObject("fboard", fboard);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value="/bessinfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView bessinfoView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mainservice.mnLog("사업안내");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/alarmCenter.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public String alarmCenter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		mainservice.mnLog("알림마당");
		return "redirect:/board/qnATable.do";
	}

	@Override
	@RequestMapping(value="/bestCompany.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView bestCompany(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		List<HashMap<String,String>> bestCom = mainservice.selectBestCompany();
		mainservice.mnLog("기업홍보");
		
		mav.addObject("bestCom",bestCom);
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@ResponseBody
	@Override
	@RequestMapping(value="/insertBestCompany.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity insertBestCompany(@RequestParam("BC_NAME") String bc_name,
			@RequestParam("BC_HP") String bc_hp,
			@RequestParam("BC_FILENAME") MultipartFile files, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int bc_no = mainservice.insertBestCompany(files.getOriginalFilename(), bc_name,bc_hp);
		
		File Folder = new File(CURR_FILE_REPO_PATH + "\\" + "bestCom" + "\\" + bc_no);
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    File srcFile = new File(CURR_FILE_REPO_PATH+"\\"+"temp"+"\\"+files.getOriginalFilename());
			    files.transferTo(srcFile);
			    FileUtils.moveFileToDirectory(srcFile, Folder,true);
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	    }
		
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('등록이 완료되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('오류가 발생했습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	
	@ResponseBody
	@Override
	@RequestMapping(value="/deleteBestCompany.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity deleteBestCompany(@RequestParam("BC_NO")String bc_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		mainservice.deleteBestCompany(bc_no);
        File foder = new File(CURR_FILE_REPO_PATH + "\\" + "bestCom" + "\\" + bc_no);
        FileUtils.deleteDirectory(foder);
        
        
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('삭제가 완료되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('오류가 발생했습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	

	@ResponseBody
	@Override
	@RequestMapping(value="/updateBestCompany.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity updateBestCompany(@RequestParam HashMap<String,String> company,@RequestParam("BC_FILENAME") MultipartFile files,
			HttpServletRequest request,HttpServletResponse response) throws Exception{
		company.put("BC_FILENAME", files.getOriginalFilename());
		mainservice.updateBestCompany(company);
		
		if(files.getOriginalFilename() != null && files.getOriginalFilename() != "") {
			File Folder = new File(CURR_FILE_REPO_PATH + "\\" + "bestCom" + "\\" + company.get("BC_NO"));
			File modifiedFile = new File(CURR_FILE_REPO_PATH+"\\"+"temp"+"\\"+files.getOriginalFilename());
			File originalFile = new File(CURR_FILE_REPO_PATH + "\\" + "bestCom" + "\\" + company.get("BC_NO") + "\\" + company.get("originalFile"));
			files.transferTo(modifiedFile);
			originalFile.delete();
			FileUtils.moveFileToDirectory(modifiedFile, Folder,true);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    message  = "<script>";
		    message +=" alert('수정이 완료되었습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('오류가 발생했습니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/bestCompany.do?mnName=기업홍보';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	@Override
	@RequestMapping(value= "/supportTable.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView supportTable(SearchCriteria scri,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav=new ModelAndView();
		
		int boardListCnt = mainservice.boardListCnt(scri);

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(scri);
		paging.setTotalCount(boardListCnt);

		
		List<Map<String, Object>> list = mainservice.selectAllF_BOARD(scri);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping("/download.do")
	protected void download(@RequestParam("fileName") String REGI_FILENAME,@RequestParam("fileNO") String regiFileNO,
	                          @RequestParam("folderName") String folderName, HttpServletResponse response) throws Exception {
	      
	OutputStream out = response.getOutputStream();
	String filePath = CURR_FILE_REPO_PATH+"\\"+ folderName + "\\"+ regiFileNO +"\\"+REGI_FILENAME;
	File image = new File(filePath);

	response.setHeader("Cache-Control","no-cache");
	response.addHeader("Content-disposition", "attachment; fileName="+REGI_FILENAME);
	FileInputStream in=new FileInputStream(image); 
	byte[] buffer=new byte[1024*8];
	while(true){
		int count=in.read(buffer); //버퍼에 읽어들인 문자개수
	    if(count==-1)  //버퍼의 마지막에 도달했는지 체크
	    break;
	    out.write(buffer,0,count);
	}
	in.close();
	out.close();
	}

}
