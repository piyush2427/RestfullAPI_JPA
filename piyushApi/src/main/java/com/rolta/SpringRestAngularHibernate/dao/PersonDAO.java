package com.rolta.SpringRestAngularHibernate.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.rolta.SpringRestAngularHibernate.entity.Person;

@Transactional
@Repository
public class PersonDAO implements IPersonDAO {

	@Autowired
	SessionFactory sessionFactory;

	protected Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Person getPersonById(int pid) {
		return (Person) getCurrentSession().get(Person.class, pid);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> getAllPersons() {
		String hql = "FROM Person as p ORDER BY p.pid";
		return (List<Person>)getCurrentSession().createQuery(hql).list();
	}

	@Override
	public void addPerson(Person person) {
		getCurrentSession().save(person);
	}

	@Override
	public void updatePerson(Person person) {
		Person p = getPersonById(person.getPid());
		p.setName(person.getName());
		p.setLocation(person.getLocation());
		getCurrentSession().update(p);
	}

	@Override
	public void deletePerson(int pid) {
		getCurrentSession().delete(getPersonById(pid));
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean personExists(String name, String location) {
		String hql = "FROM Person as p WHERE p.name = :name and p.location = :location";
		
		Query query = getCurrentSession().createQuery(hql);
		query.setParameter("name",name);
		query.setParameter("location",location);
		List<Person> persons = (List<Person>) query.list();
		return persons.size() > 0 ? true : false;
	}
}
