

<%@ page import="fr.xebia.nothunes.domain.Track"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'track.label', default: 'Track')}" />
<title><g:message code="default.create.label"
	args="[entityName]" /></title>

</head>
<body>
<div class="nav"><span class="menuButton"><g:link
	class="list" action="list">
	<g:message code="default.list.label" args="[entityName]" />
</g:link></span></div>
<div class="body">
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if> <g:hasErrors bean="${trackInstance}">
	<div class="errors"><g:renderErrors bean="${trackInstance}"
		as="list" /></div>
</g:hasErrors> <g:form action="save" method="post" enctype="multipart/form-data">
	<div class="dialog">
	<table>
		<tbody>

			<tr class="prop">
				<td valign="top" class="name"><label for="name"><g:message
					code="track.name.label" default="Name" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: trackInstance, field: 'name', 'errors')}">
				<g:textField name="name" value="${trackInstance?.name}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="band.id"><g:message
					code="track.album.band.label" default="Band" /></label></td>
				<td valign="top" class="value"><g:select name="band"
					from="${bandList}" value="${band?.id}"
					noSelection="['':'---Choose a band---']" optionValue="name"
					optionKey="id"
					onchange="${remoteFunction(
												            controller:'band', 
												            action:'ajaxGetAlbums', 
												            params:'\'id=\' + escape(this.value)', 
												            onComplete:'updateSelectAlbumWithJSON(e,\'albums\')')}" />
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><label for="band.id"><g:message
					code="track.album.label" default="Album" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: trackInstance, field: 'album', 'errors')}">
				<g:select name="album.id" id="albums" /></td>
			</tr>


			<tr class="prop">
				<td valign="top" class="name"><label for="songPath"><g:message
					code="track.songPath.label" default="Audio Path" /></label></td>
				<td valign="top"
					class="value ${hasErrors(bean: bandInstance, field: 'audioPath', 'errors')}">
				<input type="file" name="audioFile" /></td>
			</tr>



		</tbody>
	</table>
	</div>
	<div class="buttons"><span class="button"><g:submitButton
		name="create" class="save"
		value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	</div>
</g:form></div>
</body>


</html>
