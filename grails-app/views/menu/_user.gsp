<g:isLoggedIn>
	<g:ifAnyGranted role="ROLE_USER,ROLE_ADMIN">

		<h1>Manage your ...</h1>
		<ul>
			<li><g:link controller="profile">Profile</g:link></li>
			<li><g:link controller="band">Bands</g:link></li>
			<li><g:link controller="album">Albums</g:link></li>
			<li><g:link controller="track">Tracks</g:link></li>
		</ul>
	</g:ifAnyGranted>
</g:isLoggedIn>