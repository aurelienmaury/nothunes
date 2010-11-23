
<%@ page import="fr.xebia.nothunes.domain.Track" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
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

        <g:sortableColumn property="id" title="${message(code: 'track.id.label', default: 'Id')}" />

        <g:sortableColumn property="name" title="${message(code: 'track.name.label', default: 'Name')}" />

        <g:sortableColumn property="bandName" title="${message(code: 'track.band.label', default: 'Band')}" />

        <g:sortableColumn property="albumName" title="${message(code: 'track.album.label', default: 'Album')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${trackInstanceList}" status="i" var="trackInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

            <td><g:link action="show" id="${trackInstance.id}">${fieldValue(bean: trackInstance, field: "id")}</g:link></td>

          <td>${fieldValue(bean: trackInstance, field: "name")}</td>

          <td>${trackInstance.album.band.name}</td>

          <td>${trackInstance.album.name}</td>

          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${trackInstanceTotal}" />
    </div>
  </div>
</body>
</html>
