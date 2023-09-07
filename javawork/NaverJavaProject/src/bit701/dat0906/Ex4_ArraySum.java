package bit701.dat0906;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class Ex4_ArraySum {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 배열에 5개의 점수를 저장 후 총점과 평균을 구해보자
		
		int [] score= {78,100,90,89,69};
		int sum = 0; // 대입,증감으로 값을 연산할때 초기값이 있어야함
		double ave = 0;
		
		//방법1
//		for(int i=0; i<score.length; i++) {
//			sum += score[i];
//		}
		
		//방법2
		for(int n:score) {
			sum += n;
		}
		ave = (double)sum/score.length;
		System.out.println("총 점수 갯수 : "+score.length);
		System.out.println("총점 : "+sum);
		System.out.println("평균 : "+ave);
		
	}

}
