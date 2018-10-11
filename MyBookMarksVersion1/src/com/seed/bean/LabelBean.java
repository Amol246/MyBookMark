package com.seed.bean;

import java.util.Date;

public class LabelBean{
	private int userId;
	private String labelName;
	private String note;
	private Date createdOn;
	private int labelId;

	public int getLabelId() {
		return labelId;
	}
	public void setLabelId(int labelId) {
		this.labelId = labelId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		
		this.userId = userId;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	
}
