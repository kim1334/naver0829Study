package bit701.dat0906;

public class Ex18_Book168 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 배열 변수 선언과 배열 생성
		String[] seanson = {"Spring", "Summer","Fall","Winter"};
		
		//배열의 항목값 읽기
		System.out.println("season[0]:"+seanson[0]);
		System.out.println("season[1]:"+seanson[1]);
		System.out.println("season[2]:"+seanson[2]);
		System.out.println("season[3]:"+seanson[3]);
		
		// 인덱스 1번 항목의 값 변경
		seanson[1] = "여름";
		System.out.println("season[1]:"+seanson[1]);
		System.out.println();
		
		//배열 변수 선언과 배열 생성
		int [] scores = {83,90,87};
		
		//총합과 평균 구하기
		int sum = 0;
		for(int i=0; i<3; i++) {
			sum += scores[i];
		}
		
		System.out.println("총합: "+sum);
		double avg =(double)sum/3;
		System.out.println("평균: "+avg);
		
		


	}

}
