package bit701.day0908;

import javax.swing.plaf.synth.SynthOptionPaneUI;

class BitCamp{
	//인스턴스 멤버 변수
	String name;
	String address;
	//클래스 멤버변수 -BitCamp로 생성된 여러 객체가 같은데이터를 가질경우
	// staatic 으로 선언한다.
	static final String STUDYNAME = "네이버 클라우드 3기 자바웹";
	
	
	
	
}
public class Ex2Object {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BitCamp stu1 = new BitCamp();
		stu1.name = "이미자";
		stu1.address = "여의도";
		
		BitCamp stu2 = new BitCamp();
		stu2.name = "이기자";
		stu2.address = "제주도";
		
		System.out.println("** 학생 정보 1 **");
		System.out.println("이름: "+stu1.name);
		System.out.println("주소: "+stu1.address);
		System.out.println("스터디명 : "+BitCamp.STUDYNAME);
		
		System.out.println("=".repeat(30));
		System.out.println("** 학생 정보 2 **");
		System.out.println("이름: "+stu2.name);
		System.out.println("주소: "+stu2.address);
		System.out.println("스터디명 : "+BitCamp.STUDYNAME);
	}

}
