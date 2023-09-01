package bit701.day0831;

import java.text.NumberFormat;
import java.util.Scanner;

public class Ex10_Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//상품명과 수량, 단가를 각각 입력받은 후 총금액을 출력하시오
		// 그리고 수량이 5개 이상일 경우 10프로할인된 최종 금액도 출력해주세요\
		
		// (예)
		// 상품명 : 딸기
		// 수량 : 6
		// 단가 : 1000
		
		// 총금액 : 6000원
		// 5개 이상 10프로 할인된 금액 : 5400원
		Scanner sc = new Scanner(System.in);
		
		System.out.println("상품 명을 입력해 주세요");
		String name = sc.nextLine();
		
		System.out.println("구매하실 수량을 입력해주세요");
		int count = sc.nextInt();
		
		System.out.println(name + "단가");
		int price = sc.nextInt();
		
		System.out.println("총금액 : " + (count*price) + "원");
		
		if(count >=5) {
			price = (price*count)-(price*count/10);
			System.out.println("5개 이상 10프로 할인된 금액 : " + price);	
		} else {
			System.out.println("미안합니다 할인 대상이 아닙니다");
			
			

			
		
		}
	}

}
