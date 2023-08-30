package bit701.day0830;

public class ExamEx8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// money 변수에 args[0] 값을 대입후 ( 급여 : 백만단위 : 5674321 )
		
		
		// 출력
		// money : 5674321 원
		// 만원짜리 567 장
		// 천원짜리 4장
		// 백원짜리 3개
		// 십원짜리 2개
		// 일원짜리 1개
		
		
		// 산술 연산자를 사용해서 출력해 보세요.
		
		
		int money = Integer.parseInt(args[0]);
		
		 
		System.out.println("money : " + money + "원");
		System.out.println("만원짜리 : " + (money / 10000) + "장");
		System.out.println("천원짜리 : " + (money / 1000) %10 + "장");
		System.out.println("백원짜리 : " + (money / 100) %10 + "장");
		System.out.println("십원짜리 : " + (money / 10) %10 + "장");
		System.out.println("일원짜리 : " + (money / 1) %10 + "장");
		
	}

}
