package fr.xebia.nothunes.upload

import java.io.File;
import javax.activation.MimetypesFileTypeMap;

class UploadService {
	
	static transactional = false
	
	def authorizedImageContentType = [ 'image/jpeg' :'jpg', 'image/gif' :'gif', 'image/png' :'png']
	
	def authorizedAudioExtensions = [ 'mp3']
	
	/**
	 * Needed to access config
	 */
	def grailsApplication
	
	def saveImageFile(anImageFile, name) {
		if (!anImageFile.empty) {
			
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			def contentType = fileNameMap.getContentTypeFor(anImageFile.originalFilename)
			
			// checking if file to save has authorized mime type
			if ( authorizedImageContentType.keySet().contains(contentType) ) {
				File storageDir = new File(grailsApplication.config.storage.image.directory)
				if (!storageDir.exists()) {
					storageDir.mkdir();
				}
				def targetFilename = name + '_logo.' + authorizedImageContentType[contentType]
				anImageFile.transferTo( new File(grailsApplication.config.storage.image.directory + targetFilename) )
				
				return targetFilename
			} else {
				log.debug 'Someone tried to upload a non-image file : '+contentType
				return false
			}
		} else {
			return 'empty'
		}
	}
	
	def removeImageFile(name) {
		
		File storedImage = new File(grailsApplication.config.storage.image.directory + name)
		if (storedImage.exists()) {
			return storedImage.delete()
		}
		
		return true		
	}
	
	def saveAudioFile(anAudioFile, name) {
		if (!anAudioFile.empty) {
			
			
			def extension = anAudioFile.originalFilename.substring(anAudioFile.originalFilename.lastIndexOf('.') + 1)
			log.debug ("extension of ${anAudioFile.originalFilename} is ${extension}")
			
			
			// checking if file to save has authorized mime type
			if ( authorizedAudioExtensions.contains(extension) ) {
				File storageDir = new File(grailsApplication.config.storage.audio.directory)
				if (!storageDir.exists()) {
					storageDir.mkdir();
				}
				def targetFilename = name + '.' + extension
				anAudioFile.transferTo( new File(grailsApplication.config.storage.audio.directory + targetFilename) )
				
				return targetFilename
			} else {
				log.debug 'Someone tried to upload a non-authorized audio file : '+extension
				return false
			}
		} else {
			return 'empty'
		}
	}
	
	def removeAudioFile(name) {
		
		File storedAudio = new File(grailsApplication.config.storage.audio.directory + name)
		if (storedAudio.exists()) {
			return storedAudio.delete()
		}
		
		return true		
	}
}
