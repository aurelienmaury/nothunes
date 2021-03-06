
<%@ page import="fr.xebia.nothunes.domain.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
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
                    
                    	<g:if test="${albumInstance.logoPath != 'empty'}">
	                    	<tr class="prop">
	                            <td valign="top"><img class="bandLogo" src="${createLink(controller:'dl', action:'images', params: [id: albumInstance.logoPath])}"/></td>
	                        </tr>
                        </g:if>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: albumInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.band.label" default="Band" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                
                                    <g:link controller="band" action="show" id="${albumInstance.band.id}">${albumInstance.band.name.encodeAsHTML()}</g:link>
                                
                            </td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="album.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: albumInstance, field: "description")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${albumInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
