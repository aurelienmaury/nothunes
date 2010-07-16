package fr.xebia.nothunes.domain

class Track {
	
	static belongsTo = Band
	
	String name
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		name(nullable:false)
		lastUpdated(nullable:false)
	}
}
