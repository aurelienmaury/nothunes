import fr.xebia.nothunes.domain.*
import fr.xebia.nothunes.security.*

def member = User.findByUsername('user')
member.confirmPasswd = member.passwd

build {
  myBand(Band) {
    name = 'myBand'
    owner = member
  }
  myAlbumA(Album) {
    name = 'myAlbumA'
    band = myBand
  }
  myAlbumB(Album) {
    name = 'myAlbumB'
    band = myBand
  }
  first(Track) {
    name = 'A-track'
    album = myAlbumB
  }
  second(Track) {
    name = 'B-track'
    album = myAlbumB
  }
  third(Track) {
    name = 'C-track'
    album = myAlbumA
  }
  fourth(Track) {
    name = 'D-track'
    album = myAlbumA
  }
}