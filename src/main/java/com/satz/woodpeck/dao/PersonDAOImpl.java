package com.satz.woodpeck.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.satz.woodpeck.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		p.setCreatedDate(new Date());
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Person.class)
			    .addOrder( Order.desc("createdDate")).setMaxResults(5);
		
		List<Person> personsList = criteria.list();
		
		//List<Person> personsList = session.createQuery("from Person").list();
		/*for(Person p : personsList){
			logger.info("Person List::"+p);
		}*/
		
		
		return personsList;
	}

	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Person p = (Person) session.load(Person.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}
	
	@Override
	public List<Person> getPersonByCorpId(String name) {
		Session session = this.sessionFactory.getCurrentSession();	
		
		Criteria criteria = session.createCriteria(Person.class);
		StringBuilder query = new StringBuilder("from Person ");
		
		   if(name!=null){
				query.append(" where name = '" + name +"'");
			}
		
		   Query result = session.createQuery(query.toString());
		   
		   List<Person> personsList = result.list();
		   return personsList;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}

}
