package com.dhrumil.todo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.stereotype.Component;

@Entity
@Component
@ComponentScan(basePackages = "com.dhrumil.todo")
public class Todomaker {
	@Id
	@Column(name = "TodoID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String title;
	private String descrption;
	@Column(name = "addedDate")
	@Temporal(TemporalType.DATE)
	private Date addDate;
	@ManyToOne
	private TodoRegister register;
	public Todomaker() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return Id;
	}
	public Todomaker(int id, String title, String descrption, Date addDate, TodoRegister todoRegister) {
		super();
		Id = id;
		this.title = title;
		this.descrption = descrption;
		this.addDate = addDate;
		this.register = todoRegister;
	}
	public TodoRegister getTodoRegister() {
		return register;
	}
	public void setTodoRegister(TodoRegister todoRegister) {
		this.register = todoRegister;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescrption() {
		return descrption;
	}
	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
}
