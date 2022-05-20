package insta.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//어떤 기능이건 간에 특정한 메소드 하나를 호출해야 하고
//사용자가 요청한 정보를 담은 request와 응답을 위한 response는 무조건 필요하다.
//그 기능을 처리할 메소드, 그것을 담은 클래스들의 틀을 잡기 위한 interface를 생성
public interface Action {
	//다른 곳에서 상속 받아서 재구현 후 기능을 수행하도록 만들 메소드
	//웹에서는 기능을 수행했다면 결과로 두 가지가 나온다.
	//1. 처리된 결과를 가지고 이동할 경로
	//2. 이동할 방식
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
