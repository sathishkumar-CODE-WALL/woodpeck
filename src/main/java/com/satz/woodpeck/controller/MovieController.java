package com.satz.woodpeck.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Link;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.satz.woodpeck.model.Movie;
import com.satz.woodpeck.model.MovieList;
import com.satz.woodpeck.model.Rating;
import com.satz.woodpeck.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired(required=true)
	private MovieService movieService;
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@RequestMapping(value = "/movies", method = RequestMethod.GET)
	public @ResponseBody MovieList listMovies() {
		logger.info("Entering get Movie");
		List<Movie> movieList = this.movieService.listMovies();
		return new MovieList(movieList);
	}
	
	@RequestMapping(value = "/movies/{id}", method = RequestMethod.GET)
	public @ResponseBody HttpEntity<Movie> getMovie(@PathVariable("id") int id) {
		Movie movie = this.movieService.getMovie(id);
		Link link = linkTo(methodOn(MovieController.class).getMovie(id)).withSelfRel();
		movie.add(link);
		addLinksToRatings(movie);
		return new ResponseEntity<Movie>(movie, HttpStatus.OK);
	}
	
	//For update person both
	@RequestMapping(value= "/movies", method = RequestMethod.POST)
	public @ResponseBody Movie addMovie(@RequestBody Movie movie){
		
		return this.movieService.addMovie(movie);
	}
	
	@RequestMapping(value= "/movies/{id}", method = RequestMethod.DELETE)
    public @ResponseBody Movie removeMovie(@PathVariable("id") int id){
		
         return this.movieService.removeMovie(id);
    }
	
	//For update person 
		@RequestMapping(value= "/movies/{id}", method = RequestMethod.PUT)
		public @ResponseBody Movie editMovie(@PathVariable("id") int mId, @RequestBody Movie movie){
			return this.movieService.updateMovie(movie,mId);
	}
	
	// for getting UI
	@RequestMapping(value = "/moviesreviewhome", method = RequestMethod.GET)
	public String homepage() {
		return "home";
	}
	
	private void addLinksToRatings(Movie movie){
		for(Rating rating : movie.getRatingSet()){
			rating.add(linkTo(methodOn(MovieRatingController.class).getRating(movie.getMovieId(),rating.getRatingId())).withSelfRel());
		}
		
	}
	
}
