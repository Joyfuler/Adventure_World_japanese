package com.project.adventure.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.adventure.service.QnaService;
import com.project.adventure.util.Paging;
import com.project.adventure.vo.Qna;

@Controller
@RequestMapping("qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@RequestMapping(value = "qnaList", method = {RequestMethod.GET,RequestMethod.POST})
	public String qnaList(String pageNum, Qna qna, Model model) {
		model.addAttribute("qnaList", qnaService.QnaList(pageNum, qna));
		model.addAttribute("paging", new Paging(qnaService.qnaTotCnt(qna), pageNum, 10, 10));
		return "qna/qnaList";
	}
	@RequestMapping("qnaView")
	public ModelAndView qna_view( HttpServletRequest request, @RequestParam("qno") int qno) {
	    ModelAndView mav = new ModelAndView();
		mav.addObject("Qna", qnaService.getQna(qno) );
		mav.setViewName("qna/qnaView");
		return mav;
	}
	@RequestMapping("/passCheck")
	public ModelAndView passCheck( @RequestParam("qno") int qno) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qno", qno);
		mav.setViewName("qna/checkPass");
		return mav;
	}
//	/*
//	 * @RequestMapping(value="/qnaCheckPass", method=RequestMethod.POST) public
//	 * String qnaCheckPass(
//	 * 
//	 * @RequestParam("qno") int qno,
//	 * 
//	 * @RequestParam("pass") String pass, Model model ) {
//	 * 
//	 * Qna qna = qnaService.getQna(qno); model.addAttribute("qno" , qno);
//	 * 
//	 * if( qno.getPass().equals(pass) ) { return "qna/checkPassSuccess"; }else {
//	 * model.addAttribute("message", "비밀번호가 맞지 않습니다"); return "qna/checkPass"; }
//	 */
			

}
