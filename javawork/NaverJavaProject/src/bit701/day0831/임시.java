package bit701.day0831;

import java.text.NumberFormat;
import java.util.Scanner;

public class 임시 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 선생님이 풀어준 퀴즈 
		Scanner sc = new Scanner(System.in);
		NumberFormat numFormat = NumberFormat.getInstance();
		
		String sangpum = "";
		int su = 0, dan = 0, total = 0;
		
		System.out.println("상품명");
		sangpum = sc.nextLine();
		
		System.out.println("수량");
		su = sc.nextInt();
		
		System.out.println("단가");
		dan = sc.nextInt();
		
		total = su*dan;
		
		System.out.println("총금액 = " +numFormat.format(total) + "원");
		//넘포멧은 콤마를 넣기 때문에 스트링이다. 기억@!!!
		
		// 5개이상 할인받는 조건 
		if(su >= 5) {
			total = (int)(total*0.9);
			System.out.printf("5개 이상 10프로 할인된 금액 : %d 원\n",total);
			System.out.printf("5개 이상 10%% 할인된 금액 %s 원\n",numFormat.format(total));
			// 프린트f를 사용할때 문자열 %를 사용하고 싶으면 %% 두번 하면 된다
		}

	}

}
