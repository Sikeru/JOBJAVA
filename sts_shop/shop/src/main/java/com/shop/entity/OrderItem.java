package com.shop.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class OrderItem extends BaseEntity {
	@Id
	@GeneratedValue
	@Column(name = "order_item_id")
	private Long id;

//	@ManyToOne
//	@JoinColumn(name = "item_id")
//	private Item item;
//	
//	@ManyToOne
//	@JoinColumn(name = "order_id")
//	private Order order;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "item_id")
	private Item item;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id")
	private Order order;

	private int orderPrice;
	private int count;

	public static OrderItem createOrderItem(Item item, int count) {
		OrderItem orderItem = new OrderItem();
		orderItem.setItem(item); // 주문할 상품과 주문 수량을 세팅한다.
		orderItem.setCount(count);
		orderItem.setOrderPrice(item.getPrice()); // 현재시간 기준으로 상품가격을 주문가격으로 세팅
		item.removeStock(count); // 주문 수량만큼 상품 재고 수량을 감소시킨다.
		return orderItem;
	}

	public int getTotalPrice() { // 주문 가격과 주문 수량을 곱해서 해당 상품을 주문한 총 가격을 계산하는 메소드
		return orderPrice * count;
	}
}
