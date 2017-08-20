package com.hit.util;

public class PageUtil {
	
	//每页显示5条记录
	public static final int EVERY_PAGE_ITEMS = 5;
	
	/**
	 * 根据参数（页码），计算其在数据库中查询的起始位置
	 * @param pagenum
	 * @return
	 */
	public static int getSQLIndexByPageNum(int pagenum){
		return (pagenum - 1) * EVERY_PAGE_ITEMS;
	}
	
	/**
	 * 根据参数（记录总数）,计算最大页码的值
	 * @param total
	 * @return
	 */
	public static int getMaxPageNum(int total){
		if(total % EVERY_PAGE_ITEMS == 0 ){
			return total / EVERY_PAGE_ITEMS;
		}else{
			return total / EVERY_PAGE_ITEMS + 1;
		}
	}

}
