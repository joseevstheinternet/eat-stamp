<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>

    <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>EatStamp - 메인</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/main.css'/>" />
    <%-- <link type="script" rel="stylesheet" href="<c:url value='/css/egovframework/main.css'/>" /> --%>
    <%-- <script src="<c:url value='/js/main.js'/>" /> --%>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script> -->
</head>

<body>
<div class="page-main">
	<c:if test="${!empty member}">
		<div class="section" id="section1">
			<div class="section1-1">
				<img src="${pageContext.request.contextPath}/images/egovframework/common/logo_full.png" class="main-logo">
				<div class="section1-1-1">
					<span class="main-text text-color">${member.mem_nick} 님,</span>
					<span class="main-text">맛있는 게 땡기는 하루예요!</span>
				</div>
			</div>
			<div id="section1-2" class="yello-box">
				<span class="box-text">매일매일 꾸준히 기록해요!</span>
				<i class="fa-solid fa-utensils icon1"></i>
				<button type="button" onclick="location.href='stamp/write2.do'" class="box-button">오늘 식사 기록하기</button>
				<!-- 글쓰기 페이지로 이동 -->
			</div>
		</div>
		<div class="section" id="section2">
			<div id="section2-1">
				<span class="main-title">가장 많이 등록된 키워드</span>
					<table>
						<tr>
					        <c:choose>
					            <c:when test="${!empty rMap}">
					                <c:forEach var="rMap" items="${rMap}">
					                    <td>${rMap.key}</td>
					                </c:forEach>
					            </c:when>
					            <c:otherwise>
					            	<div class="no-list">
					            		<span class="no-list">더 많은 기록을 남겨 보세요!</span>
					            	</div>
					            </c:otherwise>
					        </c:choose>
						</tr>
					</table>

					<script type="text/javascript">
					function randomDullColor() {
						  const colors = [
						    "#BFC8D7","#E2D2D2","#A2B59F","#D2D5B8","#BDC2BB",
						    "#C9BA9B","#D18063","#C9CBE0","#909FA6","#D5CB8E",
						    "#ECD4D4","#CCDBE2","#DEB3CF","#EECFBB","#F6B99D",
						    "#D5E1DF","#EACACB","#E2B3A3","#A3B6C5","#B1D3C5",
						    "#CFDD8E","#E4BEB3","#F5DDAD","#F1BCAE","#C9DECF",
						  ];
						  const randomIndex = Math.floor(Math.random() * colors.length);
						  const mixColor = colors[randomIndex];
						  
						  // 선택된 색상을 배열에서 제거 (색상이 중복되지 않도록)
						  colors.splice(randomIndex, 1);
						  
						  console.log(mixColor);
						  return mixColor;
						}
					
					for(td of document.getElementsByTagName('td')){
						  td.style.backgroundColor = randomDullColor();
						}
					</script>
					
					
					<span class="main-title">내가 좋아할 만한 식당</span>
						<c:if test="${recCount == 0}">
							<div class="slider">
								<div class="inner">
									<div class="swiper-wrapper card-box-wrap">
									<c:forEach var="rest" items="${rest}">
										<div class="swiper-slide card-box" onclick="location.href='rest_detail.do?r_num=${rest.r_num}'">
											<i class="fa-solid fa-image card-box-image"></i>
											<div class="card-box-column">
												<span class="card-box-title">${rest.r_name}</span>
												<span class="card-box-contents">${rest.r_tel}</span>
												<span class="card-box-contents">${rest.r_add}</span>
											</div>
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${recCount > 0}">
							<!-- 슬라이드 -->
						<div class="slider">
							<div class="inner">
								<div class="swiper-wrapper card-box-wrap">
								<c:forEach var="recRest" items="${recRest}">
									<div class="swiper-slide card-box" onclick="location.href='rest_detail.do?r_num=${recRest.r_num}'">
										<c:if test="${recRest.r_fileName == null}">
											<i class="fa-solid fa-image card-box-image"></i>
										</c:if>
										<c:if test="${recRest.r_fileName != null}">
											<img id="imgfile" src="${pageContext.request.contextPath}
												/images/restImage/${recRest.r_fileName}">
										</c:if>
										
										<div class="card-box-column">
											<span class="card-box-title">${recRest.r_name}</span>
											<span class="card-box-contents">${recRest.r_tel}</span>
											<span class="card-box-contents">${recRest.r_add}</span>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!-- 네비게이션 -->
