package bit701.day0830;

public class OperEx7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 비교 연산자와 논리 연산자, 결과값은 무조건 참(true), 거짓(false)
		
		int kor = 100; // 국어
		int eng = 90; // 영어
		int mat = 100; // 수학

		System.out.println(kor >= 80);  // true
		System.out.println(kor >= 80 || kor != mat); // true OR연산자 이므로 앞이 참이면 뒤 수식 안함.
		System.out.println(kor < 80 || kor != mat); // false
		System.out.println(kor >= 80 && kor != mat); // false
		System.out.println(kor < 80 && kor != mat); // false
		System.out.println(!(kor==mat)); // false
		System.out.println(kor >= 95 && eng >= 95 && mat >= 95); // false
		System.out.println(kor >= 95 && eng >= 95 || mat >= 95); // true
		System.out.println(kor >= 95 || eng >= 95 && mat >= 95); // true
		
		
		int year = 2023;
		// 위의 년도가 윤년인지 아닌지 알아보자
		
		System.out.println(year % 4==0 && year % 100 != 0 || year % 400==0 );
	
		
	}

}
