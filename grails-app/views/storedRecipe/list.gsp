
<%@ page import="improvemyrecipe.StoredRecipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storedRecipe.label', default: 'StoredRecipe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-storedRecipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-storedRecipe" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="storedRecipe.changeset.label" default="Changeset" /></th>
					
						<g:sortableColumn property="dislikes" title="${message(code: 'storedRecipe.dislikes.label', default: 'Dislikes')}" />
					
						<g:sortableColumn property="likes" title="${message(code: 'storedRecipe.likes.label', default: 'Likes')}" />
					
						<g:sortableColumn property="uid" title="${message(code: 'storedRecipe.uid.label', default: 'Uid')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${storedRecipeInstanceList}" status="i" var="storedRecipeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${storedRecipeInstance.id}">${fieldValue(bean: storedRecipeInstance, field: "changeset")}</g:link></td>
					
						<td>${fieldValue(bean: storedRecipeInstance, field: "dislikes")}</td>
					
						<td>${fieldValue(bean: storedRecipeInstance, field: "likes")}</td>
					
						<td>${fieldValue(bean: storedRecipeInstance, field: "uid")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${storedRecipeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
