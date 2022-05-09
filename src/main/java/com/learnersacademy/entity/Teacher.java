package com.learnersacademy.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.learnersacademy.utils.Designation;

@Entity
@Table(name = "teacher")
public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int teacherId;

	@Column
	private String firstName;

	@Column
	private String lastName;

	@Column
	private LocalDate dateOfBirth;

	@Column
	private String address;

	@Column
	private String phone;

	@Enumerated(EnumType.STRING)
	@Column
	private Designation designation;
	
	@ManyToMany(mappedBy="teachers")
	private List<ClassOffered> classes;

	public Teacher() {

	}

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int id) {
		this.teacherId = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Designation getDesignation() {
		return designation;
	}

	public void setDesignation(Designation designation) {
		this.designation = designation;
	}

	public List<ClassOffered> getClasses() {
		return classes;
	}

	public void setClasses(List<ClassOffered> classes) {
		this.classes = classes;
	}
	
	

}
