package nothunes

import nothunes.common.WebTestsNoThunes

class BandWebTests extends WebTestsNoThunes {

  def fixtureLoader

  void testLogin() {
    invoke(url:'login')
    verifyText(text:'Please Login..')

    def fixture = fixtureLoader.load('initialDev')
    invoke(url:'/navigation')
    verifyText(text:'RTNP')
    
  }

}