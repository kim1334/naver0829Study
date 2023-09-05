package bit701.day0905;

import java.util.Scanner;

public class Ex7_Quiz {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 실행결과
		// 주빈번호 입력
		// 920528-1333313
		// 92년05월28일생
		// 내외국인 여부
		// 남녀여부
		// q 누르면 프로그램 종료
		
		Scanner sc = new Scanner(System.in);
		String ssn = "";
		Exit:
		while(true) {
			System.out.println("주민번호 입력>");
			ssn = sc.nextLine();
		
			
			if(ssn.equalsIgnoreCase("q")) {
				System.out.println("프로그램을 종료합니다");
				break;
			}
			
			System.out.print(ssn.substring(0,2)+"년");
			System.out.print(ssn.substring(2,4)+"월");
			System.out.println(ssn.substring(4,6)+"생");
			
			char sex = ssn.charAt(7);
			
		
			
			if(sex<='4') {
				System.out.println("내국인");
				if(sex=='1' || sex=='3') {
					System.out.println("남성");
				}else {
					System.out.println("여성");
				}
			}else if(sex>'4') {
				System.out.println("외국인");
				if(sex=='1' || sex=='3') {
					System.out.println("남성");
				}else {
					System.out.println("여성");
				}
			}
			break Exit;
					
		}
		

	}

}
