package bit701.dat0906;

import java.util.Random;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class Ex15_Arrayjungbok {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 10개의 배열 안에 1~20 사이의 난수를 구해서 저장 후 출력해보자
		Random r = new Random();
		int [] data = new int[10];
		
		Loop:
		for(int i=0; i<data.length; i++) {
			data[i] = r.nextInt(20)+1;
			// 중복처리 - 같은 숫자가 있을 경우 다시 발생.
			for(int j=0; j<i; j++) {
				if(data[i]==data[j]) {
					i--;
					continue Loop;
				}
			}
		}
		for(int i=0; i<data.length; i++) {
			
			if(i%5==0) {
				System.out.println();
			}
			System.out.printf("%4d", data[i]);
		}
	}
}
