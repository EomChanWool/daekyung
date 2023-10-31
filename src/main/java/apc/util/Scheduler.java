package apc.util;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import apc.sl.db.service.ExcelReaderService;
import egovframework.rte.fdl.filehandling.EgovFileUtil;

@Component
public class Scheduler {
	//static String user_id = "";
	FTPClient ftp = null;
	
	@Autowired
	private ExcelReaderService excelReaderService;
	
	
	
//	@Scheduled(cron = "10 55 8 * * *")
//	public void delete1() throws Exception{
//		//excelReaderService.deletedb();
//		//excelReaderService.deleteMm();
//	}
	
	//ini 파일 읽어들이기 예제
	//@Scheduled(cron = "10 55 8 * * *")
//	public void sampleIni() throws Exception{
//		String fileName = "C:\\test\\sample.ini";
//		File fileToParse = new File(fileName);
//		
//		INIConfiguration iniConfiguration = new INIConfiguration();
//		try (FileReader fileReader = new FileReader(fileToParse)) {
//		    iniConfiguration.read(fileReader);
//		}
//		
//		Map<String, Map<String,String>> map =  new HashMap<>();
//		for (String section : iniConfiguration.getSections()) {
//			Map<String,String> subMap = new HashMap<>();
//			SubnodeConfiguration confSection = iniConfiguration.getSection(section);
//			Iterator<String> keyIlerator = confSection.getKeys();
//			while(keyIlerator.hasNext()) {
//				String key = keyIlerator.next();
//				String value = confSection.getProperty(key)+"";
//				subMap.put(key,value);
//			}
//			map.put(section, subMap);
//		}
//		Map<String, String> rowMap = map.get("main");
//		Map<String, String> rowMap2 = map.get("branch1");
//		
//		System.out.println("ini맵 : " + rowMap);
//		System.out.println("ini맵2 : " + rowMap2);
//	}
	
	//끝난 가공공정 txt파일로 생성
	@Scheduled(cron = "20 55 20 * * *")
	public void outPro() {
		
		List<?> outProList = excelReaderService.outProList();
		
		System.out.println(outProList);
		
		String fileName = "C:\\test\\Test2.txt";
		
		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName,true));
			
			for(int i=0; i<outProList.size(); i++) {
				System.out.println(i +" : "+outProList.get(i));
				fw.write(outProList.get(i).toString() + "\n");
				
			}
			fw.flush();
			fw.close();
