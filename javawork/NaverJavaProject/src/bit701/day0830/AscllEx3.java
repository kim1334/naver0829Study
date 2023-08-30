package bit701.day0830;

public class AscllEx3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// char, int는 서로 같은 타입이라고 봐도 된다.
		// 이유는 아스키 코드로 인하여
		
		char a1 = 65;
		int a2 = 'B';
		System.out.println(a1); // A 출력
		System.out.println(a2); // 66 출력
		System.out.println((int)a1); // 65 출력 캐릭터를 인트로 형변환
		System.out.println((char)a2); // B 출력 인트롤 캐릭터로 형변환
		
		System.out.printf("%d 의 아스키 문자는 %c이다\n",(int)a1,a1);
		//형변환 없이 printf 변환기호를 이용하여 출력할 수도 있다.
		
		char b1 = 'C';	
		int b2 = 68;
		
		System.out.println(b1);
		System.out.println(b2);
		System.out.println(b1+2); // 묵시적 형변환에 의해서 char+int = int 가 나온다.
		// 그러므로 E가 아니라 69가 출력된다
		
		// 묵시적 형변환( 실제 더하기만 의미하는 게 아닌 연산을 의미한다)
		// char + int = int
		// int + int = int
		// long + int = long // 같은 타입 일 경우 더 큰 게 위
		// double + int = double
		// String + int = String
		// String + double = String
		
		System.out.println((char)(b1+2)); //b1 + 2 = 69 로 int 타입인데 char로 강제 형변환 하면
											// 문자가 출력된다
		
		System.out.println(5/2); // 2가 출력. int와 int의 연산이므로 결과는 int 타입.
		System.out.println(5.0/2); // 2.5 출력. double + int는 더블로 출력되기에 2.5
		System.out.println((double)5/2); // 2.5 출력 
		System.out.println((double)(5/2)); // 2.0 출력. int, int로 연산하고 더블로 형병환 했기 때문.
		
		// 선생님이 알려주신 팁. println은 중복함수이다. 즉 오보로딩된 메소드.
		// print나 println은 모든 타입 출력 가능.
		// 이유는 타입별로 여러개를 같은 이름으로 만들어 놨기 때문.
		// 이런 메소드를 중복함수 = 오버로딩된 메소드라고 한다.
		
	}

}
