

<%@ page import="fr.xebia.nothunes.domain.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <g:hasErrors bean="${albumInstance}">
            <div class="errors">
                <g:renderErrors bean="${albumInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${albumInstance?.id}" />
                <g:hiddenField name="version" value="${albumInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="album.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: albumInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${albumInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="band.id"><g:message code="album.band.label" default="Band" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: albumInstance, field: 'description', 'errors')}">
                                    <g:select name="band.id"
								          from="${bandList}"
								          value="${albumInstance.band?.id}"
								          optionValue="name"
								          optionKey="id" 
								          />
                                </td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="album.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: albumInstance, field: 'description', 'errors')}">
                                    
                                    <g:textArea name="description" value="${albumInstance?.description}" rows="5" cols="40"/>
                                </td>
                            </tr>
                            
                            <g:if test="${albumInstance.logoPath != 'empty'}">
	                        	<tr class="prop">
	                        		<td valign="top" class="name">
	                                    <label for="logoPath"><g:message code="album.logo.label" default="Logo" /></label>
	                                </td>
	                            	<td valign="top" class="value">
	                            		<img class="albumLogo" src="${createLink(controller:'dl', action:'images', params: [id: albumInstance.logoPath])}"/>
	                            	</td>
	                        	</tr>
                        	</g:if>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logoPath"><g:message code="album.logoPath.label" default="Logo Path" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: albumInstance, field: 'logoPath', 'errors')}">
                                    <input type="file" name="logoFile" onchange="${'logoChanged'}.value=true"/>
                                </td>
                                
                                <!-- Storing old value to check if it has changed when updating -->
                                <g:hiddenField name="logoChanged" value="" />
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
