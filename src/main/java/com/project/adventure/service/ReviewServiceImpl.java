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
import javax.servlet.http.HttpSession;

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
import com.project.adventure.repository.Review_CommentDao;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Review;
import com.project.adventure.vo.Review_Comment;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private Order_DetailDao order_DetailDao;
	@Autowired
	private Review_CommentDao review_CommentDao;
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
		List<Review> reviewList = reviewDao.reviewList(review);
		for(Review r : reviewList) {
			String rcontent = r.getRcontent();
			if(rcontent!=null) {
				String compareStr ="/adventure/resources/memberImg/";
				int preIdx = rcontent.indexOf(compareStr);
				if(preIdx!=-1) {
					int postIdx = rcontent.indexOf("\" style=");
					String rcontentImgFileName = rcontent.substring(preIdx+compareStr.length(), postIdx);
					r.setRcontentImgFileName(rcontentImgFileName);
				}
			}
		}
		return reviewList;
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
				int result = reviewDao.writeReview(review);				
				if (pointObtained.equals("N")) {
					Member pointPlusMember = new Member();
					pointPlusMember.setMpoint(1000);
					pointPlusMember.setMid(review.getMid());
					memberDao.plusMemberPoint(pointPlusMember);
					order_DetailDao.checkReviewOk(review.getOdid());
					System.out.println(pointPlusMember.getMid() + "포인트 1000 적립됨");
				} else {
					System.out.println("이미 해당 리뷰로 포인트를 획득했으므로, " + review.getMid() + "에 포인트 지급 없음");
				}
				model.addAttribute("successMsg", "리뷰 작성이 완료되었습니다.");	
			}
		}

	@Override
	public int reviewDelete(int rid) {
		review_CommentDao.deleteAllComments(rid);
		System.out.println(rid+" 에 해당하는 리뷰의 댓글들을 우선 삭제함");
		return reviewDao.reviewDelete(rid);
	}

	@Override
	public void reviewModify(Review review, MultipartHttpServletRequest mRequest, Model model) {
		String uploadPath = mRequest.getRealPath("memberImg/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		// 파일을 첨부한 경우 -> 같은 이름의 파일이 있다면 파일이름을 변경함.
		if (params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			if (filename != null && !filename.equals("")) {
				if (new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;					
				}				
				try {
					mFile.transferTo(new File(uploadPath + filename));
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result ==1? "첨부파일 백업 성공" : "실패");
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		String rphoto = "";
		if (review.getRphoto() == null || review.getRphoto().equals("")) {			
			rphoto = null;
		} else {
			rphoto = filename;			
		}
			review.setRphoto(rphoto);
		try {
			int result = reviewDao.modifyReview(review);
			if (result ==1) {
				model.addAttribute("successMsg", "글 수정 완료");
			} else {
				model.addAttribute("failMsg", "글 수정 실패");
			}
		} catch (Exception e) {
			model.addAttribute("failMsg", "글 수정 실패");
		}		
	}

	@Override
	public List<Review_Comment> getReviewComments(int rid, String replyPageNum) {
		Paging paging = new Paging(review_CommentDao.commentTotCnt(rid), replyPageNum, 5, 5);
		Review_Comment commentsInfo = new Review_Comment();
		commentsInfo.setRid(rid);
		commentsInfo.setStartRow(paging.getStartRow());
		commentsInfo.setEndRow(paging.getEndRow());		
		return review_CommentDao.getReviewComments(commentsInfo);
	}

	@Override
	public String commentWrite(Review_Comment review_Comment, HttpSession session) {
		String msg = "";
		int result = review_CommentDao.checkCommentCount(review_Comment);
		if (result <3) {
			Member pointUpMember = new Member();
			pointUpMember.setMid(review_Comment.getMid());
			pointUpMember.setMpoint(50);
			memberDao.plusMemberPoint(pointUpMember);
			msg = "댓글 작성 완료. 해당 리뷰에 대한 댓글 작성으로 50포인트를 획득하였습니다.";			
		} else {
			msg = "댓글 작성 완료. 동일한 리뷰에 대한 포인트 획득은 댓글 3개까지만 가능합니다.";			
		}
		// 포인트 적립 후 즉시 반영 위해 다시 session 전달.
		Member sessionMember = memberDao.getMemberInfo(review_Comment.getMid());
		session.setAttribute("member", sessionMember);
		review_CommentDao.commentWrite(review_Comment);
		return msg;
	}

	@Override
	public int commentTotCnt(int rid) {
		return review_CommentDao.commentTotCnt(rid);		
	}

	@Override
	public Review_Comment getOriginalCommentDto(int rcid) {
		return review_CommentDao.getOriginalCommentDto(rcid);
	}

	@Override
	public String reviewCommentReply(Review_Comment review_Comment, HttpSession session) {
		String msg = "";
		review_CommentDao.commentReplyPreStep(review_Comment);
		int result = review_CommentDao.checkCommentCount(review_Comment);
		if (result <3) {
			Member pointUpMember = new Member();
			pointUpMember.setMid(review_Comment.getMid());
			pointUpMember.setMpoint(50);
			memberDao.plusMemberPoint(pointUpMember);			
			msg = "댓글 작성 완료. 해당 리뷰에 대한 댓글 작성으로 50포인트를 획득하였습니다.";
		} else {
			msg = "댓글 작성 완료. 동일한 리뷰에 대한 포인트 획득은 댓글 3개까지만 가능합니다.";
		}
		// 포인트 적립 후 즉시 반영 위해 다시 session 전달.
		Member sessionMember = memberDao.getMemberInfo(review_Comment.getMid());
		session.setAttribute("member", sessionMember);		
		review_CommentDao.reviewCommentReply(review_Comment);
		return msg;
	}
	
	@Override
	public Review_Comment commentDetail(int rcid) {
		return review_CommentDao.commentDetail(rcid);
	}	

	@Override
	public int commentDelete(int rcid) {
		return review_CommentDao.commentDelete(rcid);		
	}

	@Override
	public int modifyComment(Review_Comment review_Comment) {
		return review_CommentDao.modifyComment(review_Comment);
	}

	@Override
	public int workerDeleteReview(int[] rid) {
		int result = 0;
		for(int id : rid) {
			review_CommentDao.deleteAllComments(id);
			result += reviewDao.reviewDelete(id);
		}
		return result;
	}	
}