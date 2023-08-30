package bit701.day0830;

public class DataEx1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.print("apple\t"); // \t는 다음 탭 위치까지 띄워줌 
		System.out.print("banana");
		System.out.println("orange\n"); // println에서\n을 쓰면 두번쓴 효과가 나타난다
		
		//printf : 변환 기호에 의한 출력, 정수:%d, 실수:%f, 문자:%c, 문자열:%s
		// \n: 줄넘김, \t:다음 탭 위치로이동
		int age = 23;
		double weight = 56.7;
		char blood = 'A';
		String name = "캐서린";
		
		System.out.printf("이름:%s\n\n",name);
		System.out.printf("나이 :%d세\n\n", age);
		System.out.printf("몸무게:%fkg\n",weight);
		System.out.printf("몸무게:%5.1fkg\n",weight); //%5.1f: 전체자리수-5, 소숫점자리-1
		System.out.printf("혈액형:%c형\n",blood);
		System.out.println("=================");
		System.out.printf("이름:%s\n혈액형:%c형\n나이:%d세\n",name,blood,age);
	}

}
