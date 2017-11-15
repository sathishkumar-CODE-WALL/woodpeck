package com.satz.woodpeck.service;

import java.util.List;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

public interface MovieService {

	List<Movie> listMovies();

	Movie addMovie(Movie movie);

	Movie removeMovie(int id);

	Movie updateMovie(Movie movie,int mId);
	
	Movie getMovie(int mid);
	
}
