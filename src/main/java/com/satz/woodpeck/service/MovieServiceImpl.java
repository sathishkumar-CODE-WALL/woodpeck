package com.satz.woodpeck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.satz.woodpeck.common.CommonUtil;
import com.satz.woodpeck.controller.MovieRatingController;
import com.satz.woodpeck.dao.MovieDAO;
import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	@Transactional
	public List<Movie> listMovies() {
		// TODO Auto-generated method stub
		return this.movieDAO.listMovies();
	}

	@Override
	@Transactional
	public Movie addMovie(Movie movie) {
		return this.movieDAO.addMovie(movie);
	}

	@Override
	@Transactional
	public Movie removeMovie(int id) {
		// TODO Auto-generated method stub
		return this.movieDAO.removeMovie(id);
	}

	@Override
	@Transactional
	public Movie updateMovie(Movie movie,int mId) {
		// TODO Auto-generated method stub
		return this.movieDAO.updateMovie(movie,mId);
	}

	@Override
	@Transactional
	public Movie getMovie(int mid) {
		// TODO Auto-generated method stub
		Movie movie = this.movieDAO.geMovieById(mid);
		updateMovieOARating(movie);
		/*for(Rating rating : movie.getRatingSet()){
			methodOn(MovieController.class).
			rating = linkTo(methodOn(MovieRatingController.class).slash(rating.getRatingId())).withSelfRel();
			rating.add(link);
		}*/
		return movie;
	}
	
	
	private void updateMovieOARating(Movie movie){
		movie.setOverAllRating(CommonUtil.calculateOverAllRating(movie.getRatingSet()));
	}
}
