package com.satz.woodpeck.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

@Repository
public class MovieDAOImpl implements MovieDAO{

	
	private static final Logger logger = LoggerFactory.getLogger(MovieDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Movie addMovie(Movie movie) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(movie);
		logger.info("Movie saved successfully, Movie Details="+movie);
		return movie;
	}

	@Override
	public Movie updateMovie(Movie movie,int mId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		/*Movie existingMovie = (Movie) session.get(Movie.class, new Integer(mId));
		if(existingMovie != null){*/
		movie.setMovieId(mId);
		session.update(movie);
		/*logger.info("Movie updated successfully, movie Details="+movie);
		}*/
		return movie;
	}

	@Override
	public List<Movie> listMovies() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Movie> moviesList = session.createQuery("from Movie").list();
		for(Movie movie : moviesList){
			logger.info("Movie List::"+movie);
		}
		return moviesList;
	}
	
	@Override
	public Movie geMovieById(int mid) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();		
		Movie movie = (Movie) session.get(Movie.class, new Integer(mid));
		logger.info("Movie loaded successfully, Movie details="+movie);
		return movie;
	}

	@Override
	public Movie removeMovie(int mid) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Movie movie = (Movie) session.get(Movie.class, new Integer(mid));
		if(null != movie){
			session.delete(movie);
		}
		logger.info("Movie deleted successfully, Movie details="+movie);
		return movie;
	}

}
