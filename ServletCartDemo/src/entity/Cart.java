package entity;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Cart {
	private HashMap<Items, Integer> goods;
	private double totalPrice;

	public Cart() {
		goods = new HashMap<Items, Integer>();
		totalPrice = 0.0;
	}

	/**
	 * @return the goods
	 */
	public HashMap<Items, Integer> getGoods() {
		return goods;
	}

	/**
	 * @param goods
	 *            the goods to set
	 */
	public void setGoods(HashMap<Items, Integer> goods) {
		this.goods = goods;
	}

	/**
	 * @return the totalPrice
	 */
	public double getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @param totalPrice
	 *            the totalPrice to set
	 */
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	// add to carts
	public boolean addGoodsInCart(Items item, int number) {
		if(goods.containsKey(item)){
			goods.put(item, goods.get(item)+number);
		}else{
			goods.put(item, number);			
		}
		
		calTotalPrice();// recalculate total price
		return true;
	}

	// remove from carts
	public boolean removeGoodsFromCart(Items item) {
		goods.remove(item);
		return true;
	}

	// get toatal price

	public double calTotalPrice() {
		double sum = 0.0;
		Set<Items> keys = goods.keySet();
		Iterator<Items> it = keys.iterator();
		while (it.hasNext()) {
			Items i = it.next();
			sum += i.getPrice() * goods.get(i);
		}
		this.setTotalPrice(sum);
		return this.getTotalPrice();
	}
	
	public static void main (String[] args){
		//generate 2 items
		Items i1 = new Items(1,"ipad air","China",200,500,"001.jpg");
		Items i3 = new Items(1,"ipad air","China",200,500,"001.jpg");
		Items i2 = new Items(2,"surface pro4","China",300,400,"002.jpg");
	
		Cart c = new Cart();
		c.addGoodsInCart(i1, 1);
		c.addGoodsInCart(i2, 2);
		c.addGoodsInCart(i3, 3);
		
		//go through the items;
		Set<Map.Entry<Items, Integer>> items = c.getGoods().entrySet();
		
		for(Map.Entry<Items, Integer> obj:items){
			System.out.println(obj);
		}
		
		System.out.println("total price: "+c.totalPrice);
	}
}
