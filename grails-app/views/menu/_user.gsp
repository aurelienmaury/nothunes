<g:isLoggedIn>
	<g:ifAnyGranted role="ROLE_USER,ROLE_ADMIN">

		<h1>Manage</h1>
		
			<span class="item"><g:link controller="profile">Profile</g:link></span>
			<span class="item"><g:link controller="band">Bands</g:link></span>
			<span class="item"><g:link controller="album">Albums</g:link></span>
			<span class="item"><g:link controller="track">Tracks</g:link></span>
		
	</g:ifAnyGranted>
</g:isLoggedIn>