//			fw.write(outProList.toString()+",");
//			fw.flush();
//			fw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//끝난 가공공정 txt파일로 생성된것을 ftp서버로 옮김
	@Scheduled(cron = "40 55 20 * * *")
	public void outProFTP() {
		
	    ftp = new FTPClient();
	    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
	    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
	    ftp.setControlEncoding("UTF-8");
	    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
	    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));

	    try {
	        //ftp 서버 연결
	        ftp.connect("dkbend.iptime.org", 30431);

	        //ftp 서버에 정상적으로 연결되었는지 확인
	        int reply = ftp.getReplyCode();
	        if (!FTPReply.isPositiveCompletion(reply)) {
	            ftp.disconnect();
	            System.out.println("에러");
	        }

	        //socketTimeout 값 설정
	        ftp.setSoTimeout(1000);
	        //ftp 서버 로그인
	        ftp.login("signlab", "dk304316@");
	        //file type 설정 (default FTP.ASCII_FILE_TYPE)
	        ftp.setFileType(FTP.BINARY_FILE_TYPE);
	        //ftp Active모드 설정
	        ftp.enterLocalPassiveMode(); 
	            
	    } catch (IOException e) {
	        e.printStackTrace();
	        System.out.println("에러");
	    }
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date now = new Date();
		String edDate = format.format(now);
	    
	    String append_fileName = "C:\\test\\Test2.txt";
	    
	    File append_file = new File(append_fileName);
	    
	    String fileName = "/down-data/pro"+"-"+edDate+".txt";
	   
	    System.out.println("");
		 try {
		FileInputStream inputStream = new FileInputStream(append_file);
		
		boolean result = ftp.appendFile(fileName, inputStream);
		
		inputStream.close();
		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		 finally {
			 try {
				 EgovFileUtil.delete(append_file);
			        ftp.logout();
			        ftp.disconnect();
			        
			    } catch (IOException e) {
			        e.printStackTrace();
			        System.out.println("에러");
			    }
		}
		
		
	    
	}

	
	
	
	@Scheduled(cron = "40 32 20 * * *")
	public void readSuju() throws Exception{
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date now = new Date();
	    
	    now =  new Date(now.getTime()+(1000*60*60*24*-1));
	    
		String edDate = format.format(now);
		
		File note2 = new File("C:\\test4\\suju-"+edDate+".txt");
		Map<String,String> linee = new HashMap<String, String>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(note2));
			String line = "";
			
			
			while ((line= br.readLine()) !=null) {
				
				String[] line2 = line.split(",");
				linee.put("orId", line2[0].trim());
				linee.put("orCompany", line2[1].trim());
				linee.put("orProd", line2[11].trim());
				linee.put("orDate", edDate);
				linee.put("orDueDate", line2[7].trim());
				linee.put("orFinDate", line2[17].trim());
				linee.put("orOrType", line2[5].trim());
				linee.put("orWorkType", line2[6].trim());
				linee.put("orTexture", line2[12].trim());
				linee.put("orThickness", line2[13].trim());
				linee.put("orState", line2[14].trim());
				linee.put("orStandard", line2[15].trim());
				linee.put("orManager", line2[19].trim());
				linee.put("orPrNo", line2[4].trim());
				linee.put("orUnit", line2[9].trim());
				linee.put("orMoney", line2[10].trim());
				linee.put("orQty", line2[8].trim());
				
				int jungbok = excelReaderService.checkjungbok(linee);
				
				if(jungbok == 1) {
					linee.clear();
				}
				
				if(line2[7].equals("00000000")) {
					linee.remove("orDueDate");
				}
				if(line2[17].equals("00000000")) {
					linee.remove("orFinDate");
				}
				System.out.println(linee);
				excelReaderService.registOrder(linee);
			}
			br.close();
			EgovFileUtil.delete(note2);
		
		} catch (Exception e) {
		}
	}
	
	@Scheduled(cron = "50 34 20 * * *")
	public void readPro() throws Exception{
		
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date now = new Date();
	    
	    now =  new Date(now.getTime()+(1000*60*60*24*-1));
	    
		String edDate = format.format(now);
		
		System.out.println("들어옴 : " + now);
		
		File note = new File("C:\\test4\\pro-"+edDate+".txt");
		
		Map<String,String> linee = new HashMap<String, String>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(note));
			String line = "";
			
			while ((line= br.readLine()) !=null) {
				
				String[] line2 = line.split(",");
				
				
				linee.put("mpMfno", line2[3].trim());
				linee.put("orId", line2[4].trim());
				linee.put("mpProdName", line2[5].trim());
				linee.put("mpTexture", line2[6].trim());
				linee.put("mpThickness", line2[7].trim());
				linee.put("mpState", line2[8].trim());
				linee.put("mpStandard", line2[9].trim());
				linee.put("poLotno", line2[10].trim());
				linee.put("mpQty", line2[18].trim());
				linee.put("mpNote", line2[20].trim());
				System.out.println("생산데이터 들어옴 : " + now);
				excelReaderService.registProc(linee);
				excelReaderService.registCutpro(linee);
			}
			br.close();
			EgovFileUtil.delete(note);
		} catch (Exception e) {
		}
	}
	
