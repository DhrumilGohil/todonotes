package com.dhrumil.todo;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "Usertable")
public class TodoRegister 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	private String name,email,password,phonenumber,designation;
	@OneToMany(mappedBy = "register")
	List<Todomaker> todomaker;
	public TodoRegister() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<Todomaker> getTodomaker() {
		return todomaker;
	}
	public void setTodomaker(List<Todomaker> todomaker) {
		this.todomaker = todomaker;
	}
	public TodoRegister(int id, String name, String email, String password, String phonenumber, String designation,
			List<Todomaker> todomaker) {
		super();
		Id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phonenumber = phonenumber;
		this.designation = designation;
		this.todomaker = todomaker;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
}
