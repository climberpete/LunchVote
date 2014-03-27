<%@ page import="com.lunchvote.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="vote.name.label" default="Name"/>

    </label>
    <g:textField name="name" value="${voteInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'selection', 'error')} required">
    <label for="selection">
        <g:message code="vote.selection.label" default="Selection"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="selection" type="number" value="${voteInstance.selection}" required=""/>
</div>

