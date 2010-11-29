package nothunes

import grails.test.*
import fr.xebia.nothunes.domain.*
import fr.xebia.nothunes.security.*

class TrackTests extends GrailsUnitTestCase {

  def fixtureLoader

  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testSomethingElse() {


    assertEquals 1, Band.findAll().size()

  }

  void testSomething() {

    def fixture = fixtureLoader.load('tracktest')

    assert fixture.myBand.name
    assert fixture.myAlbum.name
    assert fixture.myTrack.name

    assertEquals 1, Track.findAll().size()
    assertEquals 2, Band.findAll().size()
    assertEquals 2, Album.findAll().size()

  }
}
