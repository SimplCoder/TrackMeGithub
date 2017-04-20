package com.trackme.spring.dao;

import java.util.List;

import javax.management.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.trackme.constants.Constant;
import com.trackme.spring.model.Student;
import com.trackme.spring.model.UserMaster;


@Repository
public class StudentDAOImpl implements StudentDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(StudentDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}


	@Override
	public void addStudent(Student student) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(student);
		logger.info("student saved successfully, student Details="+student);
	}

	@Override
	public void updateStudent(Student student) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(student);
		session.flush();
		logger.info("student updated successfully, student Details="+student);
	}

	@Override
	public List<Student> listStudent() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Student> studentList = session.createQuery("from Student where status like '"+Constant.STATUS_ACTIVE+"' ").list();
		
		return studentList;
	}

	@Override
	public Student getStudentById(String id1) {
		try{
			 if(id1!=null && id1 !=""){
			Integer id= Integer.parseInt(id1);
			Session session = this.sessionFactory.getCurrentSession();
			String q ="from Student where id="+id;
	 		org.hibernate.Query query =session.createQuery(q);
			Student student =(Student) query.list().get(0);
			return student;
			 }else{
				 return null;
			 }
		  
		}catch(Exception e){
			return null;
		}
			
			
	}

	@Override
	public void removeStudent(String id) {
		Session session = this.sessionFactory.getCurrentSession();
		Student p = (Student) session.load(Student.class, Integer.parseInt(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Student deleted successfully, Student details="+p);
		
	}

}