//	@Scheduled(cron = "50 04 21 * * *")
//	@Scheduled(cron = "25 * * * * *")
	public void readSubl() throws Exception{
		
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	    Date now = new Date();
	    
	    now =  new Date(now.getTime()+(1000*60*60*24*-1));
	    
		String edDate = format.format(now);
		
		
		File note = new File("C:\\test4\\subl-"+edDate+".txt");
		
		Map<String,String> linee = new HashMap<String, String>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(note));
			String line = "";
			
			while ((line= br.readLine()) !=null) {
				
				String[] line2 = line.split(",");
				
				
				linee.put("piId", line2[0].trim());
				linee.put("piItemType", line2[1].trim());
				linee.put("piItemHeat", line2[2].trim());
				linee.put("piItemName", line2[12].trim());
				linee.put("piItemTexture", line2[13].trim());
				linee.put("piItemStandard", line2[14].trim());
				linee.put("piItemThickness", line2[15].trim());
				linee.put("piItemLong", line2[16].trim());
				linee.put("piMiddle", line2[8].trim());
				linee.put("piItemUnit", line2[9].trim());
				linee.put("piRemainQty", line2[10].trim());
				linee.put("piRemainKg", line2[11].trim());
				System.out.println(linee);
				excelReaderService.registMm(linee);
			}
			br.close();
			EgovFileUtil.delete(note);
		} catch (Exception e) {
		}
	}

	
	
	@Scheduled(cron = "20 32 20 * * *")
	public void openSuju() {
		  ftp = new FTPClient();
		    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
		    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
		    ftp.setControlEncoding("UTF-8");
		    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
		    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));

		    try {
		        //ftp 서버 연결
		        ftp.connect("dkbend.iptime.org", 30431);

		        //ftp 서버에 정상적으로 연결되었는지 확인
		        int reply = ftp.getReplyCode();
		        if (!FTPReply.isPositiveCompletion(reply)) {
		            ftp.disconnect();
		            System.out.println("에러");
		        }

		        //socketTimeout 값 설정
		        ftp.setSoTimeout(1000);
		        //ftp 서버 로그인
		        ftp.login("signlab", "dk304316@");
		        //file type 설정 (default FTP.ASCII_FILE_TYPE)
		        ftp.setFileType(FTP.BINARY_FILE_TYPE);
		        //ftp Active모드 설정
		        ftp.enterLocalPassiveMode(); 
		            
		    } catch (IOException e) {
		        e.printStackTrace();
		        System.out.println("에러");
		    }
		    
		    
		    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		    Date now = new Date();
		    
		    now =  new Date(now.getTime()+(1000*60*60*24*-1));
		    
			String edDate = format.format(now);
			String fileName = "/up-data/suju-"+edDate;
			File get_file = new File("C:\\test4","suju-"+edDate+"row.txt");
			
			
		    try {
		    	FileOutputStream outputstream = new FileOutputStream(get_file);
		    	boolean result = ftp.retrieveFile(fileName, outputstream);

		    	if(result) {
		    		System.out.println("ftp들어옴 : " + now);
		    		System.out.println("파일다운성공");
		    	}else {
		    		System.out.println("파일없음");
		    	}
		    	
		    	FileInputStream fis = new FileInputStream(get_file);
		    	InputStreamReader isr = new InputStreamReader(fis,"euc-kr");
		    	
		    	
		    	FileOutputStream fos1 = new FileOutputStream("C:\\test4\\suju-"+edDate+".txt");
		    	OutputStreamWriter osw1 = new OutputStreamWriter(fos1,"utf-8");
		    	int c ;
				while ((c=isr.read())!=-1) {
					osw1.write(c);
				}
				
		    	isr.close();
		    	osw1.close();
		    	outputstream.close();
		    	EgovFileUtil.delete(get_file);
		    } catch (IOException e) {
		        e.printStackTrace();
		    } finally {
		    	try {
		    		//ftp.deleteFile(fileName);
			        ftp.logout();
			        ftp.disconnect();
			    } catch (IOException e) {
			        e.printStackTrace();
			        System.out.println("에러");
			    }
		    }
		
		
	}
	
	@Scheduled(cron = "20 34 20 * * *")
	public void openPro() {
		  ftp = new FTPClient();
		    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
		    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
		    ftp.setControlEncoding("UTF-8");
		    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
		    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));

		    try {
		        //ftp 서버 연결
		        ftp.connect("dkbend.iptime.org", 30431);

		        //ftp 서버에 정상적으로 연결되었는지 확인
		        int reply = ftp.getReplyCode();
		        if (!FTPReply.isPositiveCompletion(reply)) {
		            ftp.disconnect();
		            System.out.println("에러");
		        }

		        //socketTimeout 값 설정
		        ftp.setSoTimeout(1000);
		        //ftp 서버 로그인
		        ftp.login("signlab", "dk304316@");
		        //file type 설정 (default FTP.ASCII_FILE_TYPE)
		        ftp.setFileType(FTP.BINARY_FILE_TYPE);
		        //ftp Active모드 설정
		        ftp.enterLocalPassiveMode(); 
		            
		    } catch (IOException e) {
		        e.printStackTrace();
		        System.out.println("에러");
		    }
		    //긁어오기 이까지
		    
		    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		    Date now = new Date();
		    
		    now =  new Date(now.getTime()+(1000*60*60*24*-1));
		    
			String edDate = format.format(now);
			String fileName = "/up-data/pro-"+edDate;
			File get_file = new File("C:\\test4","pro-"+edDate+"row.txt");
			
			
		    try {
		    	FileOutputStream outputstream = new FileOutputStream(get_file);
		    	boolean result = ftp.retrieveFile(fileName, outputstream);

		    	if(result) {
		    		System.out.println("ftp들어옴2 : " + now);
		    		System.out.println("파일다운성공");
		    	}else {
		    		System.out.println("파일없음");
		    	}
		    	
		    	FileInputStream fis = new FileInputStream(get_file);
		    	InputStreamReader isr = new InputStreamReader(fis,"euc-kr");
		    	
		    	
		    	FileOutputStream fos1 = new FileOutputStream("C:\\test4\\pro-"+edDate+".txt");
		    	OutputStreamWriter osw1 = new OutputStreamWriter(fos1,"utf-8");
		    	int c ;
				while ((c=isr.read())!=-1) {
					osw1.write(c);
				}
				
		    	isr.close();
		    	osw1.close();
		    	outputstream.close();
		    	EgovFileUtil.delete(get_file);
		    } catch (IOException e) {
		        e.printStackTrace();
		    } finally {
		    	try {
		    		//ftp.deleteFile(fileName);
			        ftp.logout();
			        ftp.disconnect();
			    } catch (IOException e) {
			        e.printStackTrace();
			        System.out.println("에러");
			    }
		    }
		
		
	}
	
