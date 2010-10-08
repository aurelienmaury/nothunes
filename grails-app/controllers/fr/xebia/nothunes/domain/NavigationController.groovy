package fr.xebia.nothunes.domain

import grails.converters.*;

class NavigationController {
   
   def searchableService
   
   def index = { redirect action: 'list'
   }
   
   def list = {
      def trackList = Track.withCriteria {
         ne('audioPath', 'empty')
      }
      
      def albumCriteria = Album.createCriteria()
      def albumList = albumCriteria.listDistinct {
         tracks {
            ne('audioPath', 'empty')
         }
         order('name', 'asc')
      }
      
      def bandCriteria = Band.createCriteria()
      def bandList = bandCriteria.listDistinct {
         albums {
            tracks {
               ne('audioPath', 'empty')
            }
         }
         order('name', 'asc')
      }
      
      [bandList: bandList, albumList: albumList, trackList: trackList]
   }
   
   def search = {
      String searchQuery = instrument(params.searchQuery)
      
      log.debug "search query is ${searchQuery}"
      
      def result = searchableService.search(searchQuery)
      
      def albumResult = Album.searchEvery(searchQuery)
      def bandResult = Band.searchEvery(searchQuery)
      def trackResult = Track.searchEvery(searchQuery)
      
      def trackList = [] as Set
      def bandList = [] as Set
      def albumList = [] as Set
      
      // filtrage des tracks pour n'afficher que ceux qui ont un fichier audio
      trackResult.each {
         def fullTrack = Track.get(it.id)
         if (fullTrack.audioPath) {
            trackList.add(fullTrack)
            albumList.add(fullTrack.album)
            bandList.add(fullTrack.album.band)
         }
      }
      
      // filtrage des albums pour afficher uniquement ceux qui ont au moins un track avec un fichier audio
      albumResult.each {
         
         def hasOneCompleteTrack = false
         def fullAlbum = Album.get(it.id)
         fullAlbum.tracks.each { aTrack ->
            if (aTrack.audioPath) {
               trackList.add(aTrack)
               hasOneCompleteTrack = true
            }
         }
         
         if (hasOneCompleteTrack)  {
            albumList.add(fullAlbum)
            bandList.add(fullAlbum.band)
         }
      }
      
      bandResult.each {
         def fullBand = Band.get(it.id)
         fullBand.albums.each {anAlbum ->
            def hasOneCompleteTrack = false
            
            anAlbum.tracks.each { aTrack ->
               if (aTrack.audioPath) {
                  trackList.add(aTrack)
                  hasOneCompleteTrack = true
               }
            }
            
            if (hasOneCompleteTrack)  {
               bandList.add(fullBand)
               albumList.add(anAlbum)
            }
         }
         
         
      }
      
      render (view:'list', model: [bandList: bandList, albumList: albumList, trackList: trackList, searchQuery: params.searchQuery])
   }
   
   def instrument(String query) {
      return query+"*"
   }
   
   def ajaxFilterTrackByBand = {
      
      def trackList = Track.withCriteria {
         ne('audioPath', 'empty')
         
         if (params.id) {
            album {
               band {
                  eq('id', new Long(params.id))
               }
            }
         }
      }
      
      render (view:'_trackList', model: [trackList: trackList])
   } 
   
   def ajaxFilterAlbumByBand = {
      
      def albumCriteria = Album.createCriteria()
      def albumList = albumCriteria.listDistinct {
         tracks {
            ne('audioPath', 'empty')
         }
         
         if (params.id) {
            band {
               eq('id', new Long(params.id))
            }
         }
         order('name', 'asc')
      }
      
      render albumList as JSON
   }
   
   def ajaxFilterTrackByAlbum = {
      
      def trackList = Track.withCriteria {
         ne('audioPath', 'empty')
         
         if (params.id) {
            album {
               eq('id', new Long(params.id))
               if (params.band) {
                  band {
                     eq('id', new Long(params.band))
                  }
               }
            }
         }
      }
      
      
      
      
      
      render (view:'_trackList', model: [trackList: trackList])
   }
}
