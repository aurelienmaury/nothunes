package fr.xebia.nothunes.domain

import fr.xebia.nothunes.security.User


class TrackController {
   
  def authenticateService
   
  def uploadService
   
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
   
  def index = {
    redirect(action: "list", params: params)
  }
   
  def list = {
    if (!params.max) params.max = 10
    if (!params.offset) params.offset = 0
    if (!params.sort) params.sort = "name"
    if (!params.order) params.order = "asc"
      
    def trackList

    def owner = User.get(authenticateService.userDomain().id)
      
    trackList = Track.withCriteria {
      maxResults(params.max?.toInteger())
      firstResult(params.offset?.toInteger())
      album {
        band {
          eq 'owner', owner
          if (params.sort == 'bandName') {
            order ('name', params.order).ignoreCase()
          }
        }
        if (params.sort == 'albumName') {
          order('name', params.order).ignoreCase()
        }
      }
      order('name', params.order).ignoreCase()
    }
    
      
    return [trackInstanceList: trackList, trackInstanceTotal: trackList.count()]
  }
   
  def create = {
    def trackInstance = new Track()
    trackInstance.properties = params
      
    def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
      
    return [trackInstance: trackInstance, bandList: bandList]
  }
   
  def save = {
    def trackInstance = new Track(params)
      
    if (trackInstance.isOwnedBy(User.get(authenticateService.userDomain().id))) {
         
      // saving image File with the UploadService
      def audioSaved = uploadService.saveAudioFile(request.getFile('audioFile'), trackInstance.album.band.name+'_'+trackInstance.album.name+'_'+trackInstance.name)
      if (audioSaved) {
        trackInstance.audioPath = audioSaved
      } else {
        flash.message = 'Bad audio type. Authorized is : mp3'
        def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
        render(view: "create", model: [albumInstance: trackInstance, bandList: bandList])
        return
      }
         
      if (trackInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'track.label', default: 'Track'), trackInstance.id])}"
        redirect(action: "show", id: trackInstance.id)
      }
      else {
        def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
        render(view: "create", model: [trackInstance: trackInstance, bandList: bandList])
      }
    } else {
      flash.message = 'You try to create a Track for a Band you do not own.';
      def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
      render(view: "create", model: [trackInstance: trackInstance, bandList: bandList])
    }
  }
   
  def show = {
    def trackInstance = Track.get(params.id)
    if (!trackInstance || !trackInstance.isOwnedBy(User.get(authenticateService.userDomain().id))) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'track.label', default: 'Track'), params.id])}"
      redirect(action: "list")
    }
    else {
      [trackInstance: trackInstance]
    }
  }
   
  def edit = {
    def trackInstance = Track.get(params.id)
    if (!trackInstance || !trackInstance.isOwnedBy(User.get(authenticateService.userDomain().id))) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'track.label', default: 'Track'), params.id])}"
      redirect(action: "list")
    }
    else {
      def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
         
      return [trackInstance: trackInstance, bandList: bandList, band: trackInstance.album.band, albums: trackInstance.album.band.albums]
    }
  }
   
  def update = {
    def trackInstance = Track.get(params.id)
    if (trackInstance && trackInstance.isOwnedBy(User.get(authenticateService.userDomain().id))) {
      if (params.version) {
        def version = params.version.toLong()
        if (trackInstance.version > version) {
               
          trackInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'track.label', default: 'Track')] as Object[], "Another user has updated this Track while you were editing")
          render(view: "edit", model: [trackInstance: trackInstance])
          return
        }
      }
         
         
      // saving image File with the UploadService
      if (params.audioChanged) {
        log.debug 'Band logo has changed, deleting old one, saving new one'
            
        uploadService.removeAudioFile(trackInstance.audioPath)
            
        // saving image File with the UploadService
        def audioSaved = uploadService.saveAudioFile(request.getFile('audioFile'), trackInstance.album.band.name+'_'+trackInstance.album.name+'_'+trackInstance.name)
        if (audioSaved) {
          trackInstance.audioPath = audioSaved
        } else {
          flash.message = 'Bad audio type. Authorized is : mp3'
          def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
          render(view: "edit", model: [albumInstance: trackInstance, bandList: bandList])
          return
        }
      } else {
        log.debug 'Audio file has not changed'
      }
         
         
         
         
      trackInstance.properties = params
      if (!trackInstance.hasErrors() && trackInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'track.label', default: 'Track'), trackInstance.id])}"
        redirect(action: "show", id: trackInstance.id)
      }
      else {
        render(view: "edit", model: [trackInstance: trackInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'track.label', default: 'Track'), params.id])}"
      redirect(action: "list")
    }
  }
   
  def delete = {
    def trackInstance = Track.get(params.id)
    if (trackInstance && trackInstance.isOwnedBy(User.get(authenticateService.userDomain().id))) {
         
      uploadService.removeAudioFile(trackInstance.audioPath)
         
      try {
        trackInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'track.label', default: 'Track'), trackInstance.name])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'track.label', default: 'Track'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'track.label', default: 'Track'), params.id])}"
      redirect(action: "list")
    }
  }
   
   
}
