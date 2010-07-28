
<%@ page import="fr.xebia.nothunes.domain.Album" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="name" title="${message(code: 'album.name.label', default: 'Name')}" />
                        
                        
                            <g:sortableColumn property="description" title="${message(code: 'album.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="bandName" title="${message(code: 'album.band.label', default: 'Band')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${albumInstanceList}" status="i" var="albumInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${albumInstance.id}">${fieldValue(bean: albumInstance, field: "name")}</g:link></td>                       
                        
                            <td>${fieldValue(bean: albumInstance, field: "description")}</td>
                            
                            <td><g:link controller="band" action="show" id="${albumInstance.band.id}">${albumInstance.band.name.encodeAsHTML()}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${albumInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
