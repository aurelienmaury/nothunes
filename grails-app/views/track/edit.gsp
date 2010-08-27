

<%@ page import="fr.xebia.nothunes.domain.Track" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        
        <g:javascript>
	function updateAlbums(e) {
		// The response comes back as a bunch-o-JSON
		var albums = eval("(" + e.responseText + ")")	// evaluate JSON

		if (albums) {
			var rselect = document.getElementById('albums')

			// Clear all previous options
			var l = rselect.length

			while (l > 0) {
				l--
				rselect.remove(l)
			}

			var opt = document.createElement('option');
			opt.text = '---Choose an album---'
			opt.value = ''
			try {
		    	rselect.add(opt, null) // standards compliant; doesn't work in IE
		  	}
			catch(ex) {
		   		rselect.add(opt) // IE only
			}
		  		

			// Rebuild the select
			for (var i=0; i < albums.length; i++) {
				var anAlbum = albums[i]
				var opt = document.createElement('option');
				opt.text = anAlbum.name
				opt.value = anAlbum.id
			  	try {
			    	rselect.add(opt, null) // standards compliant; doesn't work in IE
			  	}
		  		catch(ex) {
		    		rselect.add(opt) // IE only
		  		}
			}
		}
	}

	

	</g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${trackInstance}">
            <div class="errors">
                <g:renderErrors bean="${trackInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${trackInstance?.id}" />
                <g:hiddenField name="version" value="${trackInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="track.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trackInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${trackInstance?.name}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="band.id"><g:message code="track.album.band.label" default="Band" /></label>
                                </td>
                                <td valign="top" class="value">
                                    <g:select name="band"
								          from="${bandList}"
								          value="${band?.id}"
								          noSelection="['':'---Choose a band---']"
								          optionValue="name"
								          optionKey="id" 
								          onchange="${remoteFunction(
												            controller:'band', 
												            action:'ajaxGetAlbums', 
												            params:'\'id=\' + escape(this.value)', 
												            onComplete:'updateSelectAlbumWithJSON(e,\'albums\')')}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="band.id"><g:message code="track.album.label" default="Album" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: trackInstance, field: 'album', 'errors')}">
                                    <g:select name="album.id" 
                                    		id="albums" 
                                    		from="${albums}"
                                    		value="${trackInstance.album.id}" 
                                    		optionValue="name"
								          	optionKey="id" 
								          	noSelection="['':'---Choose an album---']"/>
								          
                                </td>
                            </tr>
                        
                        <g:if test="${trackInstance.audioPath != 'empty'}">
	                        	<tr class="prop">
	                        		<td valign="top" class="name">
	                                    <label for="audioPath"><g:message code="track.audioFile.label" default="Audio" /></label>
	                                </td>
	                            	<td valign="top" class="value">
	                            		<a href="${createLink(controller:'dl', action:'audio', params: [id: trackInstance.audioPath])}">${trackInstance.audioPath}</a>
	                            	</td>
	                        	</tr>
                        	</g:if>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="audioFile"><g:message code="track.audioFile.label" default="Audio Path" /></label>
                                </td>
                                
                                 <td valign="top" class="value ${hasErrors(bean: trackInstance, field: 'audioFile', 'errors')}">
                                    <input type="file" name="audioFile" onchange="${'audioChanged'}.value=true"/>
                                </td>
                                
                                <!-- Storing old value to check if it has changed when updating -->
                                <g:hiddenField name="audioChanged" value="" />
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
