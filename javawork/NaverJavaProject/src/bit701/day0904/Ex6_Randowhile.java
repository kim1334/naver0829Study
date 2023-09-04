package bit701.day0904;

import java.util.Scanner;

public class Ex6_Randowhile {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int rnd,count,num;
		
		Exit:
		while(true) {
			rnd = (int)(Math.random()*100)+1; // 1~100까지의 난수가 하나 출력.
			count = 0; // 입력할때마다 쌓이는 카운트 
			
			while(true) {
				System.out.println(++count+":"); // 횟수 카운트 하면서 입력값 받음
				//num=sc.nextInt();
				num = Integer.parseInt(sc.nextLine());
				if(num>rnd)
					System.out.println("\t"+num+"보다 작습니다");
				else if(num<rnd)
					System.out.println("\t"+num+"보다 큽니다");
				else {
					System.out.println("\t** 정답입니다 ("+rnd+")");

					//계속할지 묻는다
					System.err.println("계속하려면 y를 입력해주세요, y가 아닐경우 종료!");
					String ans = sc.nextLine();
					if(ans.equalsIgnoreCase("y")) {// 대소문자 상관없이 철자만 맞으면 true
						System.out.println("새로운 난수를 발생하겠습니다.");
						continue Exit; // 바깥쪽 while 문의 조건식으로 이동한다.
					}else {
						break Exit; //두개의 while문을 모두 빠져 나간다.
					}
					
				}
			}
		}

	} // 메인 메소드

} // 클래스
