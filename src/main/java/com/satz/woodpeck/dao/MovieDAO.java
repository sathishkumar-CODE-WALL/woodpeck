package com.satz.woodpeck.dao;

import java.util.List;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

public interface MovieDAO {

	public Movie addMovie(Movie m);
	public Movie updateMovie(Movie m,int mId);
	public List<Movie> listMovies();
	public Movie geMovieById(int mid);
	public Movie removeMovie(int mid);
}
