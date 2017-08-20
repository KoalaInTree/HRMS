package com.hit.util;

public class PageUtil {
	
	//ÿҳ��ʾ5����¼
	public static final int EVERY_PAGE_ITEMS = 5;
	
	/**
	 * ���ݲ�����ҳ�룩�������������ݿ��в�ѯ����ʼλ��
	 * @param pagenum
	 * @return
	 */
	public static int getSQLIndexByPageNum(int pagenum){
		return (pagenum - 1) * EVERY_PAGE_ITEMS;
	}
	
	/**
	 * ���ݲ�������¼������,�������ҳ���ֵ
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
