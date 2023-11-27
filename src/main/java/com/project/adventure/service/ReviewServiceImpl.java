package com.project.adventure.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.project.adventure.repository.MemberDao;
import com.project.adventure.repository.Order_DetailDao;
import com.project.adventure.repository.ReviewDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Order_Detail;
import com.project.adventure.vo.Review;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private Order_DetailDao order_DetailDao;
	private String backupPath = "C:\\Users\\user_20230926\\Desktop\\webpro\\source\\10_2ndTeamProject\\adventure\\src\\main\\webapp\\memberImg\\";	
	
	@Override
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) {		
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())){
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();			           
			            String uploadPath = request.getSession().getServletContext().getRealPath("/resources/memberImg/"); // content내 들어올 이미지 백업 경로
			            System.out.println("content내 들어올 이미지 백업 경로:"+uploadPath);
			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String uuid = UUID.randomUUID().toString();
			            String serverFileFullName = uploadPath + "/" + uuid +fileName; //
			            
			            out = new FileOutputStream(new File(serverFileFullName));
			            out.write(bytes);
			            int result = filecopy(serverFileFullName, "C:\\Users\\user_20230926\\Desktop\\webpro\\source\\10_2ndTeamProject\\adventure\\src\\main\\webapp\\resources\\memberImg\\"+uuid +fileName);
			    		if(result==1) {
			    			System.out.println("content 내에 들어갈 이미지 파일 백업 성공");
			    		}
			            printWriter = response.getWriter();
			            String serverfileUrl = request.getContextPath() + "/resources/memberImg/" +uuid +fileName; //url경로
			            System.out.println("fileUrl :" + serverfileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", serverfileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			        }catch(IOException e){
			           System.out.println("ㅇㅇ"+e.getMessage());
			        } finally {
			        	try {
				            if (out != null) { out.close(); }
			                if (printWriter != null) {printWriter.close();}
			        	}catch (Exception e) {
							// TODO: handle exception
						}
			        }//try
				}//if
			}//if
		}//if
	}//imageUpload()	
	
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : "+e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : "+e.getMessage());
		} finally {
			try {
				if(os!=null) {
					os.close();
				}
				if(is!=null) {
					is.close();
				}
			}catch (Exception e) {
			}
		}
		return isCopy;
	}

	@Override
	public List<Review> reviewList(Review review, String pageNum) {		
		Paging paging = new Paging(reviewDao.totCnt(review), pageNum, 8, 5);
		review.setStartRow(paging.getStartRow());
		review.setEndRow(paging.getEndRow());
		return reviewDao.reviewList(review);
	}

	@Override
	public int writeReview(Review review) {
		return reviewDao.writeReview(review);
	}

	@Override
	public int totCnt(Review review) {
		return reviewDao.totCnt(review);
	}

	@Override
	public Review getReviewContent(int rid) {
		return reviewDao.getReviewContent(rid);
	}

	@Override
	public Review reviewInfo() {
		return reviewDao.reviewInfo();
	}

	@Override
	public void reviewWrite(Review review, MultipartHttpServletRequest mRequest, Model model, String pointObtained) {
		String uploadPath = mRequest.getRealPath("memberImg/");		
		Iterator<String> params = mRequest.getFileNames();
		String rphoto = "";
		System.out.println("이제 파일 첨부 처리");
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			rphoto = mFile.getOriginalFilename(); // 첨부 안 하면 빈스트링
			if( rphoto!=null && !rphoto.equals("")) {
				if(new File(uploadPath + rphoto).exists()) {
					rphoto = System.currentTimeMillis() + "_" + rphoto;
				} // 중복된 파일은 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + rphoto));
					int result = filecopy(uploadPath + rphoto, backupPath + rphoto);
					System.out.println(result == 1? "첨부파일 백업 성공" : "첨부파일 백업 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}		
			}
			review.setRphoto(rphoto);
			System.out.println("서비스 review : " + review);
			try {
				int result = reviewDao.writeReview(review);
				System.out.println(result==1? "후기 쓰기 성공":"후기 쓰기 실패");
				if (pointObtained.equals("N")) {
					Member pointPlusMember = new Member();
					pointPlusMember.setMpoint(1000);
					pointPlusMember.setMid(review.getMid());
					memberDao.plusMemberPoint(pointPlusMember);
					order_DetailDao.checkReviewOk(review.getOdid());
					System.out.println(pointPlusMember.getMid() + "포인트 1000 적립됨");
				}
				model.addAttribute("successMsg", "리뷰 작성이 완료되었습니다.");
			} catch (Exception e) {
				System.out.println("리뷰 작성 실패");
				model.addAttribute("failMsg", "리뷰 작성에 실패했습니다.");
			}
		}
	}
}


