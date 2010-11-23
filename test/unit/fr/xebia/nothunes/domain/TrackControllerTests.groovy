package fr.xebia.nothunes.domain

import grails.test.*
import org.gmock.*
import static org.hamcrest.Matchers.*

@WithGMock
class TrackControllerTests extends ControllerUnitTestCase {
   
   protected void setUp() {
      
      super.setUp()
   }
   
   protected void tearDown() {
      super.tearDown()
   }
   
   void testIndex() {
      controller.index()
      assertEquals "list", controller.redirectArgs.action
   }
   
   
   
   
}
