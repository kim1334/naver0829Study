package bit701.day0905;

import java.util.Scanner;

public class Ex5_While {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		int money = 0;
		int total = 0;
		int num;
		
		Exit:
		while(true) {
			System.out.println("--------------------------------");
			System.out.println("1.예금 : 2.출금 : 3.잔고 : 4.종료");
			System.out.println("--------------------------------");
			System.out.println("선택>");
			num = sc.nextInt();
			
			switch(num){
				case 1:
					System.out.println("예금액>");
					money = sc.nextInt();
					total += money;
					break;
				case 2:
					System.out.println("출금>");
					money = sc.nextInt();
					total -= money;
					break;
				case 3:
					System.out.println("잔고>"+total);
					break;
				case 4:
					System.out.println("프로그램 종료");
					break Exit;
				default:
					System.out.println("숫자를 잘못 입력하셨스습니다 다시 입력하세요");
					break;
					
			}
			
			
		}
		System.out.println("은행 업무를 종료합니다");
		

	}

}
