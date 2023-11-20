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

import com.project.adventure.repository.NoticeDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {
	String backupPath = "E:\\WebPro\\source\\10_2ngTeamProject\\adventure\\src\\main\\webapp\\noticeImg\\";
	@Autowired
	private NoticeDao noticeDao;
	@Override
	public List<Notice> noticeList(String pageNum, Notice notice) {
		Paging paging = new Paging(noticeDao.totCntNotce(notice), pageNum, 10, 10);
		notice.setStartRow(paging.getStartRow());
		notice.setEndRow(paging.getEndRow());
		return noticeDao.noticeList(notice);
	}

	@Override
	public int totCntNotice(Notice notice) {
		return noticeDao.totCntNotce(notice);
	}

	@Override
	public int insertNotice(MultipartHttpServletRequest mRequest, Notice notice) {
		String uploadPath = mRequest.getRealPath("noticeImg/");
		Iterator<String> params = mRequest.getFileNames(); // 파일이름두개
		String[] bimg = new String[2];
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			System.out.println(i + "번째 파라미터 이름: " + param);
			MultipartFile mFile = mRequest.getFile(param); //파라미터의 파일객체
			bimg[i] = mFile.getOriginalFilename();//업로드한 파일명
			System.out.println(bimg[i]==null? "널" : bimg[i].equals("")? "첨부안해서 빈스트링":"첨부한파일이름은" + bimg[i]);
			// 첨부여부
			if(bimg[i]!=null && !bimg[i].equals("")) {
				//첨부함
				if(new File(uploadPath + bimg[i]).exists()) {
					//첨부파일과 같은 이름의 파일이 서버에 존재: 현재밀리세컨 + 파일이름
					bimg[i] = System.currentTimeMillis() + bimg[i];
				}//중복된 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + bimg[i]));// 서버에 파일저장
					System.out.println("서버에 저장된 파일:" + uploadPath + bimg[i]);
					System.out.println("복사될 파일: " + backupPath + bimg[i]);
					boolean isUpload = filecopy(uploadPath + bimg[i], backupPath+bimg[i]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}//if
			i++;
		}//while
		notice.setNcontent(bimg[0]);
		notice.setNcontent(bimg[1]);
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(MultipartHttpServletRequest mRequest, Notice notice) {
		String uploadPath = mRequest.getRealPath("noticeImg/");
		Iterator<String> params = mRequest.getFileNames(); // 파일이름두개
		String[] bimg = new String[2];
		int i = 0;
		while(params.hasNext()) {
			String param = params.next();
			System.out.println(i + "번째 파라미터 이름: " + param);
			MultipartFile mFile = mRequest.getFile(param); //파라미터의 파일객체
			bimg[i] = mFile.getOriginalFilename();//업로드한 파일명
			System.out.println(bimg[i]==null? "널" : bimg[i].equals("")? "첨부안해서 빈스트링":"첨부한파일이름은" + bimg[i]);
			// 첨부여부
			if(bimg[i]!=null && !bimg[i].equals("")) {
				//첨부함
				if(new File(uploadPath + bimg[i]).exists()) {
					//첨부파일과 같은 이름의 파일이 서버에 존재: 현재밀리세컨 + 파일이름
					bimg[i] = System.currentTimeMillis() + bimg[i];
				}//중복된 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + bimg[i]));// 서버에 파일저장
					System.out.println("서버에 저장된 파일:" + uploadPath + bimg[i]);
					System.out.println("복사될 파일: " + backupPath + bimg[i]);
					boolean isUpload = filecopy(uploadPath + bimg[i], backupPath+bimg[i]);
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}//if
			i++;
		}//while
		notice.setNcontent(bimg[0]);
		notice.setNcontent(bimg[1]);
		return noticeDao.updateNotice(notice);
	}

	@Override
	public Notice getDetailNotice(int nid) {
		return noticeDao.getDetailNotice(nid);
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
