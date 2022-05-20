<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram</title>
<link rel="shortcut icon" type="image/x-icon" href="https://www.instagram.com/static/images/ico/favicon.ico/36b3ee2d91ed.ico"/>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<link href="${cp}/css/seongho/join/join_birth.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="react_root">
		<section class="section">
			<div></div>
			<!-- 여기서부터 메인 시작 -->
			<main class="main" role="main">
				<div class="large_body_background" style="min-height: 100%;">
					<div class="small_body_background">
						<div class="birth_box">
							<h1 class="insta_blank">Instagram</h1>
							<!-- 여기부터 수정 -->
							<div class="birth_box_start" style="max-width: 350px;">
								<span aria-label="생일 컵케익" class="cake_img"></span>
								<div class="add_birth_box">
									<div class="add_birth_text">생일 추가</div>
								</div>
								<div class="birth_up">
									<div class="birth_up_text">공개 프로필에 포함되지 않습니다.</div>
								</div>
								<div class="why_box">
									<button class="why_btn" type="button">
										<div class="why_btn_text">왜 생일 정보를 입력해야 하나요?</div>
									</button>
								</div>
								<div class="choose_box">
									<div>
										<form name="userBirth" class="userBirth" method="post" action="${cp}/user/UserJoinBirthOk.us" >
										<div class="choose_box_start">
											<span class="birthday">
												<span class="birthday_box">
													<span class="pointer"></span>
													<select name="month" class="number" title="월:">
														<option title="1월" value="1">1월</option>
														<option title="2월" value="2">2월</option>
														<option title="3월" value="3">3월</option>
														<option title="4월" value="4">4월</option>
														<option title="5월" value="5">5월</option>
														<option title="6월" value="6">6월</option>
														<option title="7월" value="7">7월</option>
														<option title="8월" value="8">8월</option>
														<option title="9월" value="9">9월</option>
														<option title="10월" value="10">10월</option>
														<option title="11월" value="11">11월</option>
														<option title="12월" value="12">12월</option>
													</select>
												</span>
												<span class="birthday_box">
													<span class="pointer"></span>
													<select name="day" class="number" title="일:">
														<option title="1" value="1">1</option>
														<option title="2" value="2">2</option>
														<option title="3" value="3">3</option>
														<option title="4" value="4">4</option>
														<option title="5" value="5">5</option>
														<option title="6" value="6">6</option>
														<option title="7" value="7">7</option>
														<option title="8" value="8">8</option>
														<option title="9" value="9">9</option>
														<option title="10" value="10">10</option>
														<option title="11" value="11">11</option>
														<option title="12" value="12">12</option>
														<option title="13" value="13">13</option>
														<option title="14" value="14">14</option>
														<option title="15" value="15">15</option>
														<option title="16" value="16">16</option>
														<option title="17" value="17">17</option>
														<option title="18" value="18">18</option>
														<option title="19" value="19">19</option>
														<option title="20" value="20">20</option>
														<option title="21" value="21">21</option>
														<option title="22" value="22">22</option>
														<option title="23" value="23">23</option>
														<option title="24" value="24">24</option>
														<option title="25" value="25">25</option>
														<option title="26" value="26">26</option>
														<option title="27" value="27">27</option>
														<option title="28" value="28">28</option>
														<option title="29" value="29">29</option>
														<option title="30" value="30">30</option>
														<option title="31" value="31">31</option>
													</select>
												</span>
												<span class="birthday_box">
													<span class="pointer"></span>
													<select name="year" id="year" class="number" title="연도:">
														<option title="2022" value="2022">2022</option>
														<option title="2021" value="2021">2021</option>
														<option title="2020" value="2020">2020</option>
														<option title="2019" value="2019">2019</option>
														<option title="2018" value="2018">2018</option>
														<option title="2017" value="2017">2017</option>
														<option title="2016" value="2016">2016</option>
														<option title="2015" value="2015">2015</option>
														<option title="2014" value="2014">2014</option>
														<option title="2013" value="2013">2013</option>
														<option title="2012" value="2012">2012</option>
														<option title="2011" value="2011">2011</option>
														<option title="2010" value="2010">2010</option>
														<option title="2009" value="2009">2009</option>
														<option title="2008" value="2008">2008</option>
														<option title="2007" value="2007">2007</option>
														<option title="2006" value="2006">2006</option>
														<option title="2005" value="2005">2005</option>
														<option title="2004" value="2004">2004</option>
														<option title="2003" value="2003">2003</option>
														<option title="2002" value="2002">2002</option>
														<option title="2001" value="2001">2001</option>
														<option title="2000" value="2000">2000</option>
														<option title="1999" value="1999">1999</option>
														<option title="1998" value="1998">1998</option>
														<option title="1997" value="1997">1997</option>
														<option title="1996" value="1996">1996</option>
														<option title="1995" value="1995">1995</option>
														<option title="1994" value="1994">1994</option>
														<option title="1993" value="1993">1993</option>
														<option title="1992" value="1992">1992</option>
														<option title="1991" value="1991">1991</option>
														<option title="1990" value="1990">1990</option>
														<option title="1989" value="1989">1989</option>
														<option title="1988" value="1988">1988</option>
														<option title="1987" value="1987">1987</option>
														<option title="1986" value="1986">1986</option>
														<option title="1985" value="1985">1985</option>	
														<option title="1984" value="1984">1984</option>
														<option title="1983" value="1983">1983</option>
														<option title="1982" value="1982">1982</option>
														<option title="1981" value="1981">1981</option>
														<option title="1980" value="1980">1980</option>
														<option title="1979" value="1979">1979</option>
														<option title="1978" value="1978">1978</option>
														<option title="1977" value="1977">1977</option>
														<option title="1976" value="1976">1976</option>
														<option title="1975" value="1975">1975</option>
														<option title="1974" value="1974">1974</option>
														<option title="1973" value="1973">1973</option>
														<option title="1972" value="1972">1972</option>
														<option title="1971" value="1971">1971</option>
														<option title="1970" value="1970">1970</option>
														<option title="1969" value="1969">1969</option>	
														<option title="1968" value="1968">1968</option>
														<option title="1967" value="1967">1967</option>
														<option title="1966" value="1966">1966</option>
														<option title="1965" value="1965">1965</option>	
														<option title="1964" value="1964">1964</option>
														<option title="1963" value="1963">1963</option>
														<option title="1962" value="1962">1962</option>
														<option title="1961" value="1961">1961</option>
														<option title="1960" value="1960">1960</option>
														<option title="1959" value="1959">1959</option>
														<option title="1958" value="1958">1958</option>
														<option title="1957" value="1957">1957</option>
														<option title="1956" value="1956">1956</option>
														<option title="1955" value="1955">1955</option>
														<option title="1954" value="1954">1954</option>
														<option title="1953" value="1953">1953</option>
														<option title="1952" value="1952">1952</option>
														<option title="1951" value="1951">1951</option>
														<option title="1950" value="1950">1950</option>
														<option title="1949" value="1949">1949</option>
														<option title="1948" value="1948">1948</option>
														<option title="1947" value="1947">1947</option>
														<option title="1946" value="1946">1946</option>
														<option title="1945" value="1945">1945</option>
														<option title="1944" value="1944">1944</option>
														<option title="1943" value="1943">1943</option>
														<option title="1942" value="1942">1942</option>
														<option title="1941" value="1941">1941</option>
														<option title="1940" value="1940">1940</option>
														<option title="1939" value="1939">1939</option>
														<option title="1938" value="1938">1938</option>
														<option title="1937" value="1937">1937</option>
														<option title="1936" value="1936">1936</option>
														<option title="1935" value="1935">1935</option>
														<option title="1934" value="1934">1934</option>
														<option title="1933" value="1933">1933</option>
														<option title="1932" value="1932">1932</option>
														<option title="1931" value="1931">1931</option>
														<option title="1930" value="1930">1930</option>
														<option title="1929" value="1929">1929</option>
														<option title="1928" value="1928">1928</option>
														<option title="1927" value="1927">1927</option>
														<option title="1926" value="1926">1926</option>
														<option title="1925" value="1925">1925</option>
														<option title="1924" value="1924">1924</option>
														<option title="1923" value="1923">1923</option>
														<option title="1922" value="1922">1922</option>
														<option title="1922" value="1922">1922</option>
														<option title="1921" value="1921">1921</option>
														<option title="1920" value="1920">1920</option>
														<option title="1919" value="1919">1919</option>
													</select>
												</span>
											</span>
											<div class="choose_text_box">
												<div class="choose_text">태어난 날짜를 입력해야 합니다</div>
											</div>
										</div>
									</div>
								</div>
								<div class="birth_down" style="width: 100%;">
									<div class="birth_down_box">
										<div class="birth_down_text">비즈니스나 반려동물 등을 위한 계정인 경우에도 회원님의 생일 정보를 사용하세요</div>
									</div>
								</div>
								<div class="next_box" style="width: 100%;">
									<button id="next_btn" class="next_btn" disabled type="submit" >다음</button>
								</div>
								<div class="return_box">
									<button class="return_btn" type="button" onclick="location.href='${cp}/user/UserDelete.us'">돌아가기</button>
								</div>
								</form>
							</div>
						</div>
						<!-- 여기부터 그대로 -->
						<div class="have_account">
							<p class="have_account_space">계정이 있으신가요? 
								<a class="have_account_text" data-testid="log-in-link" href="${cp}/instagram/login/login_main.jsp" tabindex="0">로그인</a>
							</p>
						</div>
						<div class="photo_box">
							<p class="photo_up_text">앱을 다운로드하세요.</p>
							<div class="photos">
								<a class="appStore_photo" href="https://apps.apple.com/app/instagram/id389801252?vt=lo" tabindex="0">
									<img class="appStore" alt="App Store에서 이용 가능" src="https://www.instagram.com/static/images/appstore-install-badges/badge_ios_korean-ko.png/4a5c9d62d51b.png">
								</a>
								<a class="googleStore_photo" href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb%26utm_campaign%3DloginPage%26ig_mid%3D1403C4CD-24C8-4A8C-9672-DE1ED85F9226%26utm_content%3Dlo%26utm_medium%3Dbadge" tabindex="0">
									<img class="googleStore" alt="Google Play에서 이용 가능" src="https://www.instagram.com/static/images/appstore-install-badges/badge_android_korean-ko.png/f155b664a93b.png">
								</a>
							</div>
						</div>
					</div> 
				</div> 
			</main>
			<footer class="footer" role="contentinfo">
				<div class="footer_box">
					<div class="box_up">
						<div class="box_up_textboxes"> 
							<div class="Meta">
								<a href="https://about.facebook.com/meta" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="Meta_text">Meta</div>
								</a>
							</div>
							<div class="introduce">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="introduce_text">소개</div>
								</a>
							</div>
							<div class="blog">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="blog_text">블로그</div>
								</a>
							</div>
							<div class="recruit">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none" >
									<div class="recruit_text">채용정보</div>
								</a>
							</div>
							<div class="help">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="help_text">도움말</div>
								</a>
							</div>
							<div class="API">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="API_text">API</div>
								</a>
							</div>
							<div class="privacy">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="privacy_text">개인정보처리방침</div>
								</a>
							</div>
							<div class="terms">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="terms_text">약관</div>
								</a>
							</div>
							<div class="famous">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="famous_text">인기 계정</div>
								</a>
							</div>
							<div class="tag">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="tag_text">해시태그</div>
								</a>
							</div>
							<div class="location">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="location_text">위치</div>
								</a>
							</div>
							<div class="Instagram_Lite">
								<a href="" rel="nofollow noopener noreferrer" target="_blank" style="text-decoration:none">
									<div class="Instagram_Lite_text">Instagram Lite</div>
								</a>
							</div>
						</div> 
					</div>
					<div class="box_down">
						<div class="box_down_left">
							<span class="box_down_left_samesize">
								<div class="box_down_left_textbox">
									<span>한국어</span>
									<div>
										<span style="display: inline-block; transform: rotate(180deg);">
											<svg aria-label="아래쪽 V자형 아이콘" class="v" color="#8e8e8e" fill="#8e8e8e" height="12" role="img" viewBox="0 0 24 24" width="12">
												<path d="M21 17.502a.997.997 0 01-.707-.293L12 8.913l-8.293 8.296a1 1 0 11-1.414-1.414l9-9.004a1.03 1.03 0 011.414 0l9 9.004A1 1 0 0121 17.502z"></path>
											</svg>
										</span>
									</div>
								</div>
								<select class="language_change" aria-label="표시 언어 변경" >
									<option value="af">Afrikaans</option>
									<option value="en">English</option>
									<option value="ko">한국어</option>
									<option value="jp">일본어</option>
									<!-- 옵션 훨씬 많음 -->
								</select>
							</span>
						</div>
						<div class="box_down_right">
							<div class="box_down_right_text">© 2022 Instagram from Meta</div>
						</div>
					</div>
				</div>
			</footer>		
		<!-- 여기까지가 footer -->
		</section>
	</div>
	<div id="fb_root" class="fb_reset">
		<div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>
	<div class="down_line1">
		<div class="down_line2"></div>
	</div>
	<div class="middle_line">
		<div class="middle_dot"></div>
	</div>
	<script> const cp = "${pageContext.request.contextPath}"; </script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${cp}/javascript/seongho/join_birth.js"></script>
</body>
</html>
