package fr.xebia.nothunes.domain

import grails.converters.*;

class NavigationController {
   
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
