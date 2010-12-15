import fr.xebia.nothunes.domain.*
import fr.xebia.nothunes.security.*

def member = User.findByUsername('user')
member.confirmPasswd = member.passwd

build {
  rtnp(Band) {
    name = 'RTNP'
    webSite = 'http://rtnp.org'
    owner = member
  }
  promotionCanape(Album) {
    name = "Promotion Canapé"
    band = rtnp
  }
  zombieNow(Track) {
    name = "Zombie Now"
    album = promotionCanape
  }
}