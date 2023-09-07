package bit701.dat0906;

public class Ex3_Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//다양한 타입으로 배열에 저장을 해보자
		char [] arr1 = {'A','P','P','L','e'};
		double [] arr2;
		arr2 = new double[] {1.7, 8.9, 3.4};
		String [] arr3 = new String[3];
		arr3[0] = "사과";
		arr3[1] = "오렌지";
		arr3[2] = "딸기";
		
		System.out.println("** arr1 출력 **");
		for(int i=0; i<arr1.length; i++) {
			System.out.print(arr1[i]);
		}
		System.out.println();
		
		System.out.println("\n** arr2 출력 **");
		for(int i=0; i<arr2.length; i++){
			System.out.print(arr2[i]);
			System.out.print(", ");
		}
		
	
		System.out.println();
		
		System.out.println("\n** arr3 출력 **");
		
		for(int i=0; i<arr3.length; i++) {
			System.out.print(arr3[i]);
		}
		
		System.out.println();
		System.out.println("=".repeat(30));
		System.out.println();
		System.out.println("** arr1 출력 **");
		for(char n:arr1) {
			System.out.print(n);
		}
		System.out.println();
		
		System.out.println("\n** arr2 출력 **");
		for(double k:arr2) {
			System.out.print(k);
			System.out.print(", ");
		}
		System.out.println();
		
		System.out.println("\n** arr3 출력 **");
		for(String s:arr3) {
			System.out.print(s);
		}
	}
}
