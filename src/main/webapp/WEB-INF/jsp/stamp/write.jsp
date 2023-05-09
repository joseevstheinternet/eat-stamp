<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampWrite.css'/>" />
<script src="../js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 식사 기록하기</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>



<div class="page-main">
	<div class="write-title">
		<h1>오늘 식사 기록하기</h1>
	</div>
	<div class="box">
		<div class="box-wrap">
			<!-- 이미지 미리보기 -->
			<div class="fileDiv">
				<img class="fileImg" src="${pageContext.request.contextPath}/images/egovframework/common/no_image.png">
			</div>
			
			<div id="re_first">
				<span class="letter-count">0/60</span>
			</div>
			
			<div class="section1">
				<!-- 제목 -->
				<div class="reply-title">
					<textarea class="form-control" 
						rows="1" name="s_title" id="s_title" placeholder="제목을 입력하세요"></textarea>
				</div>
				<!-- 이미지 업로드 -->
				<div class="filebox pull-left">
					<label class="input-file-btn" for="file">이미지 첨부</label>
					<input type="file" name="file" id="file" style="display: none;"/>
				</div>
			</div>
			
			<!-- 가게 검색 -->
			<div class="section2">
				<span class="rest-name">식당명</span>
				<textarea class="form-control" 
					rows="1" name="rest" id="pInput" placeholder="검색 버튼을 눌러 검색하세요" readonly></textarea>
				<label class="input-file-btn" for="searchBtn">검색</label>
				<input id="searchBtn" type="button" value="검색" onclick="rest();" style="display: none;"/>
			</div>
			
			
			<script>
				function rest(){
					url = "rest.do";
					window.open(url,"rest",'width=500,height=400, scrollbars=no, resizable=no');
				}
			</script>
			
			<div class="section3">			
				<!-- 체크박스 -->
				<div class="section3-1">				
					<input type="checkbox" name="s_rate" id="s_rate2" value=2 onclick='checkOnlyOne(this)' style="display: none;"/>
					<label for="s_rate2" class="check-text"><i class="fa-solid fa-check"></i>  좋아요!</label>				
				</div>
				<div class="section3-2">
					<input type="checkbox" name="s_rate" id="s_rate1" value=1 onclick='checkOnlyOne(this)' style="display: none;"/>
					<label for="s_rate1" class="check-text"><i class="fa-solid fa-check"></i>  보통이에요</label>
				</div>
				<div class="section3-3">
					<input type="checkbox" name="s_rate" id="s_rate0" value=0 onclick='checkOnlyOne(this)' style="display: none;"/>
					<label for="s_rate0" class="check-text"><i class="fa-solid fa-check"></i>  별로였어요</label>
				</div>
			</div>
			
			<!-- 내용 -->
			<div class="section4">
				<textarea class="form-control" rows="8" name="s_content" id="s_content" placeholder="오늘 식사 어떠셨나요? 내용을 입력하세요"></textarea>
				<div id="re_first">
					<span class="letter-count2">0/140</span>
				</div>
			</div>
			
			<!-- 태그 -->
			<div class="section5">
				<span class="rest-name">태그</span>
				<textarea class="form-control" rows="1" name="s_tag" id="s_tag" placeholder="#태그입력"></textarea>
			</div>
			
			<!-- 공개여부 -->
			<div class="section5-1">			
				<!-- 체크박스 -->
				<div class="section3-1">				
					<input type="checkbox" name="s_publicCode" id="s_publicCode0" value=0 onclick='checkOnlyOne(this)' style="display: none;"/>
					<label for="s_publicCode0" class="check-text"><i class="fa-solid fa-unlock"></i>  전체 공개</label>				
				</div>
				<div class="section3-2">
					<input type="checkbox" name="s_publicCode" id="s_publicCode1" value=1 onclick='checkOnlyOne(this)' style="display: none;"/>
					<label for="s_publicCode1" class="check-text"><i class="fa-solid fa-lock"></i>  나만 보기</label>
				</div>
			</div>
			
			<div class="section6">
				<!-- 등록/취소 버튼 -->
				<button type="button" class="btn uploadBtn" id="uploadBtn">등록</button>
				<button type="button" class="btn" id="cancelBtn">취소</button>
			</div>
			<!-- 파일 업로드 폼 끝 -->
		</div>

		
		
		
		
		<script type="text/javascript">
		
		//========글자수 카운트========//
		//제목 textarea에 내용 입력시 글자수 체크
		$(document).on('keyup','#s_title',function(){
			//입력한 글자수 구하기
			let inputLength = $(this).val().length;
			
			if(inputLength<=60){ //60자 이하인 경우
			    //남은 글자수 구하기
			    let remain = inputLength;
			    let text = remain + '/60';
			    //글자수 카운트 업데이트
			    $('#re_first .letter-count').text(text);
			  }else{ //60자를 넘어선 경우
			    $(this).val($(this).val().substring(0,60));
			  }
		});
		//내용 textarea에 내용 입력시 글자수 체크
		$(document).on('keyup','#s_content',function(){
			//입력한 글자수 구하기
			let inputLength = $(this).val().length;
			
			if(inputLength<=140){ //140자 이하인 경우
			    //남은 글자수 구하기
			    let remain = inputLength;
			    let text = remain + '/140';
			    //글자수 카운트 업데이트
			    $('#re_first .letter-count2').text(text);
			  }else{ //140자를 넘어선 경우
			    $(this).val($(this).val().substring(0,140));
			  }
		});
		
		//========태그에 #으로 시작하지 않는 문자열 입력 시 삭제========//
		let tagInput = document.getElementById("s_tag");

		tagInput.addEventListener("input", function() {
		  if (!tagInput.value.startsWith("#")) {
		    tagInput.value = "";
		  }
		});
		
		//========체크박스========//
		//중복 체크 불가능
		function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("s_rate");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
		
		//중복 체크 불가능
		function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("s_publicCode");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
		
		//========취소 버튼 클릭 이벤트========//
		let delete_btn = document.getElementById('cancelBtn');
		//이벤트 연결
		delete_btn.onclick=function(){
			let choice = confirm('취소하시겠습니까?');
			if(choice){
				location.replace('list.do');
			}
		};

		
		//로그인, 파일 확장자 유효성 검사
		$(function(){
			
			//등록하기 버튼 클릭 이벤트
			$('#uploadBtn').click(function(){
				regist();
			});
			
			//등록을 담당하는 함수
			function regist(){
				// 세션에서 현재 로그인 중인 사용자 정보(mem_num)을 얻어옴
				const member = '${sessionScope.member.mem_num}';

				// 등록된 파일이 있을 때만 코드 실행
				if ($('#file').val()) {
				  // 자바스크립트의 파일 확장자 체크 검색
				  let file = $('#file').val();
				  console.log('mem_num: ', member);
				  console.log('file: ', file);

				  //.을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경
				  file = file.slice(file.indexOf('.') + 1).toLowerCase();
				  console.log('확장자: ', file);
				  if (file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
				    alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
				    $('#file').val('');
				    return;
				  } else if (member === '') { //세션 데이터가 없다 -> 로그인 x
				    alert('로그인이 필요한 서비스입니다.');
				    return;
				  }
				}
				
				const formData = new FormData();
			    const data = $('#file');

			    console.log('폼 데이터: ', formData);
			    console.log('data: ', data);
			    console.log('data[0]: ', data[0]);
			    console.log('data[0].files: ', data[0].files); //파일 태그에 담긴 파일 정보를 확인하는 키값
			    console.log('data[0].files[0]: ', data[0].files[0]);

			    //data[index] -> 파일 업로드 버튼이 여러 개 존재할 경우 요소의 인덱스를 지목해서 가져오는 법
			    //요소를 id로 취득했기 때문에 하나만 찍히지만, class 같은 거로 지목하면 여러 개가 취득되게 됨
			    //files[index] -> 파일이 여러 개 전송되는 경우, 몇 번째 파일인지 지목
			    //multiple 속성을 주지 않았기 때문에 0 번 인덱스밖에 없음
			    
			    //=====체크박스에서 선택된 값(value) 출력=====//
				//선택된 목록 가져오기
				const query = 'input[name="s_rate"]:checked';
				const selectedEls = document.querySelectorAll(query);
				
				//선택된 목록에서 value 찾기
				let s_rate = '';
				selectedEls.forEach((el) => {
					s_rate += el.value + ' ';
				});
				
				//=====체크박스에서 선택된 값(value) 출력=====//
				//선택된 목록 가져오기
				const query2 = 'input[name="s_publicCode"]:checked';
				const selectedEls2 = document.querySelectorAll(query2);
				
				//선택된 목록에서 value 찾기
				let s_publicCode = '';
				selectedEls2.forEach((el) => {
					s_publicCode += el.value + ' ';
				});
				
			    
			    //FormData 객체에 사용자가 업로드한 파일의 정보들이 들어 있는 객체 전달
			    formData.append('file',data[0].files[0]);
			    //s_content(글 내용) 값을 얻어와서 폼 데이터에 추가   
			    const s_content = $('#s_content').val();
			    const s_tag = $('#s_tag').val();
			    const s_title = $('#s_title').val();
			    const r_name = $('#pInput').val();
			    //const s_rate = $('#s_rate').val();
			    formData.append('s_content',s_content);
			    formData.append('s_tag',s_tag);
			    formData.append('s_title',s_title);
			    formData.append('s_rate',s_rate);
			    formData.append('r_name',r_name);
			    formData.append('s_publicCode',s_publicCode);
			    
			    console.log('s_publicCode: ' + s_publicCode);
			    
			    /* key 확인하기 
			    for (let key of formData.keys()) {
			    	   console.log(">>>>>>>>>>>>>>>"+key);
			    }*/

			    /* value 확인하기 
			    for (let value of formData.values()) {
			          console.log(">>>>>>>>>>>>>>>"+value);
			    }
				alert(formData);*/
				
			    //비동기 방식으로 파일 업로드 및 게시글 등록 진행
			    $.ajax({
			        url: 'upload_ok.do',
			        type: 'post',
			        enctype: 'multipart/form-data',
			        data: formData, //폼데이터 객체를 넘김
			        contentType: false, //ajax 방식에서 파일을 넘길 때는 반드시 false로 처리 -> "multipart/form-data"로 선언됨
			        processData: false, //폼데이터가 &변수=값&변수=값... 형식으로 변경되는 것을 막는 요소
			        async: false,
			        success: function(result){
			            if(result == 'success'){
			                $('#file').val(''); //파일 선택지 비우기
			                $('#s_title').val(''); //제목 영역 비우기
			                $('#s_content').val(''); //내용 영역 비우기
			                $('#s_tag').val(''); //태그 영역 비우기
			                $('#s_rate').val(''); //체크박스 비우기
			                $('#pInput').val(''); //상호명 검색 박스 비우기
			                $('.fileDiv').css('display','none'); //미리보기 감추기
			                $('#re_first .letter-count').text('60/60'); //제목 글자수 체크 초기화
			                $(location).attr('href','list.do') //글 목록 호출
			                
			            }else{
			                alert('업로드에 실패했습니다.1');
			            }
			        },
			        error: function(request, status, error){
			            console.log('code: ', JSON.stringify(request) + '\n' + 'message: ', request.responseText + '\n' + 'error: ', error);
			            alert('업로드에 실패했습니다.2');
			        }
			    }); //end ajax
			} //end regist()
			
			function readURL(input){
				if(input.files && input.files[0]){
					
					var reader = new FileReader(); //비동기 처리를 위한 파일을 읽는 자바스크립트 객체
					reader.readAsDataURL(input.files[0]); //readAsDataURL 메서드는 컨텐츠를 특정 Blob이나 File에서 읽어 오는 역할
					$(".fileDiv").css("display","block"); //파일업로드 시 화면에 숨겨져 있는 클래스 fileDiv를 보이게 한다
					
					reader.onload = function(event){ //읽기 동작이 성공적으로 완료되었을 때 실행되는 익명함수
						$('.fileImg').attr("src", event.target.result);
						console.log(event.target); //event.target은 이벤트로 선택된 요소를 의미
					}
				}
			}
			$("#file").change(function(){
				readURL(this); //this는 #file 자신 태그를 의미
			});
		});
		</script>
		
		<div id="contentDiv">
			
		</div>
		
	</div>
</div>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>