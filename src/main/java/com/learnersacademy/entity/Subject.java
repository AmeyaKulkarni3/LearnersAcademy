package com.learnersacademy.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="subject")
public class Subject {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int subjectId;
	
	@Column
	private int name;
	
	@ManyToMany(mappedBy="subjects")
	private List<ClassOffered> classes;
	
	public Subject() {
		
	}

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int id) {
		this.subjectId = id;
	}

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	public List<ClassOffered> getClasses() {
		return classes;
	}

	public void setClasses(List<ClassOffered> classes) {
		this.classes = classes;
	}
	
	
	
	

}
