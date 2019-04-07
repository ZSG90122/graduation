package com.adminlte.controller.netty;

import java.util.ArrayList;
import java.util.List;

/**
 * 高zs
 */
public class DSCircularQueue {
	static int MaxLen = 11; // front指向的位置没有值，少一个对象
	int front;
	int rear;
	Object queueList[];

	public DSCircularQueue() {
		// TODO Auto-generated constructor stub
		queueList = new Object[MaxLen];
		front = 0;
		rear = 0;
	}

	// 判空
	public synchronized boolean isEmpty() {
		if (front == rear) {
			return true;
		}
		return false;
	}

	// 判满
	public synchronized boolean isFull() {
		if (((rear + 1) % MaxLen) == front) {
			return true;
		} else {
			return false;
		}
	}

	// 取队头元素
	public synchronized Object queueFront() {
		if (isEmpty() == false) {
			return (queueList[(front + 1) % MaxLen]);
		} else {
			System.out.println("ERROR:Queue is Empty");
			return null;
		}
	}

	// 取队尾 元素
	public synchronized Object queueTail() {
		if (isEmpty() == false) {
			return (queueList[rear]);
		} else {
			System.out.println("ERROR:Queue is Empty");
			return null;
		}
	}

	// 入队
	public synchronized boolean enQueue(Object enData) {

		if (isFull() == true) {
			outQueue();
		}

		rear = (rear + 1) % MaxLen;
		this.queueList[rear] = enData;
		return true;
	}

	// 出队
	public synchronized boolean outQueue() {
		if (isEmpty() == false) {
			front = (front + 1) % MaxLen;
			return true;
		} else {
			System.out.println("ERROR:Queue is Empty");
			return false;
		}

	}

	// 队列大小
	public synchronized int queSize() {
		return ((rear - front) + MaxLen) % MaxLen;
	}

	// 提取队列所有的元素
	// public synchronized Object[] getAllElement() {
	public synchronized List<Object> getAllElement() {
		int num = ((rear - front) + MaxLen) % MaxLen;
		// Object[] element = new Object[num];
		List<Object> element_o = new ArrayList<Object>();
		int i = 0;
		for (i = 0; i < num; ++i) {
			element_o.add((queueList[(front + 1 + i) % MaxLen]));
			// element[i]=(queueList[(front+1+i)%MaxLen]);
		}
		// return element;
		return element_o;
	}
}
