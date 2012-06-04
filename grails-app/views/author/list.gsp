<%@ page import="org.opinion.Author" %>
<%@ page import="grails.plugins.springsecurity.SpringSecurityService" %>
<% def springSecurityService %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
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

<div id="list-author" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="firstName"
                              title="${message(code: 'author.firstName.label', default: 'First Name')}"/>

            <g:sortableColumn property="lastName"
                              title="${message(code: 'author.lastName.label', default: 'Last Name')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'author.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'author.lastUpdated.label', default: 'Last Updated')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${authorInstanceList}" status="i" var="authorInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${authorInstance.id}">${fieldValue(bean: authorInstance, field: "firstName")}</g:link></td>

                <td>${fieldValue(bean: authorInstance, field: "lastName")}</td>

                <td><g:formatDate date="${authorInstance.dateCreated}"/></td>

                <td><g:formatDate date="${authorInstance.lastUpdated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${authorInstanceTotal}"/>
    </div>
</div>
</body>
</html>
