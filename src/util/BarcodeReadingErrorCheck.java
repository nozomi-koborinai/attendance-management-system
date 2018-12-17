package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import dto.Time;

public class BarcodeReadingErrorCheck {

	static Date date;
	static Time jikan = new Time();
	static SimpleDateFormat sdf = new SimpleDateFormat("kk:mm");
	static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy'年'MM'月'dd'日'E'曜日'k'時'mm'分'");

	//バーコード読み取りの際のダブりエラー検出用
	public static int barcodeTimeErrorCheck(String firstTime, String secondTime) throws ParseException{
		int result = 0;		//ダブりなしの場合（正常状態）
		String fTime = firstTime;
		String sTime = secondTime;

		System.out.println(sdf.format(sdf.parse(jikan.getEndTime3())));
		System.out.println(sdf.format(sdf.parse(fTime)));

		if((sdf.format(fTime).compareTo(sdf.format(sdf.parse(jikan.getEndTime3()))) < 0 && sdf.format(sTime).compareTo(sdf.format(sdf.parse(jikan.getEndTime3()))) < 0) || (sdf.format(fTime).compareTo(sdf.format(sdf.parse(jikan.getEndTime6()))) < 0 && sdf.format(sTime).compareTo(sdf.format(sdf.parse(jikan.getEndTime6()))) < 0)){
			result = 1;
		}

		return result;
	}
}
