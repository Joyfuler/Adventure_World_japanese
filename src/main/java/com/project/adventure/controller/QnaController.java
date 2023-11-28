package com.project.adventure.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.adventure.service.QnaService;
import com.project.adventure.service.WorkerService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Member;
import com.project.adventure.vo.Qna;

@Controller
@RequestMapping("qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value = "qnamain", method = RequestMethod.GET )
	public String qnaview() {
		return "qna/qnamain";
	}
	@RequestMapping(value = "qnaList", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaList(String pageNum, Qna qna, Model model) {
		model.addAttribute("qnaList", qnaService.QnaList(pageNum, qna));
		model.addAttribute("paging", new Paging(qnaService.qnaTotCnt(qna), pageNum, 10, 10));
		return "qna/qnaList";
	}
	@RequestMapping(value = "qnaView", method =  {RequestMethod.GET, RequestMethod.POST})
	public String qna_view(Model model, @RequestParam("qno") int qno) {
		model.addAttribute("Qna", qnaService.getQna(qno));
		return "qna/qnaView";
	}
	@RequestMapping(value = "passCheck",method = RequestMethod.GET  )
	public String passCheck( @RequestParam("qno") int qno,Model model) {	
			model.addAttribute("qno", qno);
			return "qna/checkPass";
	}
	@RequestMapping(value="qnaCheckPass", method=RequestMethod.POST)
	public String qnaCheckPass(int qno,@RequestParam("qpw") String qpw,Model model ) {
			Qna qna = qnaService.getQna(qno);
			model.addAttribute("qno" , qno);
			model.addAttribute("chkResult",qno);
			if( qna.getQpw().equals(qpw) ) {
				return "qna/checkPassSuccess";
			}else {
				model.addAttribute("message", "비밀번호가 맞지 않습니다");
				return "qna/checkPass";
			}	
		}
	@RequestMapping(value = "qnaWriteForm", method=RequestMethod.GET)
	public String qnaWrite() {
		return "qna/qnaWrite";
	}
	@RequestMapping(value ="qnaWrite", method= RequestMethod.POST)
	public String qnaWrite(Qna qna,
							Model model,
							@RequestParam(value="check", required=false) String check) {
		System.out.println("qna : " + qna);
	    		if( check == null ) {
	    			qna.setQpwchk( "N" );
	    			qna.setQpw("");
	    		}else {
	    			qna.setQpwchk( "Y" );
	    		}
	    		qna.setMid(qna.getMid());
	    		model.addAttribute("wirteResult",qnaService.insertQna(qna));
		return "forward:qnaList.do";
	}
	@RequestMapping(value="adminQnaView", method =RequestMethod.GET)
	public String adminqna_view (Model model, int qno){		
		model.addAttribute("Qna", qnaService.getQna(qno));
		return "qna/adminQnaView";
	}
	@RequestMapping(value="adminqnqreply", method = RequestMethod.POST)
	public String adminQnaRepSave (Qna qna, Model model){		
		model.addAttribute("replyResult",qnaService.qnaReply(qna));
		return "forward:qnaList.do";
	}
	@RequestMapping(value = "qnadelete", method = RequestMethod.GET)
	public String deleteQna(int qno, Model model ) {
		model.addAttribute("deleteResult",qnaService.deleteQna(qno));
		return "forward:qnaList.do";
	}
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modify(Model model,int qno) {
		model.addAttribute("Qna", qnaService.getQna(qno));
		return "qna/adminQnamodify";
	}
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(Model model, Qna qna) {
		model.addAttribute("modify",qnaService.modify(qna));
		return "forward:qnaView.do";
	}
	
	

}
