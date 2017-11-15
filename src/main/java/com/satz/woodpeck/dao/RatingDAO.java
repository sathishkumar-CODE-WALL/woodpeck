package com.satz.woodpeck.dao;

import java.util.List;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

public interface RatingDAO {

	
	Rating addRating(Rating rating);
	Rating getRating(int rId);
	/*public List<Rating> listRating(int mid);
	public Rating geMovieById(int mid);
	public Rating removeRating(int rid);*/
	Rating removeRating(int rId);
	Rating updateRating(Rating rating,int mId,int rId);
}
