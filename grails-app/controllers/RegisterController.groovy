import fr.xebia.nothunes.security.User
import fr.xebia.nothunes.security.Role

import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

/**
 * Controleur de creation de compte membre.
 */
class RegisterController {
	
	/**
	 * Injection du service d'authentification.
	 */
	def authenticateService
	
	/**
	 * Injection du fournisseur de jeton d'authentification.
	 */
	def daoAuthenticationProvider
	
	/**
	 * Injection du service d'envoi de mail.
	 */
	def emailerService
	
	static Map allowedMethods = [save: 'POST', update: 'POST']
	
	/**
	 * Page par defaut, formulaire de creation de compte.
	 */
	def index = {
		
		// skip if already logged in
		if (authenticateService.isLoggedIn()) {
			redirect action: show
			return
		}
		
		if (session.id) {
			def person = new User()
			person.properties = params
			return [person: person]
		}
		
		redirect uri: '/'
	}
	
	
	/**
	 * Sauvegarde du compte.
	 */
	def save = {
		
		// skip if already logged in
		if (authenticateService.isLoggedIn()) {
			redirect action: profile
			return
		}
		
		def person = new User()
		person.properties = params
		
		def config = authenticateService.securityConfig
		def defaultRole = config.security.defaultRole
		
		def role = Role.findByAuthority(defaultRole)
		if (!role) {
			person.passwd = ''
			flash.message = 'Default Role not found.'
			render view: 'index', model: [person: person]
			return
		}
		
		if (params.captcha.toUpperCase() != session.captcha) {
			person.passwd = ''
			flash.message = 'Access code did not match.'
			render view: 'index', model: [person: person]
			return
		}
		
		if (params.passwd != params.confirmPasswd) {
			person.passwd = ''
			log.debug "passwd : ${params.passwd} confirmPasswd : ${params.confirmPasswd}"
			flash.message = 'The passwords you entered do not match.'
			render view: 'index', model: [person: person]
			return
		}
		
		def pass = authenticateService.encodePassword(params.passwd)
		person.passwd = pass
		person.confirmPasswd = authenticateService.encodePassword(params.confirmPasswd) 
		person.enabled = true
		person.emailShow = true
		person.description = ''
		if (person.save()) {
			role.addToPeople(person)
			if (config.security.useMail) {
				String emailContent = """You have signed up for an account at:

 ${request.scheme}://${request.serverName}:${request.serverPort}${request.contextPath}

 Here are the details of your account:
 -------------------------------------
 LoginName: ${person.username}
 Email: ${person.email}
 Full Name: ${person.userRealName}
 Password: ${params.passwd}
"""
				
				def email = [
				to: [person.email], // 'to' expects a List, NOT a single email address
				subject: "[${request.contextPath}] Account Signed Up",
				text: emailContent // 'text' is the email body
				]
				emailerService.sendEmails([email])
			}
			
			person.save(flush: true)
			
			def auth = new AuthToken(person.username, params.passwd)
			def authtoken = daoAuthenticationProvider.authenticate(auth)
			SCH.context.authentication = authtoken
			
			flash.message = 'Your account is now created. Welcome.'
			redirect uri: '/'
		}
		else {
			person.passwd = ''
			render view: 'index', model: [person: person]
		}
	}
}
