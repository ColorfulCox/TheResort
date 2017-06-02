package cn.sendtu.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateCompare {

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * 返回当前日期(包含当天)间隔天数的查询SQL语句。
	 * 
	 * @param interval
	 *            间隔天数
	 * @param curDate
	 *            当前日期
	 * @param queryField
	 *            查询字段名称
	 * @return 返回查询串
	 */
	public static String getIntervalQuery(int interval, Date curDate,
			String queryField) {
		if(interval>0){
			interval++;
			interval++;
		}
		else{
			interval--;
			interval--;
		}
		// 现在日期
		Calendar ccuurDate =Calendar.getInstance();
		ccuurDate.setTime(curDate);
		ccuurDate.add(Calendar.DATE,-1);
		curDate =ccuurDate.getTime();
		
		String nowdate = sdf.format(curDate);
		// 截取月日
		String wnowdate = nowdate.substring(5, 10);
		// 获取7天后的日期
		Calendar lastDate = Calendar.getInstance();
		lastDate.setTime(curDate);
		lastDate.add(Calendar.DATE, interval);// 日期滚动7天
		String after = sdf.format(lastDate.getTime());

		// 截取月日
		String wafter = after.substring(5, 10);
		// 截取月 判断是否是跨年，如果跨年则月份有可能会小于之后几天的 就比如 12.28 七天后就是01.04 这样就是月份很小了
		String ny = wnowdate.substring(0, 2);
		String ay = wafter.substring(0, 2);
		int iny = Integer.valueOf(ny);
		int iay = Integer.valueOf(ay);
		// 跨年查询
		String y12 = "12-31";
		String y1 = "01-01";

		// 跨年查询，因为是生日，之和月份和日期有关和年没关系
		String hql = "";
		if (iny > iay) {
			// 跨年查询sql
			hql += " ((DATE_FORMAT( " + queryField + " , '%m-%d') > '"
					+ wnowdate + "'  and DATE_FORMAT( " + queryField
					+ " , '%m-%d') <= '" + y12 + "') or (DATE_FORMAT( "
					+ queryField + " , '%m-%d') >= '" + y1
					+ "'  and DATE_FORMAT( " + queryField + " , '%m-%d') < '"
					+ wafter + "'))";
		} else {
			// 正常查询sql
			hql += " DATE_FORMAT( " + queryField + " , '%m-%d') > '" + wnowdate
					+ "'  and DATE_FORMAT( " + queryField + " , '%m-%d') < '"
					+ wafter + "'";
		}

		System.out.println(hql);

		return hql;
	}

	/**
	 * 是否在当前日期的间隔天数内过生日，只对比月/日
	 * @param interval 间隔天数
	 * @param curDate 当前日期
	 * @param compareDate 对比日期
	 * @return
	 */
	public static boolean compareDate(int interval, Date curDate,
			Date compareDate) {
		//++或--是为了包含最后一天或最前一天
		if(interval>0){
			interval++;
		}
		else{
			interval--;
		}
		// 获取7天后的日期
		Calendar lastDate = Calendar.getInstance();
		lastDate.setTime(curDate);
		lastDate.add(Calendar.DATE, interval);// 日期加7天
		if (interval > 0) {
			if (compareDate.after(curDate)
					&& compareDate.before(lastDate.getTime())) {
				return true;
			} else {
				return false;
			}
		}
		else{
			if (compareDate.after(lastDate.getTime())
					&& compareDate.before(curDate)) {
				return true;
			} else {
				return false;
			}
		}
	}
}
