<g:isLoggedIn>
	<g:ifAllGranted role="ROLE_ADMIN">

		<h1>Administrate ...</h1>
		<ul>
			<li><g:link controller="role">Roles</g:link></li>
			<li><g:link controller="user">Users</g:link></li>
			<li><g:link controller="requestMap">Security filters</g:link></li>
		</ul>
	</g:ifAllGranted>
</g:isLoggedIn>