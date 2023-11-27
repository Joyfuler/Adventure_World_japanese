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

import com.project.adventure.repository.BannerDao;
import com.project.adventure.vo.Banner;
@Service
public class BannerServiceImpl implements BannerService {
	String backupPath = "E:\\WebPro\\source\\10_2ngTeamProject\\adventure\\src\\main\\webapp\\images\\banner\\";
	@Autowired
	private BannerDao bannerDao;
		
	@Override
	public List<Banner> bannerList() {
		return bannerDao.bannerList();		
	}

	@Override
	public int insertBanner(MultipartHttpServletRequest mRequest, Banner banner) {
		String uploadPath = mRequest.getRealPath("/images/banner/");
		Iterator<String> params = mRequest.getFileNames(); // 파일이름두개
		String bimg = "";
		//if (params.hasNext()) {
			String param = params.next();
			System.out.println(" 파라미터 이름: " + param);
			MultipartFile mFile = mRequest.getFile(param); //파라미터의 파일객체
			bimg = mFile.getOriginalFilename();//업로드한 파일명
			System.out.println(bimg==null? "널" : bimg.equals("")? "첨부안해서 빈스트링":"첨부한파일이름은" + bimg);
			// 첨부여부
			if(bimg!=null && !bimg.equals("")) {
				//첨부함
				if(new File(uploadPath + bimg).exists()) {
					//첨부파일과 같은 이름의 파일이 서버에 존재: 현재밀리세컨 + 파일이름
					bimg = System.currentTimeMillis() + bimg;
				}//중복된 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + bimg));// 서버에 파일저장
					boolean isUpload = filecopy(uploadPath + bimg, backupPath+bimg);
					if(isUpload) {
						System.out.println("서버에 저장된 파일:" + uploadPath + bimg);
						System.out.println("복사될 파일: " + backupPath + bimg + "이상 복사 성공");
					}
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}//if
			banner.setBimg(bimg);
		return bannerDao.insertBanner(banner);
	}

	@Override
	public int updateBanner(Banner banner) {
		return bannerDao.updateBanner(banner);
	}

	@Override
	public int deleteBanner(int bno) {
		return bannerDao.deleteBanner(bno);
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
