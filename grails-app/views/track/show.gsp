
<%@ page import="fr.xebia.nothunes.domain.Track" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="track.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: trackInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="track.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: trackInstance, field: "name")}</td>
                            
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
                        
                    
                        
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${trackInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
