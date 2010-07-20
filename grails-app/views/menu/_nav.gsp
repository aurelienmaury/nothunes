<div id="nav">
	<ul>
		<g:isLoggedIn>
			<li>Welcome, <g:loggedInUsername/></li>
			<li><g:link controller="logout">Logout</g:link></li>
		</g:isLoggedIn>
		
		<g:isNotLoggedIn>
			<li><g:link controller="login">Login</g:link></li>
	        <li>No account ? : <g:link controller="register">Register</g:link></li>
		</g:isNotLoggedIn>
	</ul>
	
	<div class="homePagePanel">
		<div class="panelTop"></div>
		
		<div class="panelBody">

			<g:render template="/menu/all" />
			
			<g:render template="/menu/admin" /> 
			
			<g:render template="/menu/user" />
			
		</div>
		
		<div class="panelBtm"></div>
	</div>
	
</div>