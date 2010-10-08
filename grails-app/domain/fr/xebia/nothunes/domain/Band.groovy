package fr.xebia.nothunes.domain

import fr.xebia.nothunes.security.User;

/**
 * Classe de domaine repr�sentant un groupe de musique.
 * 
 * @author amaury
 *
 */
class Band {
   
   static searchable = [only: ['name']] 
   static belongsTo = [owner:User]
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
    * L'accroche du groupe, pour se pr�senter ou pr�senter leurs compositions.
    */
   String description
   
   /**
    * L'adresse d'un site externe qui pourrait �tre le site officiel du groupe.
    */
   String webSite
   
   Date dateCreated
   
   Date lastUpdated
   
   static constraints = {
      name(nullable:false)
      description(nullable:false)
      logoPath(nullable:true)
      webSite(url:true)
   }
}