<!-- 							<div class="swiper-button-next">이전</div>다음 버튼 (오른쪽에 있는 버튼)
							<div class="swiper-button-prev">다음</div>이전 버튼 -->
						</div>
						</c:if>
			</div>
		</div>
		<div class="section" id="section3">
			<div id="section3-1">
				<div class="section3-1-1">
					<span class="main-title" style="width: 600px;">내 식사 기록</span>
					<div class="section3-1-2" onclick="location.href='stamp/list.do'">
						<span class="main-detail">내 기록 모두 보기</span>
						<i class="fa-solid fa-ellipsis dotsIcon"></i>
					</div>
				</div>
						<c:if test="${count == 0}">
							<div class="no-list"><span class="no-list">식사 기록이 없습니다.</span></div>
						</c:if>
						<c:if test="${count > 0}">
							<!-- 내가 쓴 글 슬라이드 -->
						<div class="slider">
							<div class="inner">
								<div class="swiper-wrapper card-box-wrap">
								<c:forEach var="stamp" items="${stamp}">
									<div class="swiper-slide card-box" onclick="location.href='stamp/detail.do?s_num=${stamp.s_num}'">
										<input type="hidden" value="${stamp.mem_num}">
										<c:if test="${stamp.s_fileName == null}">
											<i class="fa-solid fa-image imageIcon"></i>
										</c:if>
										<c:if test="${stamp.s_fileName != null}">
											<img id="imgfile" src="${pageContext.request.contextPath}
												/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}">
										</c:if>
										<div class="card-box-column">
											<span class="card-box-title">${stamp.s_title}</span>
											<c:choose>
												<c:when test="${fn:length(stamp.s_content) gt 34}">
													<span class="card-box-contents">${fn:substring(stamp.s_content,0,33)} …</span>
												</c:when>
												<c:otherwise>
													<span class="card-box-contents">${stamp.s_content}</span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!-- 네비게이션 -->
<!-- 							<div class="swiper-button-next">이전</div>다음 버튼 (오른쪽에 있는 버튼)
							<div class="swiper-button-prev">다음</div>이전 버튼 -->
						</div>
						</c:if>
						<div class="section3-1-1">
							<span class="main-title" style="width: 600px;">찜한 식당</span>
							<div class="section3-1-2" onclick="location.href='rest_list.do'">
								<span class="main-detail">찜한 식당 모두 보기</span>
								<i class="fa-solid fa-ellipsis dotsIcon"></i>
							</div>
						</div>
						
						<c:if test="${likeCount == 0}">
							<div class="no-list"><span class="no-list">찜한 식당이 없습니다.</span></div>
						</c:if>
						<c:if test="${likeCount > 0}">
							<!-- 찜한 식당 슬라이드 -->
						<div class="slider">
							<div class="inner">
								<div class="swiper-wrapper card-box-wrap">
								<c:forEach var="likeRest" items="${likeRest}">
									<div class="swiper-slide card-box" onclick="location.href='rest_detail.do?r_num=${likeRest.r_num}'">
										<c:if test="${likeRest.r_fileName == null}">
											<i class="fa-solid fa-image card-box-image"></i>
										</c:if>
										<c:if test="${likeRest.r_fileName != null}">
											<img id="imgfile" src="${pageContext.request.contextPath}
												/images/restImage/${likeRest.r_fileName}">
										</c:if>
										<div class="card-box-column">
											<span class="card-box-title">${likeRest.r_name}</span>
											<span class="card-box-contents">${likeRest.r_tel}</span>
											<span class="card-box-contents">${likeRest.r_add}</span>
										</div>
									</div>
								</c:forEach>
								</div>
							</div>
							<!-- 네비게이션 -->
<!-- 							<div class="swiper-button-next">이전</div>다음 버튼 (오른쪽에 있는 버튼)
							<div class="swiper-button-prev">다음</div>이전 버튼 -->
						</div>
						</c:if>
				</div>
			</div>
			</div>
		</div>
		
		
	</c:if>
	<c:if test="${empty member}">
		<div class="section">
			<div class="section1-1">
				<img src="${pageContext.request.contextPath}/images/egovframework/common/logo_full.png" class="main-logo">
				<div class="section1-1-1">
					<span class="main-text text-color">매일 식사 기록을 위해</span>
					<span class="main-text">로그인하세요!</span>
				</div>
			</div>
			<div class="unsection">
				<button type="button" onclick="location.href='<%=request.getContextPath() %>/login.do';" class="box-button2">Login</button>
				<button type="button" onclick="location.href='<%=request.getContextPath() %>/join.do';" class="box-button2">Sign Up</button>
			</div>
			<div id="section3-1">
				<span class="main-title">오늘의 추천 식당</span>
				
					<div class="slider">
						<div class="inner">
							<div class="swiper-wrapper card-box-wrap">
							<c:forEach var="rest" items="${rest}">
								<div class="swiper-slide card-box">
									<c:if test="${rest.r_fileName == null}">
										<i class="fa-solid fa-image card-box-image"></i>
									</c:if>
									<c:if test="${rest.r_fileName != null}">
										<img id="imgfile" src="${pageContext.request.contextPath}
											/images/restImage/${rest.r_fileName}">
									</c:if>
									<div class="card-box-column">
										<span class="card-box-title">${rest.r_name}</span>
										<span class="card-box-contents">${rest.r_tel}</span>
										<span class="card-box-contents">${rest.r_add}</span>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
					
			</div>
		</div>
	</c:if>

</div>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>