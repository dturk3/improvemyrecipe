<%@ page import="improvemyrecipe.Recipe" %>



<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="recipe.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${recipeInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="recipe.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="author" required="" value="${recipeInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'cook', 'error')} ">
	<label for="cook">
		<g:message code="recipe.cook.label" default="Cook" />
		
	</label>
	<g:textField name="cook" value="${recipeInstance?.cook}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="recipe.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${recipeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="recipe.ingredients.label" default="Ingredients" />
		
	</label>
	<g:textField name="ingredients" value="${recipeInstance?.ingredients}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'instructions', 'error')} ">
	<label for="instructions">
		<g:message code="recipe.instructions.label" default="Instructions" />
		
	</label>
	<g:textField name="instructions" value="${recipeInstance?.instructions}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'prep', 'error')} ">
	<label for="prep">
		<g:message code="recipe.prep.label" default="Prep" />
		
	</label>
	<g:textField name="prep" value="${recipeInstance?.prep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="recipe.tags.label" default="Tags" />
		
	</label>
	<g:textField name="tags" value="${recipeInstance?.tags}"/>
</div>

