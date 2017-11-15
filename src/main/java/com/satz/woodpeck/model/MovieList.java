package com.satz.woodpeck.model;

import java.util.ArrayList;
import java.util.List;

public class MovieList {
	
	private List<Movie> movies= new ArrayList<Movie>();

	public MovieList(List<Movie> movieList) {
		// TODO Auto-generated constructor stub
		this.movies=movieList;
	}

	public List<Movie> getMovies() {
		return movies;
	}

	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}
	
	
}
