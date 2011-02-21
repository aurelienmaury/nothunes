

<%@ page import="fr.xebia.nothunes.domain.Band" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'band.label', default: 'Band')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bandInstance}">
            <div class="errors">
                <g:renderErrors bean="${bandInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${bandInstance?.id}" />           
                <g:hiddenField name="version" value="${bandInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="band.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bandInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bandInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="band.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bandInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${bandInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="webSite"><g:message code="band.webSite.label" default="Web Site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bandInstance, field: 'webSite', 'errors')}">
                                    <g:textField name="webSite" value="${bandInstance?.webSite}" />
                                </td>
                            </tr>
                        
                        	<g:if test="${bandInstance.logoPath != 'empty'}">
	                        	<tr class="prop">
	                        		<td valign="top" class="name">
	                                    <label for="logoPath"><g:message code="band.logo.label" default="Logo" /></label>
	                                </td>
	                            	<td valign="top" class="value">
	                            		<img class="bandLogo" src="${createLink(controller:'dl', action:'images', params: [id: bandInstance.logoPath])}"/>
	                            	</td>
	                        	</tr>
                        	</g:if>
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="logoPath"><g:message code="band.logoPath.label" default="Logo Path" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bandInstance, field: 'logoPath', 'errors')}">
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
    </body>
</html>
