package bit701.day0904;

public class Ex9_String {
	public static void main(String[] args) {
		String str1= "apple";
		String str2= "AppLe";
		String str3= "Have a Good Day";
		String str4= "   Happy   ";
		
		// str3의 총 길이 : 15 (공백 포함
		System.out.println(str3.length());
		
		//str2을 모두 소문자로 변환하여 출력
		System.out.println(str2.toLowerCase());
		
		//str2 을 모두 대문자로 변환
		System.out.println(str2.toUpperCase());
		
		//5번 인덱스부터 끝까지 출력
		System.out.println(str3.substring(5));
		
		//7번 부터 10번까지 추출해서 출력
		System.out.println(str3.substring(7,11));
		
		//str3 에서 0번 인덱스에 해당하는 캐릭터 문자 출력
		System.out.println(str3.charAt(0));
		
		// str3에서 7번 인덱스 해당 문자 출력
		System.out.println(str3.charAt(7));
		
		//str3 에서 첫번째 'a' 의 인덱스 값 출력
		System.out.println(str1.indexOf('a'));
		
		//str3 에서 마지막 'a의 위치
		System.out.println(str3.lastIndexOf('a'));
		
		//str4의 앞뒤 공백을 포함한 전체 길이
		System.out.println(str4.length());
		
		//앞 뒤 공백을 제거 후 길이 구하기
		System.out.println(str4.trim().length());
		
		//str3가 Have로 시작하면 true 
		System.out.println(str3.startsWith("Have"));
		
		//str3가 day로 끝나면 true (대소문자 정확히 맞아야함
		System.out.println(str3.endsWith("day"));
		
		//str1이 str2와 완벽하게 같을 경우 true (대소문자 일치)
		System.out.println(str1.equals(str2));
		
		//대소문자 상관없이 철자만 같으면 true
		System.out.println(str1.equalsIgnoreCase(str2));
		
		//str1 과 str2의 차이(양수값 : str1이 더 큰값, 음수값 :str2가 더 큰경우
		System.out.println(str1.compareTo(str2));
		
		//완전 같을 경우 0
		System.out.println(str1.compareTo("apple"));
	}

}
