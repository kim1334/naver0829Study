package bit701.day0901;

import java.text.NumberFormat;
import java.util.Scanner;

public class Ex2_Score {
	public static void main(String[] args) {
		
		//이름 3과목의 점수 (kor, eng, mat ) 를 입력받은 후
		// 총점과 평균 (소숫점 1자리 출력 - NumberFormat )
		// 그리고 등급을 출력 (grade : 평균 90점 이상이면
		// "Excellent!", 80 이상이면 "Good!!", 나머지는 "Try!"
		
		// 선언
		Scanner sc = new Scanner(System.in);
		NumberFormat numFormat = NumberFormat.getInstance();
		numFormat.setMaximumFractionDigits(1);
		int kor, eng, mat, total =0;
		String name = "";
		String grade = "";
		
		// 입력
		System.out.println("이름 입력");
		name = sc.nextLine();
		
		System.out.println("국어 점수 입력");
		kor = sc.nextInt();
		
		System.out.println("영어 점수 입력");
		eng = sc.nextInt();
		
		System.out.println("수학 점수 입력");
		mat = sc.nextInt();
		// 계산
		
		total = kor + eng + mat;
		double ave = total / 3.0;
		
		if(ave >= 90) {
		    grade = "Excellent";
		}else if(ave >= 80) {
			grade = "Good!!";
		}else {
			grade = "Try";
		}
		
		
		// 출력
		System.out.println("이름 : " + name);
		System.out.println("국어점수 : " + kor + "점");
		System.out.println("영어점수 : " + eng + "점");
		System.out.println("수학점수 : " + mat + "점");
		System.out.println("총점 : " + total + "점");
		System.out.println("평균 : " + numFormat.format(ave) + "점");
		System.out.println("평가 : " + grade);
		
	}

}
