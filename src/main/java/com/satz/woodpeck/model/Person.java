package com.satz.woodpeck.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 * @author pankaj
 *
 */
/**
 * @author svenkatachalam
 *
 */
@Entity
@Table(name="PERSON")
public class Person {

		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String name;
	
	public java.util.Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(java.util.Date createdDate) {
		this.createdDate = createdDate;
	}

	private String mobileNo;
	
	private int prizeMoney;
	
	@Column(columnDefinition = "DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date createdDate;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public int getPrizeMoney() {
		return prizeMoney;
	}

	public void setPrizeMoney(int prizeMoney) {
		this.prizeMoney = prizeMoney;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", mobileNo=" + mobileNo
				+ ", prizeMoney=" + prizeMoney + "]";
	}

	

	
	
}
