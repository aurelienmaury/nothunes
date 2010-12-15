import fr.xebia.nothunes.security.*
import fr.xebia.nothunes.domain.*

class BootStrap {
   
  def authenticateService

  def fixtureLoader
   
  def init = { servletContext ->

    // definition des Roles
    def roleAdmin = new Role(authority: 'ROLE_ADMIN', description: 'Administrateur').save()
    def roleUser = new Role(authority: 'ROLE_USER', description: 'Utilisateur').save()

    

    // definition d'un compte admin de base
    def userAdmin = new User(username: 'admin', userRealName: '',
      passwd: authenticateService.encodePassword('admin'),
      enabled: true, email: 'admin@nothunes.xebia.fr')

    if (userAdmin && roleAdmin) {
      userAdmin.addToAuthorities(roleAdmin)
      userAdmin.save()
    }

    // definition d'un compte membre de base
    def userStd = new User(username: 'user', userRealName: 'ATTAN Charles',
      passwd: authenticateService.encodePassword('user'),
      enabled: true, email: 'admin@nothunes.xebia.fr')

    if (userStd && roleUser) {
      userStd.addToAuthorities(roleUser)
      userStd.save()
    }

      
      
    

    // definition des regles de securite, filtrage par url
    def protectUserManaging = new RequestMap(url: '/user/*', configAttribute: 'ROLE_ADMIN').save()
    def protectRoleManaging = new RequestMap(url: '/role/*', configAttribute: 'ROLE_ADMIN').save()
    def protectSecurityMappingManaging = new RequestMap(url: '/requestMap/*', configAttribute: 'ROLE_ADMIN').save()
    def protectUserProfileManaging = new RequestMap(url: '/profile/*', configAttribute: 'ROLE_ADMIN,ROLE_USER').save()
    def protectBandManaging = new RequestMap(url: '/band/*', configAttribute: 'ROLE_ADMIN,ROLE_USER').save()
    def protectAlbumManaging = new RequestMap(url: '/album/*', configAttribute: 'ROLE_ADMIN,ROLE_USER').save()
    def protectTrackManaging = new RequestMap(url: '/track/*', configAttribute: 'ROLE_ADMIN,ROLE_USER').save()
  }
  def destroy = {
  }
}
