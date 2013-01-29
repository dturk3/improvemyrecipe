
<%@ page import="improvemyrecipe.StoredChangeset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'storedChangeset.label', default: 'StoredChangeset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-storedChangeset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-storedChangeset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list storedChangeset">
			
				<g:if test="${storedChangesetInstance?.changesetId}">
				<li class="fieldcontain">
					<span id="changesetId-label" class="property-label"><g:message code="storedChangeset.changesetId.label" default="Changeset Id" /></span>
					
						<span class="property-value" aria-labelledby="changesetId-label"><g:fieldValue bean="${storedChangesetInstance}" field="changesetId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${storedChangesetInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="storedChangeset.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${storedChangesetInstance?.created}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${storedChangesetInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="storedChangeset.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:fieldValue bean="${storedChangesetInstance}" field="creator"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${storedChangesetInstance?.id}" />
					<g:link class="edit" action="edit" id="${storedChangesetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
