package cn.sendtu.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间处理类
 *
 */
public class DateUtil {

	static SimpleDateFormat form = new SimpleDateFormat("MM"); // 格式月份
	static SimpleDateFormat dayform = new SimpleDateFormat("dd"); // 格式月份

	/***
	 * 时间比较
	 * 
	 * @param Date
	 *            current;
	 * @param Date
	 *            birthDay;
	 * @return int
	 * @throws ParseException
	 */
	public static boolean compare(Date birthDay) throws ParseException {
		Date date = new Date();
		long day = (date.getTime() - birthDay.getTime()) / (24 * 60 * 60 * 1000) + 1;
		// 判断是否同一月份
		if (form.format(date).equals(form.format(birthDay))) {
			day = Integer.parseInt(dayform.format(birthDay)) - Integer.parseInt(dayform.format(date));
			if (day >= 0 && day <= 7) { // 0<day<7
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	/**
	 * 年龄
	 * @param date 生日
	 */
	public static int age(String date) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy");
		Date day=new Date();
		int cusage=Integer.parseInt(form.format(day))-Integer.parseInt(form.format(date));
		if(cusage==0){
			return cusage+1;
		}else {
			return cusage;
		}
	}
}
