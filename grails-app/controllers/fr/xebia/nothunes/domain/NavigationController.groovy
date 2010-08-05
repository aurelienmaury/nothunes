package fr.xebia.nothunes.domain

import grails.converters.*;

class NavigationController {
   
   def index = { redirect action: 'list'
   }
   
   def list = {
      def trackList = Track.withCriteria {
         ne('audioPath', 'empty')
      }
      
      def albumList = Album.withCriteria {
         tracks {
            ne('audioPath', 'empty')
         }
      }
      
      def bandList = Band.withCriteria(listDistinct:true) {
         albums {
            tracks {
               ne('audioPath', 'empty')
            }
         }
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
      
      def albumList = Album.withCriteria {
         tracks {
            ne('audioPath', 'empty')
         }
         
         if (params.id) {
            band {
               eq('id', new Long(params.id))
            }
         }
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
