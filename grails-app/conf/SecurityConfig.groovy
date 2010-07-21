security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "fr.xebia.nothunes.security.User"
	authorityDomainClass = "fr.xebia.nothunes.security.Role"
	requestMapClass = "fr.xebia.nothunes.security.RequestMap"

	//useMail                 = true          // specifie d'envoyer un mail à l'enregistrement d'un compte
        //mailHost                = 'localhost'   // serveur d'envoi de mails
        //mailProtocol            = 'smtp'        // nom du protocole JavaMail
        //mailFrom                = 'no.reply@bookstore.fr'   // adresse de l'envoyeur du mail
        //mailPort                = 25            // port de connexion au serveur de mail	
}
