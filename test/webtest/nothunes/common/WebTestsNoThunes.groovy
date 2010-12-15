/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package nothunes.common

class WebTestsNoThunes extends grails.util.WebTest {

  def login(username, password) {
    invoke(url:'login')
    verifyText(text:'Please Login..')
  }
}