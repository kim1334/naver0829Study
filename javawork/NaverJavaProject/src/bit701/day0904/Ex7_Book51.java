package bit701.day0904;

public class Ex7_Book51 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//json 데이타 {"키" : "값:}
		String jdata = "{\"name\":\"이진\"}";
		System.out.println(jdata);
		
		// jdk 13에서 추가된 텍스트 블록 문법
		String jdata2 = 
				"""
{"name":"캔디","address","역삼동"}
				""";
			System.out.println(jdata2);
			
			String name = "마이클잭슨";
			int age = 32;
			
			String jdata3 = "{\"name\":\""+name+"\",\"age\":"+age+"}";
			System.out.println(jdata3);
			
			//텍스트 블록 문법에 변수값을 넣는 방법
			
			String jdata4="""
{"name":"%s,"age":%d}
					""".formatted(name,age);
			System.out.println(jdata4);
			
			String st1 = "red\nblue\ngreen";
			System.out.println(st1);
			
			String st2 = """
					red
					blue
					green
					pink
					""";
			System.out.println(st2);

	}

}
