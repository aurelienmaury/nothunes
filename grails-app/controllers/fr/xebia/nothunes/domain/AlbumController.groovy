package fr.xebia.nothunes.domain

import fr.xebia.nothunes.security.User

class AlbumController {
	
	def authenticateService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		
		if (!params.max) params.max = 10
		if (!params.offset) params.offset = 0
		if (!params.sort) params.sort = "name"
		if (!params.order) params.order = "asc"
		
		// list withCriteria tu support ordering by band name
		def albumList = Album.withCriteria {
			maxResults(params.max?.toInteger())
			firstResult(params.offset?.toInteger())
			if (params.sort == 'bandName') {
				band {
					order('name', params.order)
				}
			} else {
				order(params.sort, params.order)
			}
		}
		
		[albumInstanceList: albumList, albumInstanceTotal: Album.count()]
	}
	
	def create = {
		def albumInstance = new Album()
		albumInstance.properties = params
		
		def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
		
		return [albumInstance: albumInstance, bandList : bandList]
	}
	
	def save = {
		def albumInstance = new Album(params)
		if (albumInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'album.label', default: 'Album'), albumInstance.id])}"
			redirect(action: "show", id: albumInstance.id)
		}
		else {
			render(view: "create", model: [albumInstance: albumInstance])
		}
	}
	
	def show = {
		def albumInstance = Album.get(params.id)
		if (!albumInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
			redirect(action: "list")
		}
		else {
			[albumInstance: albumInstance]
		}
	}
	
	def edit = {
		def albumInstance = Album.get(params.id)
		if (!albumInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
			redirect(action: "list")
		}
		else {
			def bandList = Band.findAllByOwner(User.get(authenticateService.userDomain().id))
			
			return [albumInstance: albumInstance, bandList : bandList]
		}
	}
	
	def update = {
		def albumInstance = Album.get(params.id)
		if (albumInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (albumInstance.version > version) {
					
					albumInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'album.label', default: 'Album')] as Object[], "Another user has updated this Album while you were editing")
					render(view: "edit", model: [albumInstance: albumInstance])
					return
				}
			}
			albumInstance.properties = params
			if (!albumInstance.hasErrors() && albumInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'album.label', default: 'Album'), albumInstance.id])}"
				redirect(action: "show", id: albumInstance.id)
			}
			else {
				render(view: "edit", model: [albumInstance: albumInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def delete = {
		def albumInstance = Album.get(params.id)
		if (albumInstance) {
			try {
				albumInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'album.label', default: 'Album'), params.id])}"
			redirect(action: "list")
		}
	}
}
