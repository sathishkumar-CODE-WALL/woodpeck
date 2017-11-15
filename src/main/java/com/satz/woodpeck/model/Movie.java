package com.satz.woodpeck.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.hateoas.ResourceSupport;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="movie")
public class Movie extends ResourceSupport{
	
	@Id
	@Column(name="mid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int movieId;
	
	@Column(name="movie_name")
	private String movieName;
	
	private String lang;
	
	@Column(name="display_name")
	private String displayName;
    
	@Column(name = "movie_icon")
    private byte[] data;
	
	private String genre;
	
	private String casting;
	
	private String director;
	
	@Column(name="mdirector")
	private String musicDirector;
	@Transient
	private double overAllRating;
	
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL,mappedBy="movie",orphanRemoval = true)
	@JsonManagedReference
	private List<Rating> ratingSet = new ArrayList<Rating>();
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCasting() {
		return casting;
	}
	public void setCasting(String casting) {
		this.casting = casting;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getMusicDirector() {
		return musicDirector;
	}
	public void setMusicDirector(String musicDirector) {
		this.musicDirector = musicDirector;
	}
	public double getOverAllRating() {
		return (double)Math.round(overAllRating * 100d) / 100d;
	}
	public void setOverAllRating(double overAllRating) {
		this.overAllRating = overAllRating;
	}
	public List<Rating> getRatingSet() {
		return ratingSet;
	}
	
	public void setRatingSet(List<Rating> ratingSet) {
		 if (this.ratingSet != null){
			 for(Rating rating : ratingSet){
				 rating.setMovie(this);
				 this.ratingSet.add(rating);
			 }
         }else{
        	 this.ratingSet=ratingSet;
         }
	}
	
	
	

}
