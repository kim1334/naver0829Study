package bit701.day0904;

import java.util.Scanner;

public class Ex8_Book133 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("메세지를 입력하세요");
		System.out.println("프로그램을 종료하려면 q를 입력하세요");
		
		Scanner sc = new Scanner(System.in);
		String inputString;
		
		do {
			System.out.println(">");
			inputString = sc.nextLine();
			System.out.println(inputString);
		}while(!inputString.equals("q")); // 이퀄스는 대소문자까지 똑같야아함.
		 // 대소문자 상관없이 q입력 종료하려면 equalsIgnoreCase("q");로 써야함
		System.out.println();
		System.out.println("프로그램 종료");
		

	}

}
