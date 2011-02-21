<head>
<meta name='layout' content='main' />
<title>Login</title>

</head>

<body>
  
<div id="boxEntete">
    <div class="halfLeft textRight">
      <img src="${resource(dir:'images',file:'personal.png')}" border="0" />
    </div>
  <div class="halfRight">
    <form action='${postUrl}' method='POST' id='loginForm' class='cssform'>
      <h2>Please log in</h2>
    <table>
          <tbody>

            <tr class='prop'>
              <td valign='top' class='name'><label for='j_username'>Login ID</label></td>
              <td valign='top' class='value'><input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' /></td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='j_password'>Password</label></td>
              <td valign='top' class='value'><input type='password' class='text_' name='j_password' id='j_password' /></td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='remember_me'>Remember me</label></td>
              <td valign='top' class='value'><input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
					<g:if test='${hasCookie}'>checked='checked'</g:if> /></td>
            </tr>

          </tbody>
        </table>

          <input type='submit' value='Login' />
          </form>
  </div>
</div>

<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
