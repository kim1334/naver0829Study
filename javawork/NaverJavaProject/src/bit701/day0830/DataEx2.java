package bit701.day0830;

public class DataEx2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("내 이름은 "+args[0]+" 입니다");
		System.out.println("우리집은 "+args[1]+" 입니다");
		System.out.println("내 혈액형은 "+args[2]+" 입니다");
	// args에 값을 넣는 방법은 먼저 실행시켜서 예외를 발생시킨 후
	// 위에 런 > 실행 표시 밑 화살표를 클릭하여 Run Configurations 클릭
	// 클래스명 클릭 후 Arguments 카테고리 눌러 위 콘솔에 값을 순서대로 넣는다
		
		System.out.println("=================");
		System.out.println("실수형 데이터 타입");
		float f1 = 1234.567891234f; //4바이트 float으로 값을 지정하려면 f를 같이 입력
		double f2 = 1234.567891234;
		System.out.println(f1);
		System.out.println(f2);
	// float는 소숫점 포함해서 8자리까지만 정확하게, 그 이후는 반올림처리하여 출력된다
	// double는 소숫점 포함하여 15자리까지만 정확하게 출력된다.
		
	// char 타입은 2바이트라 한글도 저장 가능하다.	
		char ch1 = 'A';
		char ch2 = '가';
		System.out.println(ch1);
		System.out.println(ch2);
		
		

	}

}
