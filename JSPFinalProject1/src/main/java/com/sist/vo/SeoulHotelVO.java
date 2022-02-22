package com.sist.vo;

/*
 *    NO                                        NOT NULL NUMBER
      NAME                                      NOT NULL VARCHAR2(100)
      SCORE                                              NUMBER(2,1)
      ADDRESS                                   NOT NULL VARCHAR2(300)
      POSTER                                    NOT NULL VARCHAR2(4000)
      IMAGES                                             VARCHAR2(4000)
 */
public class SeoulHotelVO {
	private int no;
	private String name;
	private double score;
	private String address;
	private String poster;
	private String images;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

}