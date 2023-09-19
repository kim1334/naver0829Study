package bit701.dat0907;

import java.util.Scanner;

public class Ex4_ArrayBaseball {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int [] com = new int [3];
		int [] user = new int [3];
		String strNum;
		Scanner sc = new Scanner(System.in);
		int ball, strike;
		
		
		
		
		// 1~9사이의 중복되지 않은 숫자를 배열에 담기
		
		
		
		
		for(int i=0; i<com.length; i++) {
			com[i]=(int)(Math.random()*9)+1;
			for(int j=0;j<i;j++) {
				if(com[i]==com[j]) {
					i--;
					break;
				}
			}
		}
		System.out.printf("%d%d%d\n",com[0],com[1],com[2]);
		while(true) {
			System.out.println(">>");
			strNum = sc.nextLine();
			//strNum의 각 숫자를 user 배열에 정수형태로 넣기
			user[0] = strNum.charAt(0)-'0'; //'1'은 정수로 49이다.(아스키 코드표 참조) : '1'-'0' = 1 ( 49-48 = 1 같은 것
			user[1] = strNum.charAt(1)-'0';
			user[2] = strNum.charAt(2)-'0';
			System.out.printf("%d,%d,%d\n",user[0],user[1],user[2]);
			// user와 com을 비교하여 숫자가 있지만 자리수가 안맞을 경우는 ball
			// 자리수까지 맞을 경우는 strike 를 증가
			// strike이 3이면 정답이므로 "축하합니다. 정답입니다" 출력 후 종료.
			ball=0;
			strike=0;
			for(int i=0; i<com.length; i++) {
				for(int j=0; j<com.length; j++) {
					if(com[i]==user[j] && i==j) {
						strike++;
						
					}else if(com[i]==user[j] && i!=j) {
						ball++;
					}
				}
				
			}
				System.out.println("스트라이크 : "+strike);
				System.out.println("볼 : "+ball);
				
				
				if(strike==3) {
					System.out.println("축하합니다. 정답입니다");
					break;
				}

			

			
			
			//종료
			if(strNum.equalsIgnoreCase("q")) {
				System.out.println("게임을 종료합니다");
				break;
			}
		}
	}
}