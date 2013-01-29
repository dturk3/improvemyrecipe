<%@ page import="improvemyrecipe.StoredRecipe" %>



<div class="fieldcontain ${hasErrors(bean: storedRecipeInstance, field: 'changeset', 'error')} required">
	<label for="changeset">
		<g:message code="storedRecipe.changeset.label" default="Changeset" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="changeset" name="changeset.id" from="${improvemyrecipe.StoredChangeset.list()}" optionKey="id" required="" value="${storedRecipeInstance?.changeset?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storedRecipeInstance, field: 'dislikes', 'error')} required">
	<label for="dislikes">
		<g:message code="storedRecipe.dislikes.label" default="Dislikes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dislikes" type="number" value="${storedRecipeInstance.dislikes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: storedRecipeInstance, field: 'filename', 'error')} ">
	<label for="filename">
		<g:message code="storedRecipe.filename.label" default="Filename" />
		
	</label>
	<g:textField name="filename" value="${storedRecipeInstance?.filename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storedRecipeInstance, field: 'likes', 'error')} required">
	<label for="likes">
		<g:message code="storedRecipe.likes.label" default="Likes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="likes" type="number" value="${storedRecipeInstance.likes}" required=""/>
</div>

