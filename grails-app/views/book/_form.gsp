<%@ page import="org.opinion.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${bookInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="book.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${org.opinion.Author.list()}" optionKey="id" required="" value="${bookInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'opinions', 'error')} ">
	<label for="opinions">
		<g:message code="book.opinions.label" default="Opinions" />
		
	</label>
	<g:select name="opinions" from="${org.opinion.Opinion.list()}" multiple="multiple" optionKey="id" size="5" value="${bookInstance?.opinions*.id}" class="many-to-many"/>
</div>

