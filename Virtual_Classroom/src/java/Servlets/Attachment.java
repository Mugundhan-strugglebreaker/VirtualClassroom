package Servlets;

import java.sql.Blob;

public class Attachment 
{
	int id;
	String filename;
	String description;
	Blob filedata;
	public Attachment(int id, String filename, Blob filedata, String description) {
		super();
		this.id = id;
		this.filename = filename;
		this.description = description;
		this.filedata = filedata;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Blob getFiledata() {
		return filedata;
	}
	public void setFiledata(Blob filedata) {
		this.filedata = filedata;
	}
	
	
}