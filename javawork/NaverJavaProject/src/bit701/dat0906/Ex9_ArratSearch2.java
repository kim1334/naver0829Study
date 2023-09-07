package bit701.dat0906;

import java.util.Scanner;

public class Ex9_ArratSearch2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String []names = {"강호동","유재석","한채영","이효리","이승기"};
		
		// 이름을 검색하여 몇번째에 있는지 출력
		// 없을 경우 "xxx 님은 며단에 없습니다"
		Scanner sc = new Scanner(System.in);
		String searchName = "";
		int find = -1; //찾을 경우 배열 인덱스 값 저장.
		
		// 검색할 이름 입력
		System.out.println("검색하실 이름을 입력해주세요");
		searchName = sc.nextLine();
		// for문 : 같은 이름이 있을 경우 출력,bFind도 true 변경 -break
		for(int i=0; i<names.length; i++) {
			if(searchName.equals(names[i])) { // 스트링 일치하는지 비교하는 속성 equals 기억스!!
				find = i;
				break;
			}			
		}
		// bfind 값에 따라 못찾은 경우 메세지 출력
		if(find==-1) {
			System.out.println(searchName+" 님은 명단에 없습니다.");
		}else {
			System.out.println(searchName+" 님은 "+(find+1)+" 번째에 있습니다.");
		}
		
	}
}
