package bit701.day0905;

public class Ex3_BreakOutter {
	public static void main(String[] args) throws Exception {
		
		Outter:
			for(char upper='A'; upper<='Z'; upper++) {
				for(char lower='a'; lower<='z'; lower++) {
					System.out.println(upper + "-" + lower);
					if(lower=='g') {
						break Outter;
					}
				}
			}
		
	}

}
