package fr.xebia.nothunes.domain

import java.util.List;

class Track {
   
   static searchable = [only: ['name']] 
   
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
   
  
   
   static List<Track> pageOrderedByAlbumName(max, offset, orderType) {
      Track.withCriteria {
         maxResults(max?.toInteger())
         firstResult(offset?.toInteger())
         album {
            order('name', params.order)
         }
         order('name', 'asc')
      }
   }
}
