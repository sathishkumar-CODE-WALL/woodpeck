package com.satz.woodpeck.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.hateoas.ResourceSupport;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="rating")
public class Rating extends ResourceSupport{
	
	@Id
	@Column(name="rid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ratingId;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="mid",referencedColumnName = "mid")
	@JsonBackReference
	private Movie movie;
	
	@Column(name="uid") 
	private int  userId;
	private int acting; 
	private int direction;
	private int story;
	private int screenplay;
	private int music;
	private String comments;
	private double avgRating;
	
	public Rating(){
		
	}
	
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public int getActing() {
		return acting;
	}
	public void setActing(int acting) {
		this.acting = acting;
	}
	public int getDirection() {
		return direction;
	}
	public void setDirection(int direction) {
		this.direction = direction;
	}
	public int getStory() {
		return story;
	}
	public void setStory(int story) {
		this.story = story;
	}
	public int getScreenplay() {
		return screenplay;
	}
	public void setScreenplay(int screenplay) {
		this.screenplay = screenplay;
	}
	public int getMusic() {
		return music;
	}
	public void setMusic(int music) {
		this.music = music;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getRatingId() {
		return ratingId;
	}
	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getAvgRating() {
		return (double)Math.round(avgRating * 100d) / 100d;
	}

	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}

}
