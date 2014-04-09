<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src='/LunchVote/js/bootstrap.min.js'></script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner" class="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a>
            <sec:ifNotLoggedIn>
                <div class="logout"><g:link controller="login" action="auth">Login</g:link></div>
            </sec:ifNotLoggedIn>
            <sec:ifLoggedIn>
                <div class="logout">
                    Howdy <sec:username /> <g:link controller="logout">Sign Out</g:link>
                    <a href="#" class="changePassword">Change Password</a>
                </div>
            </sec:ifLoggedIn>

        </div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
        <div id="changePassword" class="modal hide fade" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3>Change Password</h3>
            </div>
            <div class="modal-body">
                <g:form name="changePassword" action="changePassword" class="form-horizontal">
                    <div id="password" class="control-group">
                        Password
                        <g:passwordField name="password" value="" />
                    </div>
                    <div id="password" class="control-group">
                        Confirm
                        <g:passwordField name="confirmPassword" value="" />
                    </div>
                    <div>
                        <input type="submit" value="Submit">
                    </div>
                </g:form>
            </div>
        </div>
        <script type="text/javascript">
            $(function(){
                $(".changePassword").click(function() {
                    $("#changePassword").modal();
                })
            });
        </script>
	</body>
</html>
