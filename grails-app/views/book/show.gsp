<%@ page import="org.opinion.Book" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>

        <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth">Login</g:link>
        </sec:ifNotLoggedIn>

        <sec:ifAllGranted roles="ROLE_USER">
            <li><g:link controller="logout">Logout</g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
            <li><g:link controller="logout">Logout</g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="show-book" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list book">

        <g:if test="${bookInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="book.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${bookInstance}"
                                                                                         field="title"/></span>
            </li>
        </g:if>

        <g:if test="${bookInstance?.author}">
            <li class="fieldcontain">
                <span id="author-label" class="property-label"><g:message code="book.author.label"
                                                                          default="Author"/></span>

                <span class="property-value" aria-labelledby="author-label"><g:link controller="author" action="show"
                                                                                    id="${bookInstance?.author?.id}">${bookInstance?.author?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${bookInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="book.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${bookInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${bookInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="book.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${bookInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="average-label" class="property-label"><g:message code="book.average.label"
                                                                       default="Average"/></span>

            <span class="property-value" aria-labelledby="average-label">${bookInstance?.average}</span>

        </li>


        <g:if test="${bookInstance?.opinions}">
            <li class="fieldcontain">
                <span id="opinions-label" class="property-label"><g:message code="book.opinions.label"
                                                                            default="Opinions"/></span>

                <g:each in="${bookInstance.opinions}" var="o">
                    <span class="property-value" aria-labelledby="opinions-label"><g:link controller="opinion"
                                                                                          action="show"
                                                                                          id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${bookInstance?.id}"/>

            <sec:ifAllGranted roles="ROLE_USER">
                <g:link class="edit" action="edit" id="${bookInstance?.id}"><g:message code="default.button.edit.label"
                                                                                       default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </sec:ifAllGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
