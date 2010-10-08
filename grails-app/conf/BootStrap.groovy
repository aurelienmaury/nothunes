import fr.xebia.nothunes.security.*
import fr.xebia.nothunes.domain.*

class BootStrap {
   
   def authenticateService
   
   def init = { servletContext ->
      
      def roleAdmin = new Role(authority: 'ROLE_ADMIN', description: 'Administrateur').save()
      def roleUser = new Role(authority: 'ROLE_USER', description: 'Utilisateur').save()
      
      def userAdmin = new User(username: 'admin', userRealName: 'ATTAN Charles',
      passwd: authenticateService.encodePassword('admin'),
      enabled: true, email: 'admin@nothunes.xebia.fr')
      
      userAdmin.addToAuthorities(roleAdmin)
      
      def leGroupe = new Band(name: 'RTNP', webSite: 'http://rtnp.org', description: 'desc', owner: userAdmin)
      leGroupe.albums = []
      leGroupe.albums << new Album(band: leGroupe, name:'Promotion canapé')
      
      userAdmin.bands = []
      userAdmin.bands << leGroupe
      
      userAdmin.save()
      
      
      def userStd = new User(username: 'user', userRealName: 'ATTAN Charles',
      passwd: authenticateService.encodePassword('user'),
      enabled: true, email: 'admin@nothunes.xebia.fr')
      userStd.addToAuthorities(roleUser)
      userStd.save()
      
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
