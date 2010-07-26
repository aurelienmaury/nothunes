package fr.xebia.nothunes.profile

import fr.xebia.nothunes.security.*

/**
 * Controller dedicated to showing and updating the current user profile.
 * 
 * @author amaury
 *
 */
class ProfileController {
	
	def authenticateService
	
	def index = {
		// redirection to show
		redirect action: show, params: params
	}
	
	def show = {
		// get current user from db
		def person = User.get(authenticateService.userDomain().id)
		
		// build and return the form data Map
		return buildPersonModel(person)
	}
	
	
	def edit = {
		// get current user from db
		def person = User.get(authenticateService.userDomain().id)
		
		// build and return the form data Map
		return  buildPersonModel(person)
	}
	
	
	def update = {
		
		// get current user from db
		def userFromBase = User.get(authenticateService.userDomain().id)
		
		// checking the version of the data from the form against the date from db
		long version = params.version.toLong()
		if (userFromBase.version > version) {
			userFromBase.errors.rejectValue 'version', "person.optimistic.locking.failure",
			"An administrator has updated your profile while you were editing."
			render view: 'edit', model: buildPersonModel(userFromBase)
			return
		}
		
		// copying old password for comparison
		def oldPassword = userFromBase.passwd
		
		// applying updates to db instance
		userFromBase.properties = params
		
		// checking password is not the same as old value
		if (!params.passwd.equals(oldPassword)) {
			// applying password, look User constraints to see the 'passwd == confirmPasswd' validator
			userFromBase.passwd = authenticateService.encodePassword(params.passwd)
			userFromBase.confirmPasswd = authenticateService.encodePassword(params.confirmPasswd)
		}
		
		// saving or returning to edition
		if (userFromBase.save()) {
			flash.message = 'Profile updated'
			redirect action: 'show'
		} else {
			flash.message = 'Profile could not be saved, please retry'
			render view: 'edit', model: buildPersonModel(userFromBase)
		}
	}
	
	/**
	 * Builds the data of the person in a Map to show it in the views.
	 * 
	 * @param person User
	 * 
	 * @return Map
	 */
	private Map buildPersonModel(person) {
		
		List roles = Role.list()
		roles.sort { r1, r2 ->
			r1.authority <=> r2.authority
		}
		Set userRoleNames = []
		for (role in person.authorities) {
			userRoleNames << role.authority
		}
		LinkedHashMap<Role, Boolean> roleMap = [:]
		for (role in roles) {
			roleMap[(role)] = userRoleNames.contains(role.authority)
		}
		
		return [person: person, roleMap: roleMap]
	}
}
