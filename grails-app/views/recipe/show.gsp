
<%@ page import="improvemyrecipe.Recipe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recipe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recipe" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recipe">
			
				<g:if test="${recipeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="recipe.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${recipeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="recipe.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${recipeInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.cook}">
				<li class="fieldcontain">
					<span id="cook-label" class="property-label"><g:message code="recipe.cook.label" default="Cook" /></span>
					
						<span class="property-value" aria-labelledby="cook-label"><g:fieldValue bean="${recipeInstance}" field="cook"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="recipe.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${recipeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.ingredients}">
				<li class="fieldcontain">
					<span id="ingredients-label" class="property-label"><g:message code="recipe.ingredients.label" default="Ingredients" /></span>
					
						<span class="property-value" aria-labelledby="ingredients-label"><g:fieldValue bean="${recipeInstance}" field="ingredients"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.instructions}">
				<li class="fieldcontain">
					<span id="instructions-label" class="property-label"><g:message code="recipe.instructions.label" default="Instructions" /></span>
					
						<span class="property-value" aria-labelledby="instructions-label"><g:fieldValue bean="${recipeInstance}" field="instructions"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.prep}">
				<li class="fieldcontain">
					<span id="prep-label" class="property-label"><g:message code="recipe.prep.label" default="Prep" /></span>
					
						<span class="property-value" aria-labelledby="prep-label"><g:fieldValue bean="${recipeInstance}" field="prep"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recipeInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="recipe.tags.label" default="Tags" /></span>
					
						<span class="property-value" aria-labelledby="tags-label"><g:fieldValue bean="${recipeInstance}" field="tags"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recipeInstance?.id}" />
					<g:link class="edit" action="edit" id="${recipeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
