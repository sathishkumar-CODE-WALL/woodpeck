package com.satz.woodpeck.common;

import java.util.List;
import java.util.OptionalDouble;

import com.satz.woodpeck.model.Rating;

public class CommonUtil {
	
	
	public static double calculateAvgRating(Rating rating){
		
		if(null == rating) return 0.0;
		
		int sum = rating.getActing() + rating.getDirection() 
		+rating.getScreenplay()+rating.getMusic()+rating.getStory();
		return (sum>0)?sum/5 : 0.0;
	}
	
	public static double calculateOverAllRating(List<Rating> ratingList){
		OptionalDouble overAllRate = ratingList.stream().mapToDouble(x -> x.getAvgRating()).average();
		return overAllRate.orElse(0);
	}
 
}
