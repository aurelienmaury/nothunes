<g:isLoggedIn>
	<g:ifAllGranted role="ROLE_ADMIN">

		<h1>Manage ...</h1>
		<ul>
			<li><g:link controller="role">... roles</g:link></li>
			<li><g:link controller="user">... users</g:link></li>
			<li><g:link controller="requestMap">... requestMaps</g:link></li>
		</ul>
	</g:ifAllGranted>
</g:isLoggedIn>