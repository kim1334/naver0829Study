package bit701.dat0906;

import java.util.Scanner;

public class Ex6_ArrayScoreinput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * score에 5개의 배열 할당후 키보드로 직접 점수를
		 * 입력하여 배열에 저장후
		 * 총점과 평균을 구하세요.
		 */
	Scanner sc = new Scanner(System.in);
	int[] score = new int[5];
	int sum = 0;
	double ave;
	
	
	for(int i=0; i<score.length; i++) {
		System.out.println(i+1+"번 과목 점수 입력");
		score[i] = sc.nextInt();
		//조건추가 : 0보다 작거나 100보다 크면 "0~100사이 접수로 입력 바람! 출력후 다시 일력
		//continue 이용해서 작성해보세요
		if(score[i]<0 || score[i]>100) {
			System.out.println("0~100사이 점수로 입력바람");
			--i;
			continue;
		}
		sum += score[i];
	}
	ave = sum/score.length;
	
	//입력
	System.out.println("입력한 점수들");
	for(int n:score)
		System.out.printf("%5d",n);
	System.out.println("\n총점 : "+sum);
	System.out.println("평균값 : "+ave);
	}
}
