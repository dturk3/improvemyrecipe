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

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'cook', 'error')} required">
	<label for="cook">
		<g:message code="recipe.cook.label" default="Cook" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cook" name="cook.id" from="${improvemyrecipe.Time.list()}" optionKey="id" required="" value="${recipeInstance?.cook?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="recipe.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${recipeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'prep', 'error')} required">
	<label for="prep">
		<g:message code="recipe.prep.label" default="Prep" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prep" name="prep.id" from="${improvemyrecipe.Time.list()}" optionKey="id" required="" value="${recipeInstance?.prep?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'serves', 'error')} required">
	<label for="serves">
		<g:message code="recipe.serves.label" default="Serves" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="serves" name="serves.id" from="${improvemyrecipe.ServingRange.list()}" optionKey="id" required="" value="${recipeInstance?.serves?.id}" class="many-to-one"/>
</div>

