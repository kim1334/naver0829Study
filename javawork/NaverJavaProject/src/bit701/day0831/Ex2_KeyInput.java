package bit701.day0831;

import java.util.Date;
import java.util.Scanner;

public class Ex2_KeyInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Date 클래스를 이용해서 현재 년도를 구해보자 (jdk 1.1에서 deprecate 되었지만
		// 여전히 많이 사용한다.
		// 권장 : Calendar를 권장하나, Calendar 보다 Date를 많이 사용함
		Date date = new Date();
		
		// getYear는 1900을 뺀 값이 반환이 된다
		int curYear = date.getYear()+1900; // getYear 줄 찍 간 이유는 deprecate 되었기 때문
		System.out.println("현재 년도 : " + curYear);
		
		
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("당신의 태어난 년도는?");
		// 문자열로 읽은 후 숫자로 변환하면 다음에 
        // 문자열이 입력될 경우에도 문제가 발생하지 않음
		int birthYear = Integer.parseInt(sc.nextLine());
		
		System.out.println("지금 사는 곳은 어디입니까?");
		String address = sc.nextLine();
		
		// 나이 구하기
		int age = curYear-birthYear;
		
		System.out.println
		("저는 " + address + "에 사는 " + birthYear + "년생("+age+"세) 학생입니다");
		System.out.printf("저는 %s에 사는 %d년생(%d세) 학생입니다\n",address,birthYear,age);
		
		// 20세 이상이면 "성인", 미만이면 "미성년자"라는 글자를 출력
		// if문으로 해도 되고 조건(상항)연산자 (조건식? 조건true값 : 조건false값)로 해도 된다
		
		
//		String msg = age >=20? "성인" : "미성년자";
		
		// if문으로 할경우
		String msg=""; // 지역 변수는 자동 초기화가 안되고 쓰레기 값이 들어가있으므로
					   // 값이 안 들어갈 경우를 대비해서 초기값을 지정하는 것이 좋다.
					   // 지역 변수는 그 구역을 빠져나가게 되면 자동 소멸 되므로 사용이 불가능하다
		if(age >= 20) { // 한문장 일 경우 '{ }' 블록 생략 가능하지만 두문장일 경우 반드시 블록 설정
			msg = "성인";	
		}else {
			msg = "미성년자";
		}
		System.out.println("당신은 " +msg);	
		

	}

}
