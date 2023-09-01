package bit701.day0901;

import java.util.Scanner;

public class Ex6_ForExam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		/* 구구단을 출력할 시작단 입력
		 * 4
		 * 구구단을 출력할 끝단 입력
		 * 6
		 * 
		 * 		4단		5단		6단 단일 for문
		 * 
		 * 		4x1=4	5x1=5	6x1=6   -다중 for문
		 * 		4x2=8	5x2=10	6x2=12
		 */
		int s,e;
		
		
		System.out.println("구구단을 출력학 시작단 입력");
		s = sc.nextInt();
		
		System.out.println("구구단을 출력할 끝단 입력");
		e = sc.nextInt();
		
		// start 가 end 보다 클 경우 두 변수의 값을 바꿔보자
		if(s > e) {
			int temp = s;
			s = e;
			e = temp;
		}
		
		// 제목
		for(int a=s; a<=e; a++) {
			System.out.printf("%7d단 ",a);
		}
		System.out.println("\n");
		
		for(int i=1; i<=9; i++) {
			for(int a=s; a<=e; a++) {
				System.out.printf("%5dx%d=%2d",a,i,a*i);
			}
			System.out.println();
		}
	}

}
