<g:isLoggedIn>
	<g:ifAllGranted role="ROLE_ADMIN">

		<h1>Administrate</h1>
		
			<span class="item"><g:link controller="role">Roles</g:link></span>
			<span class="item"><g:link controller="user">Users</g:link></span>
			<span class="item"><g:link controller="requestMap">Security filters</g:link></span>
		
	</g:ifAllGranted>
</g:isLoggedIn>