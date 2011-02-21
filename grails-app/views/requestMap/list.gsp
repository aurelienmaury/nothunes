<head>
	<meta name="layout" content="main" />
	<title>RequestMap List</title>
</head>

<body>

	<div class="nav">
		<span class="menuButton"><g:link class="create" action="create">New RequestMap</g:link></span>
	</div>

	
		<h1>RequestMap List</h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" title="ID" />
					<g:sortableColumn property="url" title="URL Pattern" />
					<g:sortableColumn property="configAttribute" title="Roles" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${requestmapList}" status="i" var="requestmap">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${requestmap.id}</td>
					<td>${requestmap.url?.encodeAsHTML()}</td>
					<td>${requestmap.configAttribute}</td>
					<td class="actionButtons">
						<span class="actionButton">
						<g:link action="show" id="${requestmap.id}">Show</g:link>
						</span>
					</td>
				</tr>
				</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${fr.xebia.nothunes.security.RequestMap.count()}" />
		</div>

</body>
