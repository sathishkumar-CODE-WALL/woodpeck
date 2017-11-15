package com.satz.woodpeck.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

@Repository
public class RatingDAOImpl implements RatingDAO{

	private static final Logger logger = LoggerFactory.getLogger(MovieDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Rating addRating(Rating rating) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(rating);
		logger.info("Rating saved successfully, rating Details="+rating);
		return rating;
	}

	@Override
	public Rating getRating(int rId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();		
		Rating rating = (Rating) session.get(Rating.class, new Integer(rId));
		logger.info("Rating loaded successfully, Rating details="+rating);
		return rating;
	}
	
	@Override
	public Rating removeRating(int rId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Rating rating = (Rating) session.load(Rating.class, new Integer(rId));
		if(null != rating){
			session.delete(rating);
			logger.info("Rating deleted successfully");
		}
		
		return rating;
	}

	@Override
	public Rating updateRating(Rating rating, int mId, int rId) {
		// TODO Auto-generated method stub
		
			Session session = this.sessionFactory.getCurrentSession();	
			session.update(rating);
			logger.info("Rating updated successfully"); 
			return rating;
		
	}

}
