package com.jobjava.JJ.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jobjava.JJ.cafe.service.CafeService;

import net.coobird.thumbnailator.Thumbnails;


@Controller("DownController")
public class FileCafeProgramDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\project\\file";
	
	@Autowired
	CafeService cafeService;
	
	@RequestMapping("/Cafedownload.do")//변경
	protected void download(@RequestParam("fileName") String EMP_FILENAME,@RequestParam("fileNO") String EMP_FILE,
			 HttpServletResponse response, HttpServletRequest request) throws Exception {
try {
			
			System.out.println("다운1"); 
			String originFileName = null;
			originFileName = URLDecoder.decode(EMP_FILENAME, "UTF-8");
            String onlyFileName = originFileName.substring(originFileName.lastIndexOf("_") + 1);
            
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+EMP_FILE +"\\"+EMP_FILENAME;
		File file=new File(filePath);
		
		 System.out.println("파일: "+file);
		 if(file.exists()) {
             String agent = request.getHeader("User-Agent");

             //브라우저 한글
             if(agent.contains("Trident"))//Internet Explore
                 onlyFileName = URLEncoder.encode(onlyFileName, "UTF-8").replaceAll("\\+", " ");
                 
             else if(agent.contains("Edge")) //Micro Edge
                 onlyFileName = URLEncoder.encode(onlyFileName, "UTF-8");
                 
             else //Chrome
                 onlyFileName = new String(onlyFileName.getBytes("UTF-8"), "ISO-8859-1");
             //브라우저 한글

             response.setHeader("Content-Type", "application/octet-stream");
             response.setHeader("Content-Disposition", "attachment; filename=" + onlyFileName);

             InputStream is = new FileInputStream(file);
             OutputStream os = response.getOutputStream();

             int length;
             byte[] buffer = new byte[1024];

             while( (length = is.read(buffer)) != -1){
                 os.write(buffer, 0, length);
             }

             os.flush();
             os.close();
             is.close();
         }
     } catch (IOException e) {
         e.printStackTrace();
     }
	}

	
	
	@RequestMapping("/programthumbnails.do")//변경
	protected void thumbnails(@RequestParam("EMP_FILENAME") String EMP_FILENAME,//변경
                            	@RequestParam("PROGRAM_NO") String PROGRAM_NO,//변경
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+PROGRAM_NO+"\\"+EMP_FILENAME;//변경
		File file=new File(filePath);
		
		if (file.exists()) { 
			Thumbnails.of(file).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}

