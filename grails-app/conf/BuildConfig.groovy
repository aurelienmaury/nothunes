grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
   // inherit Grails' default dependencies
   inherits("global") {
      // uncomment to disable ehcache
      // excludes 'ehcache'
   }
   log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
   repositories {
      grailsPlugins()
      grailsHome()
      grailsCentral()
      
      // uncomment the below to enable remote dependency resolution
      // from public Maven repositories
      //mavenLocal()
      //mavenCentral()
      //mavenRepo "http://snapshots.repository.codehaus.org"
      //mavenRepo "http://repository.codehaus.org"
      //mavenRepo "http://download.java.net/maven/2/"
      //mavenRepo "http://repository.jboss.com/maven2/"
   }
   dependencies { // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
      runtime 'net.sf.javamusictag:jid3lib:0.5.4'
      test 'org.gmock:gmock:0.8.0'
      test 'org.hamcrest:hamcrest-all:1.0'
    }
}