//	@Scheduled(cron = "20 04 21 * * *")
//	@Scheduled(cron = "20 * * * * *")
	public void openSubl() {
		  ftp = new FTPClient();
		    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
		    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
		    ftp.setControlEncoding("UTF-8");
		    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
		    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));

		    try {
		        //ftp 서버 연결
		        ftp.connect("dkbend.iptime.org", 30431);

		        //ftp 서버에 정상적으로 연결되었는지 확인
		        int reply = ftp.getReplyCode();
		        if (!FTPReply.isPositiveCompletion(reply)) {
		            ftp.disconnect();
		            System.out.println("에러");
		        }

		        //socketTimeout 값 설정
		        ftp.setSoTimeout(1000);
		        //ftp 서버 로그인
		        ftp.login("signlab", "dk304316@");
		        //file type 설정 (default FTP.ASCII_FILE_TYPE)
		        ftp.setFileType(FTP.BINARY_FILE_TYPE);
		        //ftp Active모드 설정
		        ftp.enterLocalPassiveMode(); 
		            
		    } catch (IOException e) {
		        e.printStackTrace();
		        System.out.println("에러");
		    }
		    //긁어오기 이까지
		    
		    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		    Date now = new Date();
		    
		    now =  new Date(now.getTime()+(1000*60*60*24*-1));
		    
			String edDate = format.format(now);
			String fileName = "/up-data/subl-"+edDate;
			File get_file = new File("C:\\test4","subl-"+edDate+"row.txt");
			
			
		    try {
		    	FileOutputStream outputstream = new FileOutputStream(get_file);
		    	boolean result = ftp.retrieveFile(fileName, outputstream);

		    	if(result) {
		    		System.out.println("파일다운성공");
		    	}else {
		    		System.out.println("파일없음");
		    	}
		    	
		    	FileInputStream fis = new FileInputStream(get_file);
		    	InputStreamReader isr = new InputStreamReader(fis,"euc-kr");
		    	
		    	
		    	FileOutputStream fos1 = new FileOutputStream("C:\\test4\\subl-"+edDate+".txt");
		    	OutputStreamWriter osw1 = new OutputStreamWriter(fos1,"utf-8");
		    	int c ;
				while ((c=isr.read())!=-1) {
					osw1.write(c);
				}
				
		    	isr.close();
		    	osw1.close();
		    	outputstream.close();
		    	EgovFileUtil.delete(get_file);
		    } catch (IOException e) {
		        e.printStackTrace();
		    } finally {
		    	try {
		    		//ftp.deleteFile(fileName);
			        ftp.logout();
			        ftp.disconnect();
			    } catch (IOException e) {
			        e.printStackTrace();
			        System.out.println("에러");
			    }
		    }
		
		
	}
	
	
	
