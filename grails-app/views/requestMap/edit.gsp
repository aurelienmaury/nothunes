<head>
	<meta name="layout" content="main" />
	<title>Edit RequestMap</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
		<span class="menuButton"><g:link class="list" action="list">RequestMap List</g:link></span>
		<span class="menuButton"><g:link class="create" action="create">New RequestMap</g:link></span>
	</div>

	<div class="body">
		<h1>Edit RequestMap</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${requestmap}">
		<div class="errors">
		<g:renderErrors bean="${requestmap}" as="list" />
		</div>
		</g:hasErrors>

		<div class="prop">
			<span class="name">ID:</span>
			<span class="value">${requestmap.id}</span>
		</div>

		<g:form>
			<input type="hidden" name="id" value="${requestmap.id}" />
			<input type="hidden" name="version" value="${requestmap.version}" />
			<div class="dialog">
				<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><label for="url">URL Pattern:</label></td>
						<td valign="top" class="value ${hasErrors(bean:requestmap,field:'url','errors')}">
							<input type="text" id="url" name="url" value="${requestmap.url?.encodeAsHTML()}"/>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><label for="configAttribute">Roles (comma-delimited):</label></td>
						<td valign="top" class="value ${hasErrors(bean:requestmap,field:'configAttribute','errors')}">
							<input type="text" name='configAttribute'  value="${requestmap.configAttribute}"/>
						</td>
					</tr>

				</tbody>
				</table>
			</div>

			<div class="buttons">
				<span class="button"><g:actionSubmit class="save" value="Update" /></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
			</div>

		</g:form>

	</div>
</body>
