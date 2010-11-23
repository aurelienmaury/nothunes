package fr.xebia.nothunes.domain

class Album {
   
   static searchable = [only: ['name']] 
   
   static belongsTo = [band: Band]
   static hasMany = [tracks: Track]
   
   String name
   
   String description
   
   String logoPath
   
   
   
   Date dateCreated
   
   Date lastUpdated
   
   static constraints = {
      name(nullable:false)
      description(nullable:true)
      logoPath(nullable:true)
   }

}
