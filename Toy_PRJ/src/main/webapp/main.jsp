<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	
<title>아임웹 기능 소개</title>


<link rel="stylesheet" type="text/css"  href="https://vendor-cdn.imweb.me/css/bootstrap.css?1630317764"/>
<link rel="stylesheet" type="text/css"  href="https://vendor-cdn.imweb.me/css/main/style.css?1657576839"/>





</head>
<body id="snowfall">

<div class="ch-btn" style="display: none;">
	<a href="javascript:;"></a>
</div>
<div id="loader" class="se-pre-con style-gray" style="display: none;">
	<div class="page-loader-spinner">
		<div class="double-bounce1"></div>
		<div class="double-bounce2"></div>
	</div>
	<div class="loader-text text-semi-bold text-24 _loader_text">사이트를 구성 중입니다. 잠시만 기다려주세요.</div>
</div>

<nav id="imweb-navbar" class="navbar navbar-default navbar-overlay" aria-label="Navigation" itemscope="" itemtype="http://schema.org/SiteNavigationElement">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed _nav_btn" onclick="MOBILE_SLIDE_NAVIGATION.slideNavToggle();">
				<span class="sr-only">Toggle navigation</span>
				<i class="btl bt-bars"></i>
			</button>
				<a class="navbar-brand" href="/" title="I'm web." rel="home">
				<img class="img-responsive _brand_white brand-white" src="https://vendor-cdn.imweb.me/images/main/imweb_new_logo_white_88.png" alt="아임웹">
				<img class="img-responsive scroll_logo" src="https://vendor-cdn.imweb.me/images/main/imweb_new_logo_blue_88.png" alt="아임웹">
				<span class="sr-only">아임웹</span>
			</a>
		</div>
		<div class="navbar-wrap" id="imweb-navbar-wrap">
			<div class="collapse navbar-collapse" id="imweb-navbar-collapse" aria-expanded="true">
				<ul class="nav navbar-nav nav_center_container">
				<li role="menuitem" class="hidden-sm hidden-xs">
				<div class="dropdown menu">
				<a class="menu_btn active" role="button" href="/features" title="" itemprop="url" role="button">
					<span class="nav-item-name">주요기능</span>
					<i class="menu_icon icon-arrow-down"></i>
				</a>
				<div class="dropdown-menu ">
				<ul>
				<li>
				<a class="dropdown-item " href="/features"  role="menuitem" tabindex="-1" itemprop="url"><span style="">웹사이트</span></a></li><li><a class="dropdown-item " href="/features#section3"  role="menuitem" tabindex="-1" itemprop="url">
				<span style="">쇼핑몰</span></a></li>
				<li><a class="dropdown-item " href="/global_shopping"  role="menuitem" tabindex="-1" itemprop="url"><span style="">글로벌 판매</span></a></li><li><a class="dropdown-item " href="/appstore"  role="menuitem" tabindex="-1" itemprop="url">
				<span style="">앱스토어</span></a></li>
				<li><a class="dropdown-item nowrap" href="https://ad.imweb.me/main?utm_source=imweb&utm_medium=link_click&utm_campaign=main_menu" target="_blank" role="menuitem" tabindex="-1" itemprop="url">
				<img src="https://vendor-cdn.imweb.me/images/main/favicon-imwebad32.png" class="fas fa-poll vertical-middle vertical-middle margin-right-xl" width="15" height="15"><span style="">
				<em class="letter-space-sm">통합광고관리 (아임웹 애드)</em></span></a></li></ul></div></div></li><li role="menuitem" class="hidden-sm hidden-xs"><div class="dropdown menu">
				
				<a class="menu_btn " role="button" href="/theme" title="" itemprop="url" role="button">
					<span class="nav-item-name">템플릿</span>
				</a></div></li><li role="menuitem" class="hidden-sm hidden-xs"><div class="dropdown menu"><a class="menu_btn " role="button" href="/best_production_list" title="" itemprop="url" role="button">
					<span class="nav-item-name">고객사례</span><i class="menu_icon icon-arrow-down"></i>
				</a><div class="dropdown-menu "><ul><li><a class="dropdown-item " href="/best_production_list"  role="menuitem" tabindex="-1" itemprop="url"><span style="">고객사례</span></a></li><li><a class="dropdown-item " href="/interview"  role="menuitem" tabindex="-1" itemprop="url"><span style="">고객 인터뷰</span></a></li><li><a class="dropdown-item nowrap" href="/find_designer"  role="menuitem" tabindex="-1" itemprop="url"><i class="fas fa-paper-plane  vertical-middle text-14 vertical-middle text-redorange margin-right-xl"></i><span style="">디자이너 찾기</span></a></li></ul></div></div></li><li role="menuitem" class="hidden-sm hidden-xs"><div class="dropdown menu"><a class="menu_btn " role="button" href="/price" title="" itemprop="url" role="button">
					<span class="nav-item-name">요금</span>
				</a></div></li><li role="menuitem" class="hidden-sm hidden-xs"><div class="dropdown menu"><a class="menu_btn " role="button" href="/find_designer" title="" itemprop="url" role="button">
					<span class="nav-item-name">디자이너 찾기</span>
				</a></div></li><li role="menuitem" class="hidden-sm hidden-xs"><div class="dropdown menu"><a class="menu_btn " role="button" href="/customer" title="" itemprop="url" role="button">
					<span class="nav-item-name">고객지원</span><i class="menu_icon icon-arrow-down"></i>
				</a><div class="dropdown-menu "><ul><li><a class="dropdown-item " href="/faq"  role="menuitem" tabindex="-1" itemprop="url"><span style="">가이드</span></a></li><li><a class="dropdown-item " href="/edu"  role="menuitem" tabindex="-1" itemprop="url"><span style="font-weight: bold; color: #1a6dff;">온라인 교육</span></a></li><li><a class="dropdown-item " href="/video_lecture"  role="menuitem" tabindex="-1" itemprop="url"><span style="">동영상 강의</span></a></li><li><a class="dropdown-item " href="/blog"  role="menuitem" tabindex="-1" itemprop="url"><span style="">블로그 <span class="badge badge-new">NEW</span></span></a></li><li><a class="dropdown-item " href="/notice"  role="menuitem" tabindex="-1" itemprop="url"><span style="">아임웹 소식</span></a></li><li><a class="dropdown-item " href="/qna"  role="menuitem" tabindex="-1" itemprop="url"><span style="">문의하기</span></a></li></ul></div></div></li></ul>				<ul class="nav navbar-nav nav_center_container"><li id="nav-item-navbar-left-more" class="nav-item-more mobile hidden-lg hidden-md" style="display: block;" role="menuitem" aria-hidden="false"><div id="navbar-more-container-mobile" class="imweb-navbar-more mobile"><div class="container"><ul class="page-nav" id="navWrap"><li class="page-nav-item" id='heading1'><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">주요기능<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapse1" aria-labelledby="heading1" data-parent="#navWrap"><li class="page-nav-sub-item"><a style="display: inline-block" href="/features"  role="button">웹사이트</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/features#section3"  role="button">쇼핑몰</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/global_shopping"  role="button">글로벌 판매</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/appstore"  role="button">앱스토어</a></li><li class="page-nav-sub-item"><img src="https://vendor-cdn.imweb.me/images/main/favicon-imwebad32.png" class="fas fa-poll vertical-middle vertical-middle margin-right-xl" width="15" height="15"><a style="display: inline-block" href="https://ad.imweb.me/main?utm_source=imweb&utm_medium=link_click&utm_campaign=main_menu" target="_blank" role="button"><em class="letter-space-sm">통합광고관리 (아임웹 애드)</em></a></li></ul></li><li class="page-nav-item"><a href="/theme" role="button">템플릿</a></li><li class="page-nav-item" id='heading2'><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">고객사례<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapse2" aria-labelledby="heading2" data-parent="#navWrap"><li class="page-nav-sub-item"><a style="display: inline-block" href="/best_production_list"  role="button">고객사례</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/interview"  role="button">고객 인터뷰</a></li><li class="page-nav-sub-item"><i class="fas fa-paper-plane  vertical-middle text-redorange margin-right-xl vertical-middle" style="font-size: 16px;"></i><a style="display: inline-block" href="/find_designer"  role="button">디자이너 찾기</a></li></ul></li><li class="page-nav-item"><a href="/price" role="button">요금</a></li><li class="page-nav-item"><a href="/find_designer" role="button">디자이너 찾기</a></li><li class="page-nav-line"></li><li class="page-nav-item" id='heading3'><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">고객지원<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapse3" aria-labelledby="heading3" data-parent="#navWrap"><li class="page-nav-sub-item"><a style="display: inline-block" href="/faq"  role="button">가이드</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/edu"  role="button">온라인 교육</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/video_lecture"  role="button">동영상 강의</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/blog"  role="button">블로그 <span class="badge badge-new">NEW</span></a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/notice"  role="button">아임웹 소식</a></li><li class="page-nav-sub-item"><a style="display: inline-block" href="/qna"  role="button">문의하기</a></li></ul></li><li class="page-nav-item"><a href="/login" role="button">로그인</a></li><li class="page-nav-login"><a href="/theme" title="Contact" itemprop="url" class="btn btn-lg btn-primary full-width">무료 시작하기</a></li></ul>
				</div>
				</div></li></ul>			
				</div>
		</div>
		
		<ul id="navbar-right" class="nav navbar-nav navbar-right" role="menubar">
			<li id="nav-item-navbar-right-account" class="nav-item menu_btn hidden-md hidden-lg float_r" role="menuitem">
				<a href="/login" title="로그인" itemprop="url" class="btn btn-default btn-login">
					<span class="text-14">My</span>
				</a>
			</li><li id="nav-item-navbar-right-account" class="nav-item hidden-sm hidden-xs" role="menuitem">
				<a href="/login" title="로그인" itemprop="url" class="btn menu_btn btn-default">
					<span class="nav-item-icon at-icons at-user-male" aria-hidden="true"></span>
					<span class="nav-item-name" itemprop="name">로그인</span>
				</a>
			</li>		</ul>
			</div>
	<div class="headline-overlay"></div>
