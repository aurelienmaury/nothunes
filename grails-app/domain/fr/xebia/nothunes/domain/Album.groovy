package fr.xebia.nothunes.domain

class Album {
	
	static belongsTo = Band
	static hasMany = [tracks: Track]
	
	String name
	
	String description
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		name(nullable:false)	
		lastUpdated(nullable:false)
	}
}
