package fr.xebia.nothunes.security

import fr.xebia.nothunes.security.Role
import fr.xebia.nothunes.domain.Band

/**
 * User domain class.
 */
class User {
	static transients = ['pass', 'confirmPasswd']
	static hasMany = [authorities: Role, bands: Band]
	
	static belongsTo = Role
	
	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	
	String confirmPasswd
	
	/** enabled */
	boolean enabled
	
	String email
	boolean emailShow
	
	/** description */
	String description = ''
	
	/** plain password to create a MD5 password */
	String pass = '[secret]'
	
	Date dateCreated
	
	Date lastUpdated
	
	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		confirmPasswd(validator :{val, obj ->
			if (obj.properties['passwd'] != val) {
				return 'default.invalid.confirmPasswd.message'
			}
		})
		enabled()
	}
}