</nav>

<footer class="main-footer">
	<div class="container">
				<div class="row footer-container hidden-xs">
			<div class="col-md-10 col-sm-12">
				<ul class="page-nav clearfix">
					<li class="page-nav-item">
					<a href="/features" ><span class="page-nav-title" style="opacity: 1">주요기능</span></a><ul class="page-nav-links"><li class="page-nav-links-item"><a href="/features" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">웹사이트</span>
									</a><a href="/features#section3" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">쇼핑몰</span>
									</a><a href="/global_shopping" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">글로벌 판매</span>
									</a><a href="/appstore" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">앱스토어</span>
									</a><a href="/price" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">요금</span>
									</a></li></ul></li><li class="page-nav-item"><a href="/theme" ><span class="page-nav-title" style="opacity: 1">둘러보기</span></a><ul class="page-nav-links"><li class="page-nav-links-item"><a href="/theme" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">템플릿</span>
									</a><a href="/best_production_list" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">고객사례</span>
									</a><a href="/interview" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">고객 인터뷰</span>
									</a></li></ul></li><li class="page-nav-item"><a href="/find_designer" ><span class="page-nav-title" style="opacity: 1">컨설팅</span></a><ul class="page-nav-links"><li class="page-nav-links-item"><a href="/find_designer" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">디자이너 찾기</span>
									</a><a href="https://ad.imweb.me/event" role="menuitem" tabindex="-1" itemprop="url" target="_blank">
										<span class="dropdown-menu-item-label" itemprop="name">아임웹 애드</span>
									</a></li></ul></li><li class="page-nav-item"><a href="/customer" ><span class="page-nav-title" style="opacity: 1">고객지원</span></a><ul class="page-nav-links"><li class="page-nav-links-item"><a href="/faq" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">가이드</span>
									</a><a href="/edu" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">온라인 교육</span>
									</a><a href="/video_lecture" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">동영상 강의</span>
									</a><a href="/blog" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">블로그 <span class="badge badge-new">NEW</span></span>
									</a><a href="/notice" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">아임웹 소식</span>
									</a><a href="/qna" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">문의하기</span>
									</a><a href="/notice?category=update" role="menuitem" tabindex="-1" itemprop="url" >
										<span class="dropdown-menu-item-label" itemprop="name">업데이트 소식</span>
									</a></li></ul></li><li class="page-nav-item"><a href="https://team.imweb.me" target="_blank"><span class="page-nav-title" style="opacity: 1">기업소개</span></a><ul class="page-nav-links"><li class="page-nav-links-item"><a href="https://team.imweb.me" role="menuitem" tabindex="-1" itemprop="url" target="_blank">
										<span class="dropdown-menu-item-label" itemprop="name">소개</span>
									</a><a href="https://team.imweb.me/alliance" role="menuitem" tabindex="-1" itemprop="url" target="_blank">
										<span class="dropdown-menu-item-label" itemprop="name">제휴문의</span>
									</a><a href="https://team.imweb.me/patent" role="menuitem" tabindex="-1" itemprop="url" target="_blank">
										<span class="dropdown-menu-item-label" itemprop="name">특허/인증서</span>
									</a><a href="https://imweb.notion.site/imweb/e87681a4b94c46f4b6b92346eb071e89" role="menuitem" tabindex="-1" itemprop="url" target="_blank">
										<span class="dropdown-menu-item-label" itemprop="name">채용<span class="badge badge-progress">진행중</span></span>
									</a></li></ul></li>				</ul>
			</div>
		
		</div>
		
				<div class="row visible-xs">
			<div class="col-md-12">
				<div id="navbar-more-container-mobile-foot" class="imweb-navbar-more mobile">
					<div class="container">
						<ul class="page-nav clearfix" id="navWrap">
							<li class="page-nav-item" id="footHeading1"><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapseFoot1" aria-expanded="false" aria-controls="collapseFoot1">주요기능<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapseFoot1" aria-labelledby="heading1" data-parent="#navWrap"><li class="page-nav-sub-item"><a href="/features" role="button" >웹사이트</a></li><li class="page-nav-sub-item"><a href="/features#section3" role="button" >쇼핑몰</a></li><li class="page-nav-sub-item"><a href="/global_shopping" role="button" >글로벌 판매</a></li><li class="page-nav-sub-item"><a href="/appstore" role="button" >앱스토어</a></li><li class="page-nav-sub-item"><a href="/price" role="button" >요금</a></li></ul></li><li class="page-nav-line"></li><li class="page-nav-item" id="footHeading2"><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapseFoot2" aria-expanded="false" aria-controls="collapseFoot2">둘러보기<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapseFoot2" aria-labelledby="heading2" data-parent="#navWrap"><li class="page-nav-sub-item"><a href="/theme" role="button" >템플릿</a></li><li class="page-nav-sub-item"><a href="/best_production_list" role="button" >고객사례</a></li><li class="page-nav-sub-item"><a href="/interview" role="button" >고객 인터뷰</a></li></ul></li><li class="page-nav-line"></li><li class="page-nav-item" id="footHeading3"><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapseFoot3" aria-expanded="false" aria-controls="collapseFoot3">컨설팅<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapseFoot3" aria-labelledby="heading3" data-parent="#navWrap"><li class="page-nav-sub-item"><a href="/find_designer" role="button" >디자이너 찾기</a></li><li class="page-nav-sub-item"><a href="https://ad.imweb.me/event" role="button" target="_blank"><em class="letter-space-sm">통합광고관리 (아임웹 애드)</em></a></li></ul></li><li class="page-nav-line"></li><li class="page-nav-item" id="footHeading4"><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapseFoot4" aria-expanded="false" aria-controls="collapseFoot4">고객지원<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapseFoot4" aria-labelledby="heading4" data-parent="#navWrap"><li class="page-nav-sub-item"><a href="/faq" role="button" >가이드</a></li><li class="page-nav-sub-item"><a href="/edu" role="button" >온라인 교육</a></li><li class="page-nav-sub-item"><a href="/video_lecture" role="button" >동영상 강의</a></li><li class="page-nav-sub-item"><a href="/blog" role="button" >블로그 <span class="badge badge-new">NEW</span></a></li><li class="page-nav-sub-item"><a href="/notice" role="button" >아임웹 소식</a></li><li class="page-nav-sub-item"><a href="/qna" role="button" >문의하기</a></li><li class="page-nav-sub-item"><a href="/notice?category=update" role="button" >업데이트 소식</a></li></ul></li><li class="page-nav-line"></li><li class="page-nav-item" id="footHeading5"><a href="javascript:;" role="button" data-toggle="collapse" data-target="#collapseFoot5" aria-expanded="false" aria-controls="collapseFoot5">기업소개<i class="page-nav-icon icon-arrow-down"></i></a><ul class="page-nav-sub collapse" id="collapseFoot5" aria-labelledby="heading5" data-parent="#navWrap"><li class="page-nav-sub-item"><a href="https://team.imweb.me" role="button" target="_blank">소개</a></li><li class="page-nav-sub-item"><a href="https://team.imweb.me/alliance" role="button" target="_blank">제휴문의</a></li><li class="page-nav-sub-item"><a href="https://team.imweb.me/patent" role="button" target="_blank">특허/인증서</a></li><li class="page-nav-sub-item"><a href="https://imweb.notion.site/imweb/e87681a4b94c46f4b6b92346eb071e89" role="button" target="_blank">채용<span class="badge badge-progress">진행중</span></a></li></ul></li><li class="page-nav-line"></li>						</ul>
					</div>
				</div>
			</div>
		</div>
		

		<!-- // 모바일용 footer 네비게이션 -->
		<div class="row m-flex">
			<div class="col-md-9 foot-desc order-1">
				<div class="foot-desc-wrap">
			
					<address class="co_address">
						상호명 (주)아임웹
						<span class="bar"></span>
						대표이사 : 이수모
						<span class="bar break-mobile"></span>
						개인정보책임자 : 박재완
						<span class="bar break-mobile"></span>
						사업자등록번호 : 105-87-83592
						<span class="bar break-mobile"></span>
						<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058783592" target="_blank" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1058783592', 'bizCommPop', 'width=750, height=700, top=200, left=500;');return false" class="company-number">통신판매업신고번호 : 제 2016-서울서대문-0066</a>
						<span class="bar break-desktop break-mobile"></span>
						<p class="no-margin">본사 : 서울특별시 서대문구 성산로7길 89-8<span class="bar hidden-xs"></span><br class="hidden-lg hidden-md hidden-sm"/>홍대 오피스 : 서울특별시 마포구 동교로 194 2층</p>
						<span class="text-bright"><a href="/customer">고객지원</a></span> : <a href="/customer"  style="color:#3B4859;">문의 게시판</a> 또는 <a href="javascript:;" onclick="if(typeof ChannelIO != 'undefined'){ChannelIO('show');}" style="color:#3B4859;" >실시간 채팅</a>
						<span class="break-desktop break-mobile"></span>
					</address>
					<p><a href="/terms">이용약관</a><span class="bar margin-left-xl margin-right-xl"></span><a href="/privacy"><strong>개인정보처리방침</strong></a><span class="bar margin-left-xl margin-right-xl"></span><a href="/reseller">리셀러 소개</a></p>
					<!--				<p class="img-foot-aws clearfix">-->
					<!--					<a href="/features/#section7" class="inline-blocked">-->
					<!--						<img src="--><!--/images/main/logo-aws-white.png">-->
					<!--						<span class="blocked">안전한 아임웹 (AWS)</span>-->
					<!--					</a>-->
					<!--					<a href="https://about.imweb.me/patent" class="inline-blocked" target="_blank">-->
					<!--						<img src="--><!--/images/main/logo-patent-white.png">-->
					<!--						<span class="blocked">혁신의 아임웹 (특허등록)</span>-->
					<!--					</a>-->
					<!--				</p>-->
					<p class="margin-bottom-xxl margin-bottom-10-xs">
						<span class="made-by"><span class="made">Made by<i class="fa fa-heart"></i></span><a target="_blank" href="https://team.imweb.me"><span>Imweb Corp.</span></a></span>
					</p>
				</div>
			</div>
			<div class="col-md-3 text-right text-left-sm text-13 order-2">
				<div class="foot-desc-wrap">
					<a href="/kr" title="한국어" class="margin-right-xxl margin-right-14-xs">한국어</a>
					<a href="/tw" title="台灣(中文)">台灣(中文)</a>
				</div>
			</div>
		</div>
	</div>

	
</footer>





</body>
</html>