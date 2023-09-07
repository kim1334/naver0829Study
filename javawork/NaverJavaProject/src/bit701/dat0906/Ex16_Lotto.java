package bit701.dat0906;

import java.util.Random;

public class Ex16_Lotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 6개 할당된 lotto 변수에 1~45 사이의 난수 발생!!
		 * (중복된 경우 다시 발생) 오름차순 정렬로 출력
		 */
		Random r = new Random();
		int[] lotto = new int[6];
		
		Loop:
		for(int i=0; i<lotto.length; i++) {
			lotto[i] = r.nextInt(45)+1;
			for(int j=0; j<i; j++) {
				if(lotto[i]==lotto[j]) {
					i--;
					continue Loop;
				}
			}	
		}
		for(int i=0; i<lotto.length-1; i++) {
			for(int j=i+1; j<lotto.length; j++) {
				if(lotto[i]>lotto[j]) {
					int them = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = them;
				}
			}
		}
		for(int i=0; i<lotto.length; i++) {
			System.out.println(lotto[i]);
		}
	}
}
