package fr.xebia.nothunes.domain

class Track {
	
	static belongsTo = [album:Album]
	
	String name
	
	String audioPath
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		name(nullable:false)
		audioPath(nullable:false)
	}
	
	def isOwnedBy (user) {
		return album?.band?.owner == user
	}
}
