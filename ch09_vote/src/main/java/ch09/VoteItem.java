package ch09;

import java.util.Arrays;

public class VoteItem {
	private int listNum;
	private int itemNum;
	private String[] item;
	private int count;
	
	public VoteItem() {
	}

	public VoteItem(int listNum, int itemNum, String[] item, int count) {
		super();
		this.listNum = listNum;
		this.itemNum = itemNum;
		this.item = item;
		this.count = count;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getItemNum() {
		return itemNum;
	}

	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}

	public String[] getItem() {
		return item;
	}

	public void setItem(String[] item) {
		this.item = item;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "VoteItem [listNum=" + listNum + ", itemNum=" + itemNum + ", item=" + Arrays.toString(item) + ", count="
				+ count + "]";
	}
	
	
	
	
}
