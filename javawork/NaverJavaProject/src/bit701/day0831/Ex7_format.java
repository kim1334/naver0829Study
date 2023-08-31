package bit701.day0831;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Ex7_format {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 패턴을 이용해서 다양하게 날짜, 시간을 출력해보자
		Date date = new Date();
		
		// 패턴 1 // 웹에서 출력할떄 가장 많이 사용함. 
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE");
		// MM : 월 mm 분 EEE : 요일짧게 HH : 24시간 기준
		System.out.println(dateFormat1.format(date));
		
		// 패턴 2
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss EEEE");
		// a:오전/오후 EEEE:요일길게 hh: 12시간 기준
		System.out.println(dateFormat2.format(date));
		
		// 숫자를 포멧 양식에 맞게 출력하기
		int money = 4567890;
		
		NumberFormat numberFormat1 = NumberFormat.getInstance(); 
		System.out.println(numberFormat1.format(money)); // 4,567,890
	
		// 접근 제어자가 퍼블릭일 경우에만 객체를 생성할 수 있다.
		// 스태틱이나 프로덕트인 경우에는 다른 방법으로 해야함 겟인스턴스~!
		
		NumberFormat numberFormat2 = NumberFormat.getCurrencyInstance(); // 지역 설정된 화폐단위 붙여서 출력
		System.out.println(numberFormat2.format(money));
		
		double num = 456.12345;
		System.out.println(numberFormat1.format(num));
		
		numberFormat1.setMaximumFractionDigits(1); // 소숫점 한자리로 출력
		System.out.println(numberFormat1.format(num));
	
		
		

	}

}
