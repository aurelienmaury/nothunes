package fr.xebia.nothunes.domain

class Album {
	
	static belongsTo = [band: Band]
	static hasMany = [tracks: Track]
	
	String name
	
	String description
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		name(nullable:false)	
	}
}
