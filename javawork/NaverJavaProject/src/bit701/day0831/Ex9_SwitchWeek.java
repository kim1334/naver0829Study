package bit701.day0831;

import java.util.Scanner;

public class Ex9_SwitchWeek {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		// 년도와 월을 입력하면 몇일가지 있는지 출력해보자
		// 일단 해당 년도가 윤년인지 아닌지부터 판단해보자
		
		System.out.println("년도 4자리 숫자 입력");
		int year = sc.nextInt();
		System.out.println("월(1~12) 입력");
		int month = sc.nextInt();
		
		// 잘못 월을 입력한 경우 종료한다
		if(month < 1 || month >12) {
			System.out.println("월을 잘못 입력했어요!!");
			return;

		}
		System.out.printf("입력한 년도의 월 : %d년 %d월\n\n",year,month);
		
		int days = 0;
		boolean b = year%4==0 && year%100 !=0 || year%400==0;
		// 위와 같은 공식이 나오는 이유는 태양년의 길이와 연도의 길이를 맞추기 위해서 있다
		// 윤년은 4로 나누어지고 100으로 나누어지면 안된다
		// 윤년은 100으로 나누어지고 400으로 나누어지면 윤년이 된다
		// 그 이유는 태양녀의 길이와 관련이 있다 인간 사회의 연도와 계절에 따른 태양년의
		// 연도를 최대한 일치시키기 위함이다.
		
//		if(b==true) System.out.println("윤년");
		if(b) System.out.println("윤년"); // 조건에서 true는 생략가능b==false 는 !b로 주로 사용 
		else System.out.println("평년");
		System.out.println();
		
		switch(month) {
		case 2:
			days = b? 29:28; // b가 true면 윤년이므로 29일, 아닐 경우 평년이므로 28일
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			days = 30;
			break;
		default:
			days = 31;
			}
		
		System.out.printf("%d 년 %d 월은 %d 일까지 있어요!!\n",year,month,days);
		

	}

}
