import fr.xebia.nothunes.domain.*
import fr.xebia.nothunes.security.*

def member = User.findByUsername('user')
member.confirmPasswd = member.passwd

build {
  myBand(Band) {
    name = "MyBand"
    owner = member
  }
  myAlbum(Album) {
    name = "MyAlbum"
    band = myBand
  }
  myTrack(Track) {
    name = "Groovy In Action"
    album = myAlbum
  }
}