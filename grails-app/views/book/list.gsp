<%@ page import="org.opinion.Book" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

        <sec:ifNotLoggedIn>
            <g:link controller="login" action="auth">Login</g:link>
        </sec:ifNotLoggedIn>

        <sec:ifAllGranted roles="ROLE_USER">
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
            <li><g:link controller="logout">Logout</g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="list-book" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}"/>

            <th><g:message code="book.author.label" default="Author"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'book.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'book.lastUpdated.label', default: 'Last Updated')}"/>

            <g:sortableColumn property="average"
                              title="${message(code: 'book.average.label', default: 'Average')}"/>


        </tr>
        </thead>
        <tbody>
        <g:each in="${bookInstanceList}" status="i" var="bookInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: bookInstance, field: "author")}</td>

                <td><g:formatDate date="${bookInstance.dateCreated}"/></td>

                <td><g:formatDate date="${bookInstance.lastUpdated}"/></td>

                <td>${bookInstance.average}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${bookInstanceTotal}"/>
    </div>
</div>
</body>
</html>
