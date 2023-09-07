package bit701.dat0906;

public class Ex17_Book171 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		test1();
//		Ex17_Book171.test1(); // 본인 클래스 내에 있는 스태틱 메소드는 test1(); 로 바로 호출 가능함
		
		int[] scores;
		scores = new int[] {83,90,85};
		int sum1 = 0;
		for(int i=0; i<scores.length; i++) {
			sum1 += scores[i];
		}
		System.out.println("총합:"+sum1);
		
		printItem(scores);
		
		System.out.println("=".repeat(30));
		printItem(new int[] {45,67,78,89,99,100} );
	}
	
//	public static void test1() {
//		System.out.println("test1 메서드 호출");
//	}

	
	
	public static void printItem(int[] scores) {
		// 매개변수가 참조하는 배열의 항목을 출력
		for(int i=0;i<scores.length;i++) {
			System.out.println("scores["+i+"]:"+scores[i]);
		}
	}
}
