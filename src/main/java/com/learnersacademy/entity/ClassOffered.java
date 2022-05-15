package com.learnersacademy.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="class_offered")
public class ClassOffered {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String className;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(
			name="classes_subjects",
			joinColumns = @JoinColumn(name="class_id"),
			inverseJoinColumns = @JoinColumn(name="subject_id"))
	private List<Subject> subjects;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(
			name="classes_teachers",
			joinColumns = @JoinColumn(name="class_id"),
			inverseJoinColumns = @JoinColumn(name="teacher_id"))
	private List<Teacher> teachers;
	
	@OneToMany(mappedBy="classJoined", cascade = CascadeType.PERSIST)
	private List<Student> students;

	public ClassOffered() {
		
	}
	
	

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public List<Subject> getSubjects() {
		return subjects;
	}

	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}



	@Override
	public String toString() {
		return "ClassOffered [id=" + id + ", className=" + className + "]";
	}
	
	
		

}
