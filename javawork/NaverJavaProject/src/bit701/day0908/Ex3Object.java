package bit701.day0908;

public class Ex3Object {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 객체 배열을 이용해서 데이타를 출력해보자.
		BitCamp []bit = new BitCamp[3]; // 3개의 데이터가 들어갈 변수로 할당. 초기값은 null;
		// 배열 갯수 만큼 BitCamp 객체를 생성 해줘야 한다.
		for(int i=0; i<bit.length; i++) {
			bit[i]=new BitCamp();
		} // 배열 객체일 경우에는 for문으로 무조건 객체 공간을 생성해줘야한다

		
		//0번 데이타
		bit[0].name="캔디";
		bit[0].address="대구";
		
		bit[1].name="안쏘니";
		bit[1].address="서울";
		
		bit[2].name="테리우스";
		bit[2].address="부산";
		
//		for(int i=0; i<bit.length; i++) {
//			System.out.println("** 학생 정보 "+(i+1)+"**");
//			System.out.println("이름:"+bit[i].name);
//			System.out.println("주소:"+bit[i].address);
//			System.out.println("스터디반:"+BitCamp.STUDYNAME);
//			System.out.println("=".repeat(30));
//		}
		
		for(BitCamp b:bit) {
			System.out.println("** 학생 정보 ");
			System.out.println("이름:"+b.name);
			System.out.println("주소:"+b.address);
			System.out.println("스터디반:"+BitCamp.STUDYNAME);
			System.out.println("=".repeat(30));
		}
		
		

	}

}