//	//@Scheduled(cron = "20 * * * * *")
//	public void open() {
//		
//	    ftp = new FTPClient();
//	    //default controlEncoding 값이 "ISO-8859-1" 때문에 한글 파일의 경우 파일명이 깨짐
//	    //ftp server 에 저장될 파일명을 uuid 등의 방식으로 한글을 사용하지 않고 저장할 경우 UTF-8 설정이 따로 필요하지 않다.
//	    ftp.setControlEncoding("UTF-8");
//	    //PrintCommandListener 를 추가하여 표준 출력에 대한 명령줄 도구를 사용하여 FTP 서버에 연결할 때 일반적으로 표시되는 응답을 출력
//	    ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
//
//	    try {
//	        //ftp 서버 연결
//	        ftp.connect("dkbend.iptime.org", 30431);
//
//	        //ftp 서버에 정상적으로 연결되었는지 확인
//	        int reply = ftp.getReplyCode();
//	        if (!FTPReply.isPositiveCompletion(reply)) {
//	            ftp.disconnect();
//	            System.out.println("에러");
//	        }
//
//	        //socketTimeout 값 설정
//	        ftp.setSoTimeout(1000);
//	        //ftp 서버 로그인
//	        ftp.login("signlab", "dk304316@");
//	        //file type 설정 (default FTP.ASCII_FILE_TYPE)
//	        ftp.setFileType(FTP.BINARY_FILE_TYPE);
//	        //ftp Active모드 설정
//	        ftp.enterLocalPassiveMode(); 
//	            
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	        System.out.println("에러");
//	    }
//	    File get_file = new File("C:\\test","testDown.txt");
//	    
//	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//	    Date now = new Date();
//		String edDate = format.format(now);
//		
//		String fileName = "/up-data/prot"+edDate+".txt";
//		
//	    try {
//	    	FileOutputStream outputstream = new FileOutputStream(get_file);
//	    	boolean result = ftp.retrieveFile(fileName, outputstream);
//
//	    	if(result) {
//	    		System.out.println("파일다운성공");
//	    	}else {
//	    		System.out.println("파일없음");
//	    	}
//	    	
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    } finally {
//	    	try {
//	    		//ftp.deleteFile(fileName);
//		        ftp.logout();
//		        ftp.disconnect();
//		    } catch (IOException e) {
//		        e.printStackTrace();
//		        System.out.println("에러");
//		    }
//	    }
//	    
//	    
//	}
	
	@Scheduled(cron = "20 50 22 * * *")
	public void insdataUpdate() {
		
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 Date now = new Date();
		 String edDate = format.format(now);
		 Map<String, Object> rowMap = excelReaderService.inspCount(edDate);
		 
		int insExcelNum = (int) rowMap.get("count1");
		int insDataNum = (int) rowMap.get("count2");
		
		if(insExcelNum > insDataNum) {
			
			List<Map<String, Object>> noUpList = excelReaderService.noUpList(edDate);
			
			for(int i=0;i<noUpList.size();i++) {
				Map<String, Object> temp = new HashMap<>();
				temp = noUpList.get(i);
				String lotNo = temp.get("iehLotno")+"";
				Map<String, Object> proc = excelReaderService.mfProc(lotNo);
				
				String prodName = proc.get("mpProdName")+"";
				String mpTexture = proc.get("mpTexture") + "";
				String mpThickness = proc.get("mpThickness")+"";
				String mpState = proc.get("mpState")+"";
				String mpStandard = proc.get("mpStandard")+"";
				
				String idName = prodName+","+ mpTexture+","+mpThickness+","+ mpState+","+mpStandard;
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("idDoc", temp.get("idDoc")+"");
				map.put("poLotno", lotNo);
				map.put("idProdName", proc.get("mpProdName"));
				map.put("idName", idName);
				map.put("mpMfno", proc.get("mpMfno"));
				map.put("idTestTime",edDate);
				map.put("idCheckTime",edDate);
				map.put("orId",proc.get("orId"));
				
				Map<String,Object>time = excelReaderService.idTestTime(temp);
				
				map.put("idTestTime", time.get("idTestTime"+""));
				
				int exist = excelReaderService.checkVision(map);
				if(exist == 0) {
					excelReaderService.registinspData(map);
					excelReaderService.insFileStateUpdate(map);
				}
				
				
			}
			
		}
		 
		
	}

	
//	public static void setUserId(String userId) {
//		user_id = userId;
//	}
	
}
