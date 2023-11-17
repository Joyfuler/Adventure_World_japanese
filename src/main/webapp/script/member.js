

function loginCheck(){
	if(document.loginFrm.id.value==""){
		alert("아이디는 필수 입력사항 입니다");
		document.loginFrm.id.focus();
		return false;
	}else if(document.loginFrm.pwd.value==""){
		alert("비밀번호 필수 입력사항 입니다");
		document.loginFrm.pwd.focus();
		return false;
	}else{
		document.loginFrm.action = "login";
		document.loginFrm.submit();
		return true;
	}
}

function go_contract(){
	document.loginFrm.action = "/contract";
	document.loginFrm.submit();
}



function go_save(){
	if(document.joinForm.id.value==""){
		alert("아이디는 필수 입력사항 입니다");
		document.joinForm.id.focus();
	}else if(document.joinForm.reid.value != document.joinForm.id.value){
		alert("아이디 중복확인을 하지 않았습니다");		
		document.joinForm.id.focus();
	} else if(document.joinForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");	    
	    document.joinForm.pwd.focus();
	} else if(document.joinForm.pwd.value != document.joinForm.pwdCheck.value) {
	    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");	    
	    document.joinForm.pwd.focus();
	}else if(document.joinForm.name.value == "") {
	    alert("이름을  입력해 주세요.");	    
	    document.joinForm.name.focus();
	}else if(document.joinForm.phone.value == "") {
		alert("전화번호를  입력해 주세요.");	    
	    document.joinForm.phone.focus();
	}else{
		document.joinForm.action = "/join";
	    document.joinForm.submit();
	    }
	
}





function post_zip(){
	var url ="world.do?command=findZipNum";
	var opt ="toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550,";
	opt=opt+"height=300, top=300, left=300";
	window.open(url,"우편번호찾기",opt);
}

function result(zip_num, sido, gugun, dong){
	//  함수 호출 형태 - result( '123-123', '서울시', '서대문구',  '대현동')
	opener.document.joinForm.zip_num.value=zip_num;
	opener.document.joinForm.address1.value=sido+" "+gugun+" "+dong;
	self.close();
}

function idok( userid ){
	opener.joinForm.id.value = userid;
	opener.joinForm.reid.value = userid;
	self.close();
}



function go_update(){
	if(document.joinForm.pwd.value == "") {
	    alert("비밀번호를 입력해 주세요.");
	    document.joinForm.pwd.focus();
	}else if ((document.joinForm.pwd.value != document.joinForm.pwdCheck.value)) {
	    alert("비밀번호가 일치하지 않습니다.");
	    document.joinForm.pwd.focus();
	}else if (document.joinForm.name.value == "") {
	    alert("이름을 입력해 주세요.");
	    document.joinForm.name.focus();
	} else if (document.joinForm.phone.value == "") {
	    alert("이메일을 입력해 주세요.");
	    document.joinForm.phone.focus();
	}else {
	    document.joinForm.action = "memberUpdate";
	    document.joinForm.submit();
	}
}

function go_delete(){
	var a = confirm("정말로 탈퇴하시겠습니까?");
	if(a){
		location.href='deleteMember';
	}
}

function find_Id() {
   if (document.formm.name.value === "") {
      alert("이름을 입력해 주세요.");
      document.formm.name.focus();
   } else if (document.formm.phone.value === "") {
      alert("전화번호를 입력해 주세요.");
      document.formm.phone.focus();
   } else {
      document.formm.action = "re";
      document.formm.submit();
   }
}

function find_Pwd() {
   if (document.formm.id.value === "") {
      alert("아이디을 입력해 주세요.");
      document.formm.id.focus();
   } else if (document.formm.name.value === "") {
      alert("이름을 입력해 주세요.");
      document.formm.name.focus();
   } else if (document.formm.phone.value === "") {
      alert("전화번호를 입력해 주세요.");
      document.formm.phone.focus();
   } else {
      document.formm.action = "re2";
      document.formm.submit();
   }
}

function checkPwd() {
   if (document.joinForm.pwd.value === "") {
      alert("비밀번호를 입력해 주세요.");
      document.joinForm.pwd.focus();
   } else if (document.joinForm.pwd.value !== document.joinForm.pwdCheck.value) {
      alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
      document.joinForm.pwd.focus();
   } else {
      document.joinForm.action = "re3";
      document.joinForm.submit();
      
   }
}

function findId() {
   let url = "selectId";
   let opt = "toolbar=no, menubar=no, resizable=no, scrollbars=no, width=550, height=300, top=300, left=300";
   window.open(url, "아이디(ID) 찾기", opt);
}

function findPwd() {
   let url = "selectPwd";
   let opt = "toolbar=no, menubar=no, resizable=no, scrollbars=no, width=550, height=400, top=300, left=300";
   window.open(url, "비밀번호 찾기", opt);
}

function resetPwd(){
	document.formm.action = "resetPwdForm";
	document.formm.submit();
}

