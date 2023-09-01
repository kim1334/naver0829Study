package bit701.day0901;

import java.util.Scanner;

public class Ex2_ddi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 태어난 년도를 입력받아 띠를 구해보세요
		// 서기 1년이 닭띠의 해
		// 태어난 연도를 12로 나눴을때 1이면 닭띠.
		// 쥐소호랑이토끼용뱀말양원숭이닭개돼지
		// 서기 1부터 차례대로 
		// 닭 개 돼지 쥐 소 호랑이 토끼 용 뱀 말 양 원숭이
		
		Scanner sc = new Scanner(System.in);
		System.out.println("태어난 년도는?");
		
		int year = sc.nextInt();
		// 12로 나눈 나머지를 구한다
		int m = year % 12;
		// 띠를 구해보자 서기 1년 닭, 12년 원숭이
		
		String ddi = m == 0? "원숭이" : m == 1? "닭" :
			m == 2? "개" : m == 3? "돼지" :
			m == 4? "쥐" : m == 5? "소" : m == 6? "호랑이" :
			m == 6? "토끼" : m == 7? "용" :
			m == 8? "뱀" : m == 9? "말" : "양";
		
		System.out.println(year + "년생은" + ddi + "띠입니다");
								
 		

	}

}
