package com.project.adventure.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.adventure.service.QnaService;
import com.project.adventure.util.Paging;
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
	@RequestMapping(value = "passCheck",method = RequestMethod.GET)
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
	    		model.addAttribute("writeResult",qnaService.insertQna(qna));
		return "forward:qnaList.do";
	}
	
	@RequestMapping(value = "qnaModify", method = RequestMethod.GET)
	public String qnaModify(int qno, Model model) {
		model.addAttribute("originalQnaInfo", qnaService.getQna(qno));
		return "qna/qnaModify";
	}
	
	@RequestMapping(value = "qnaModifyConfirm", method = RequestMethod.POST)
	public String qnaModify(Qna qna, Model model,
			@RequestParam(value="check", required=false) String check) {
			System.out.println("qna : " + qna);
			if (check == null) {
				qna.setQpwchk("N");
				qna.setQpw("");
			} else {
				qna.setQpwchk("Y");				
			}
		
		model.addAttribute("modifyResult", qnaService.userModify(qna));			
		return "forward:qnaView.do";
	}
	
	@RequestMapping(value = "deleteQna", method = RequestMethod.GET)
	public String deleteQna(int qno, Model model) {
		model.addAttribute("deleteResult", qnaService.deleteQna(qno));
		return "forward:qnaList.do";
	}
	
}
