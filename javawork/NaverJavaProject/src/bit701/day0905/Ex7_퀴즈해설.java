package bit701.day0905;

import java.util.Scanner;

public class Ex7_퀴즈해설 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		String juminNo;
		
		while(true) {
			System.out.println("주민등록 번호 입력");
			juminNo = sc.nextLine();
			// q or Q 입력시 종료
			if(juminNo.equalsIgnoreCase("q")) {
				System.out.println("프로그램 종료");
				break;
			}
			String year = juminNo.substring(0,2);
			String month = juminNo.substring(0,2);
			String day = juminNo.substring(0,2);
			char gender = juminNo.charAt(7);
			System.out.println(year+"년"+month+"월"+day+"일");
			
			if(gender == '1' || gender == '2' || gender == '3' || gender == '4') {
				System.out.println("내국인");
			}else if(gender == '5' || gender =='6') {
				System.out.println("외국인");
			}else {
				System.out.println("8번째 값을 잘못 입력했어요");
			}
			
			
			switch(gender) {
			case '1':
			case '3':
			case '5':
				System.out.println("남자!");
				break;
			case '2':
			case '4':
			case '6':
				System.out.println("여자!");
			default:
				System.out.println("성별 알 수 없음!!");
			}
				
			
		}

	}

}
