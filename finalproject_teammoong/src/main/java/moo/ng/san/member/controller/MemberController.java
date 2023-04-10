package moo.ng.san.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/msgTest.do")
	public String msgTest() {
		return "common/msg";
	}
	
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember!=null) {
			session.setAttribute("m", loginMember);
			return "ok";
		}else {
			return "error";
		}
	}//login
	
	@RequestMapping(value = "/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}//logOut
	
	
	@RequestMapping(value = "/myPage.do")
	public String myPage() {
		return "member/myPage";
	}//myPage
	

	@RequestMapping(value = "/signUpFrm.do")
	public String joinMemberFrm(){
		return "member/signUpFrm";
	}//joinMemberFrm

	@RequestMapping(value = "/myPageMemberInfo.do")
	public String myPageMemberInfo() {
		return "member/myPageMemberInfo";
	}//myPageMemberInfo(회원정보수정)
	
	
	@RequestMapping(value = "/myPageMemberDelete.do")
	public String myPageMemberDelete() {
		return "member/myPageMemberDelete";
	}//myPageMemberDelete(회원탈퇴)

}//MemberController
