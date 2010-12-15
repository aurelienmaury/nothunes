package fr.xebia.nothunes.domain

import grails.test.*
import fr.xebia.nothunes.domain.*
import fr.xebia.nothunes.security.*

class TrackIntegTests extends GrailsUnitTestCase {

  def fixtureLoader

  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testLoadFixture() {

    def fixture = fixtureLoader.load('initialDev')

    def result = Track.listOrderByName()

    assertEquals 1, result.size()
    assertEquals 'Zombie Now', result[0].name
  }

  void testNotLoadedFixture() {

    def result = Track.listOrderByName()

    assertEquals 0, result.size()
  }

  void testPageOrderedByAlbumName() {

    def fixture = fixtureLoader.load('testPageOrderedByAlbumName')

    def result = Track.pageOrderedByAlbumName(4, 0, 'asc')

    assertEquals 4, result.size()
    assertEquals 'C-track', result[0].name
    assertEquals 'D-track', result[1].name
    assertEquals 'A-track', result[2].name
    assertEquals 'B-track', result[3].name
  }
}
