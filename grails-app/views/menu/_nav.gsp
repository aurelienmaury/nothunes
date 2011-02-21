<div id="menu">
  <span class="item"><g:link controller="navigation">Browse Music</g:link></span>

  <g:isLoggedIn>
    <span class="item">Welcome, <g:loggedInUsername/></span>
    <span class="item"><g:link controller="logout">Logout</g:link></span>
  </g:isLoggedIn>

  <g:isNotLoggedIn>
    <span class="item"><g:link controller="login">Login</g:link></span>
    <span class="item">No account ? : <g:link controller="register">Register</g:link></span>
  </g:isNotLoggedIn>
  <!--
	<div class="homePagePanel">
		<div class="panelTop"></div>

		<div class="panelBody">

			<g:render template="/menu/all" />

			<g:render template="/menu/admin" /> 

			<g:render template="/menu/user" />

		</div>

		<div class="panelBtm"></div>
	</div>
	-->
</div>


<g:isLoggedIn>
<div id="menuBar">
			<g:render template="/menu/admin" />
			<g:render template="/menu/user" />
</div>
</g:isLoggedIn>