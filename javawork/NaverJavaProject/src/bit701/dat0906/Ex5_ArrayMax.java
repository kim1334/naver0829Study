package bit701.dat0906;

public class Ex5_ArrayMax {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 최대값, 최소값 구하기
		int []data;
		
		data = new int [] {5,-100, 67, 89, 45, -9, 123, 58, 110};
		int max,min;
		System.out.println(data.length);
		
	
		//최대값
		max = data[0];
		//최소값도 일단 첫 데이터를 저장
		min = data[0];// 첫번째 데이터를 맥스에 저장
		// 2번째부터 끝까지 비교해서 더 큰값이 나오면 max값을 변경.
		for(int i=1; i<data.length; i++) {
			if(max<data[i]) 
				max=data[i];
				
			if(min>data[i]) 
				min=data[i];

		}
		System.out.println("max = "+max);
		System.out.println("min = "+min);
	}

}
