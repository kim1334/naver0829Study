package bit701.day0908;

public class Ex5SawonCall {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Sawon sa = new Sawon();
		sa.setSawonNo("bit1234");
		sa.setName("홍길동");
		sa.setAge(23);
		
		System.out.println("** 신입사원 #1 정보 **");

		printSawon(sa); // 같은 클래스 내에 메소드는 클래스명 생략 가능
		
		
		Sawon sa2 = new Sawon();
		sa2.setSawonNo("bit 9999");
		sa2.setName("강호동");
		sa2.setAge(35);
		
		System.out.println("** 신입사원 #2 정보 **");
		printSawon(sa2);
		
	}
	
	public static void printSawon(Sawon s) {
		
		System.out.println("** 신입사원 #1 정보 **");
		System.out.println("사원번호 : "+s.getSawonNo());
		System.out.println("사원명 : "+s.getName());
		System.out.println("나이 : "+s.getAge());
		
	}

}
