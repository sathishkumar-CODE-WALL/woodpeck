package com.satz.woodpeck.service;

import com.satz.woodpeck.model.Rating;

public interface RatingService {

	Rating addRating(Rating rating);
	Rating addMoreRating(Rating rating, int mId);
	Rating getRating(int rId);
	Rating removeRating(int rId);
	Rating updateRating(Rating rating, int mId,int rId);

}
