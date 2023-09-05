package bit701.day0905;

import java.util.Scanner;

public class Ex6_CharAt {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		String ssn = "";
		
		System.out.println("주민번호 입력란>");
		ssn = sc.nextLine();
		char sex = ssn.charAt(6);
		switch(sex) {
		case '1':
		case '3':
			System.out.println("남자입니다");
			break;
			
		case '2':
		case '4':
			System.out.println("여자입니다");
			break;
		}

	}

}
