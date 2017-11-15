package com.satz.woodpeck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.Rating;
import com.satz.woodpeck.service.MovieService;
import com.satz.woodpeck.service.RatingService;

@Controller
public class MovieRatingController {

	@Autowired(required=true)
	private RatingService ratingService;
	@Autowired(required=true)
	private MovieService movieService;
	
	@RequestMapping(value = "/movies/{mid}/ratings", method = RequestMethod.GET)
	public @ResponseBody List<Rating> listMovies(@PathVariable("mid") int mid) {
		
		Movie movie = this.movieService.getMovie(mid);
		List<Rating> ratingList = movie.getRatingSet();
		return ratingList;
	}
	
	
	//For update person both
	@RequestMapping(value= "/movies/{mid}/ratings", method = RequestMethod.POST)
	public @ResponseBody Rating addRating(@PathVariable("mid") int mId,@RequestBody Rating rating){
		
		
			return this.ratingService.addMoreRating(rating,mId);
		
	}
	
	@RequestMapping(value = "/movies/{mid}/ratings/{rid}", method = RequestMethod.GET)
	public @ResponseBody Rating getRating(@PathVariable("mid") int mId,@PathVariable("rid") int rId) {
		Movie movie = movieService.getMovie(mId);
		if(movie!=null){
			return this.ratingService.getRating(rId);
		}else{
			return null;
		}
			
	}
	
	@RequestMapping(value= "/movies/{mid}/ratings/{rid}", method = RequestMethod.DELETE)
    public @ResponseBody Rating removeRating(@PathVariable("id") int rId){
		
         return this.ratingService.removeRating(rId);
    }
 
 
	@RequestMapping(value= "/movies/{mid}/ratings/{rid}", method = RequestMethod.PUT)
	public @ResponseBody Rating editRating(@RequestBody Rating rating, @PathVariable("mid") int mId,@PathVariable("rid") int rId){
		
		return this.ratingService.updateRating(rating,mId,rId);
	}
	
}
