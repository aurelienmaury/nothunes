package fr.xebia.nothunes.domain

import fr.xebia.nothunes.security.User;

/**
 * Classe de domaine représentant un groupe de musique.
 * 
 * @author amaury
 *
 */
class Band {
	
	static belongsTo = User
	static hasMany = [albums: Album]
	
	/**
	 * Le nom du groupe.
	 */
	String name
	
	/**
	 * Chemin vers le fichier d'image qui sert de logo au groupe.
	 */
	String logoPath
	
	/**
	 * L'accroche du groupe, pour se présenter ou présenter leurs compositions.
	 */
	String description
	
	/**
	 * L'adresse d'un site externe qui pourrait être le site officiel du groupe.
	 */
	String webSite
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		name(nullable:false)
		description(nullable:false)
		webSite(url:true)
		lastUpdated(nullable:false)
	}
}
