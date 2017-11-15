package com.satz.woodpeck.service;

import java.util.List;

import com.satz.woodpeck.model.Person;

public interface PersonService {

	public void addPerson(Person p);
	public void updatePerson(Person p);
	public List<Person> listPersons();
	public Person getPersonById(int id);
	public void removePerson(int id);
	public List<Person> getPersonByName(String name);
	
}
