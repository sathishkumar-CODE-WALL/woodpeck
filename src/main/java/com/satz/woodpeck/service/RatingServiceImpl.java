package com.satz.woodpeck.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.satz.woodpeck.common.CommonUtil;
import com.satz.woodpeck.dao.MovieDAO;
import com.satz.woodpeck.dao.RatingDAO;
import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;

@Service
public class RatingServiceImpl implements RatingService {

	
	@Autowired
	private RatingDAO ratingDAO;
	@Autowired
	private MovieDAO movieDAO;
	
	@Override
	@Transactional
	public Rating addMoreRating(Rating rating,int mid) {
		// TODO Auto-generated method stub
		
		Movie movie = movieDAO.geMovieById(mid);
		if(movie!=null){
			rating.setMovie(movie);
			rating.setAvgRating(CommonUtil.calculateAvgRating(rating));
			return this.ratingDAO.addRating(rating);
		}
		return null;
	}
		
	@Override
	@Transactional
	public Rating addRating(Rating rating) {
		// TODO Auto-generated method stub
		return this.ratingDAO.addRating(rating);
	}	

	@Override
	@Transactional
	public Rating getRating(int rId) {
		// TODO Auto-generated method stub
		return this.ratingDAO.getRating(rId);
	}

	@Override
	@Transactional
	public Rating removeRating(int rId) {
		// TODO Auto-generated method stub
		return this.ratingDAO.removeRating(rId);
	}

	@Override
	@Transactional
	public Rating updateRating(Rating rating, int mId, int rId) {
		// TODO Auto-generated method stub
		return this.ratingDAO.updateRating(rating, mId, rId);
	}
}
