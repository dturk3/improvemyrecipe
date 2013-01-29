<%@ page import="improvemyrecipe.StoredChangeset" %>



<div class="fieldcontain ${hasErrors(bean: storedChangesetInstance, field: 'changesetId', 'error')} ">
	<label for="changesetId">
		<g:message code="storedChangeset.changesetId.label" default="Changeset Id" />
		
	</label>
	<g:textField name="changesetId" value="${storedChangesetInstance?.changesetId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storedChangesetInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="storedChangeset.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${storedChangesetInstance?.created}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: storedChangesetInstance, field: 'creator', 'error')} ">
	<label for="creator">
		<g:message code="storedChangeset.creator.label" default="Creator" />
		
	</label>
	<g:textField name="creator" value="${storedChangesetInstance?.creator}"/>
</div>

