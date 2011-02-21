<head>
  <meta name="layout" content="main" />
  <title>User Registration</title>
</head>

<body>

  <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>

  <div id="boxEntete">
    <div class="halfLeft textRight">
      <img src="${resource(dir:'images',file:'identity.png')}" border="0" />
    </div>
    <div class="halfRight">
      <h2>User registration</h2>

      

      <g:form action="save">
      
        <table>
          <tbody>

            <tr class='prop'>
              <td valign='top' class='name'><label for='username'>Login Name:</label></td>
              <td valign='top' class='value ${hasErrors(bean:person,field:'username','errors')}'>
                <input type="text" name='username' value="${person?.username?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='userRealName'>Full Name:</label></td>
              <td valign='top' class='value ${hasErrors(bean:person,field:'userRealName','errors')}'>
                <input type="text" name='userRealName' value="${person?.userRealName?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='passwd'>Password:</label></td>
              <td valign='top' class='value ${hasErrors(bean:person,field:'passwd','errors')}'>
                <input type="password" name='passwd' value="${person?.passwd?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='enabled'>Confirm Password:</label></td>
              <td valign='top' class='value ${hasErrors(bean:person,field:'confirmPasswd','errors')}'>
                <input type="password" name='confirmPasswd' value="${person?.passwd?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class='prop'>
              <td valign='top' class='name'><label for='email'>Email:</label></td>
              <td valign='top' class='value ${hasErrors(bean:person,field:'email','errors')}'>
                <input type="text" name='email' value="${person?.email?.encodeAsHTML()}"/>
              </td>
            </tr>

            <tr class='prop'>
              <td valign='bottom' class='name'><label for='code'>Enter Code: </label></td>
              <td valign='top' class='name'>
                <input type="text" name="captcha" size="8"/>
                <img src="${createLink(controller:'captcha', action:'index')}" align="absmiddle"/>
              </td>
            </tr>

          </tbody>
        </table>
      
          <input class='save' type="submit" value="Create"/>
      

    </g:form>
    </div>
  </div>


</body>
