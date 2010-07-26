<g:isLoggedIn>
	<g:ifAnyGranted role="ROLE_USER,ROLE_ADMIN">

		<h1>Member manages ...</h1>
		<ul>
			<li><g:link controller="profile">your profile</g:link></li>
		</ul>
	</g:ifAnyGranted>
</g:isLoggedIn>