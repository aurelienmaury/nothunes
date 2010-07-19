<g:isLoggedIn>
	<g:ifAnyGranted role="ROLE_USER,ROLE_ADMIN">

		<h1>Menu user</h1>
		<ul>
			<li>Element de menu accessible aux utilisateurs et aux admins</li>
		</ul>
	</g:ifAnyGranted>
</g:isLoggedIn>