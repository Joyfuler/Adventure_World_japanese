package com.project.adventure.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.adventure.repository.AttractionDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Attraction;
@Service
public class AttractionServiceImpl implements AttractionService {
	String backupPath = "E:\\WebPro\\source\\10_2ngTeamProject\\adventure\\src\\main\\webapp\\images\\attraction_images\\";
	@Autowired
	private AttractionDao attractionDao;	

	@Override
	public List<Attraction> bestAttractionList() {
		return attractionDao.bestAttractionList();
	}

	@Override
	public List<Attraction> attractionList() {
		return attractionDao.attractionList();
	}
	
	@Override
	public int totCntAttraction(Attraction attraction) {
		return attractionDao.totCntAttraction(attraction);
	}

	@Override
	public List<Attraction> attractionListP(String pageNum, Attraction attraction) {
		Paging paging = new Paging(attractionDao.totCntAttraction(attraction), pageNum, 5, 5);
		attraction.setStartRow(paging.getStartRow());
		attraction.setEndRow(paging.getEndRow());
		return attractionDao.attractionListP(attraction);
	}

	@Override
	public List<Attraction> tag1List() {
		return attractionDao.tag1List();
	}

	@Override
	public List<Attraction> tag2List() {
		return attractionDao.tag2List();
	}

	@Override
	public List<Attraction> searchAttractionList(Attraction attraction) {		
		return attractionDao.searchAttractionList(attraction);
	}

	@Override
	public Attraction attractionDetail(String aid) {
		return attractionDao.attractionDetail(aid);
	}

	@Override
	public List<Attraction> stopDayAttractionList() {
		return attractionDao.stopDayAttractionList();
	}
	@Override
	public int insertAttraction(MultipartHttpServletRequest mRequest, Attraction attraction) {
		String uploadPath = mRequest.getRealPath("/images/attraction_images/");
		Iterator<String> params = mRequest.getFileNames(); // 파일이름두개
		String aimg = "";
		//if (params.hasNext()) {
			String param = params.next();
			System.out.println(" 파라미터 이름: " + param);
			MultipartFile mFile = mRequest.getFile(param); //파라미터의 파일객체
			aimg = mFile.getOriginalFilename();//업로드한 파일명
			System.out.println(aimg==null? "널" : aimg.equals("")? "첨부안해서 빈스트링":"첨부한파일이름은" + aimg);
			// 첨부여부
			if(aimg!=null && !aimg.equals("")) {
				//첨부함
				if(new File(uploadPath + aimg).exists()) {
					//첨부파일과 같은 이름의 파일이 서버에 존재: 현재밀리세컨 + 파일이름
					aimg = System.currentTimeMillis() + aimg;
				}//중복된 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + aimg));// 서버에 파일저장
					boolean isUpload = filecopy(uploadPath + aimg, backupPath+aimg);
					if(isUpload) {
						System.out.println("서버에 저장된 파일:" + uploadPath + aimg);
						System.out.println("복사될 파일: " + backupPath + aimg + "이상 복사 성공");
					}
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}//if
		attraction.setAimage(aimg);
		return attractionDao.insertAttraction(attraction);
	}

	@Override
	public int updateAttraction(MultipartHttpServletRequest mRequest, Attraction attraction) {
		String uploadPath = mRequest.getRealPath("/images/attraction_images/");
		Iterator<String> params = mRequest.getFileNames(); // 파일이름두개
		String aimg = "";
		String aimage = attraction.getAcontent();
		//if (params.hasNext()) {
			String param = params.next();
			System.out.println(" 파라미터 이름: " + param);
			MultipartFile mFile = mRequest.getFile(param); //파라미터의 파일객체
			aimg = mFile.getOriginalFilename();//업로드한 파일명
			System.out.println(aimg==null? "널" : aimg.equals("")? "첨부안해서 빈스트링":"첨부한파일이름은" + aimg);
			// 첨부여부
			if(aimg!=null && !aimg.equals("")) {
				//첨부함
				if(new File(uploadPath + aimg).exists()) {
					//첨부파일과 같은 이름의 파일이 서버에 존재: 현재밀리세컨 + 파일이름
					aimg = System.currentTimeMillis() + aimg;
				}//중복된 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + aimg));// 서버에 파일저장
					boolean isUpload = filecopy(uploadPath + aimg, backupPath+aimg);
					if(isUpload) {
						System.out.println("서버에 저장된 파일:" + uploadPath + aimg);
						System.out.println("복사될 파일: " + backupPath + aimg + "이상 복사 성공");
					}
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}//if
		if (aimage.equals("")) {
			aimage = null;
		}else {
			aimage = aimg;
		}
		return attractionDao.updateAttraction(attraction);
	}

	@Override
	public int deleteAttraction(int aid) {
		return attractionDao.deleteAttraction(aid);
	}
	private boolean filecopy(String serverFile, String backupFile) {//파일 복사가 될수도 있고 안될수도
		boolean isCopy = false;
		InputStream is = null;
		OutputStream os = null;
		File file = new File(serverFile);
		try {
			file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] bs = new byte[(int)file.length()];
			while(true) {
				int nReadBytes = is.read(bs);
				if(nReadBytes == -1) break;
				os.write(bs, 0, nReadBytes);
			}
			isCopy = true;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is!=null) is.close();
				if(os!=null) is.close();
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		//복사
		return false;
	}
}
