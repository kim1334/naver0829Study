package bit701.dat0907;

public class Ex2_Array2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int [][] arr = new int [2][3];
		
		System.out.println("행갯수"+ arr.length);
		System.out.println("0번 행의 열갯수 : " + arr[0].length);
		System.out.println("1번 행의 열갯수 : "+arr[1].length);
		
		
		arr[0][1] =3;
		arr[1][1] =5;
		

		System.out.println("첫번째 배열 출력");
		arrWrite(arr);
		
		// 2번째 방법
		int [][] arr2 = {
				{1,2},
				{3,4,5},
				{10,20,30,40}
		}; // 0 번 행은 열갯수 : 2, 1번행은 열갯수 : 3 ....
		 System.out.println("** 2번째 배열 출력 **");
		 arrWrite(arr2);
		 
		 // 3번째 방법
		 int [][]arr3;
		 arr3 = new int [][]{{1,2},{1,2,3},{4,5,6,7}};
		 System.out.println("** 3번째 배열 출력 **");
		 arrWrite(arr3);
	}
	
	public static void arrWrite(int [][]arr) {
		for (int i=0; i<arr.length; i++){
			for(int j=0; j<arr[i].length; j++) {
				System.out.printf("[%2d][%2d]=%d ",i,j,arr[i][j]);
			}
			System.out.println();
		}
		System.out.println("=".repeat(40));
		
	}

}
