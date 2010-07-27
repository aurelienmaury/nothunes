
<%@ page import="fr.xebia.nothunes.domain.Band" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'band.label', default: 'Band')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'band.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'band.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'band.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="webSite" title="${message(code: 'band.webSite.label', default: 'Web Site')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bandInstanceList}" status="i" var="bandInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bandInstance.id}">${fieldValue(bean: bandInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bandInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: bandInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: bandInstance, field: "webSite")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bandInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
