package fr.xebia.nothunes.upload

import java.io.File;

class UploadService {
	
	static transactional = false
	
	def authorizedImageContentType = [ 'image/jpeg' :'jpg', 'image/gif' :'gif', 'image/png' :'png']
	
	/**
	 * Needed to access config
	 */
	def grailsApplication
	
	def saveImageFile(anImageFile, name) {
		if (!anImageFile.empty) {
			
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			def contentType = fileNameMap.getContentTypeFor(anImageFile.originalFilename)
			
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
			return false
		}
	}
}
