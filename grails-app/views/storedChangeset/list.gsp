
<%@ page import="improvemyrecipe.StoredChangeset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storedChangeset.label', default: 'StoredChangeset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-storedChangeset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-storedChangeset" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="changesetId" title="${message(code: 'storedChangeset.changesetId.label', default: 'Changeset Id')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'storedChangeset.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="creator" title="${message(code: 'storedChangeset.creator.label', default: 'Creator')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storedChangesetInstanceList}" status="i" var="storedChangesetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${storedChangesetInstance.id}">${fieldValue(bean: storedChangesetInstance, field: "changesetId")}</g:link></td>
					
						<td><g:formatDate date="${storedChangesetInstance.created}" /></td>
					
						<td>${fieldValue(bean: storedChangesetInstance, field: "creator")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storedChangesetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
