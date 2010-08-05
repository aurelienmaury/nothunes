<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        
        <g:javascript library="application" />
        
        <g:javascript library="prototype" />
        
        <g:layoutHead />
    </head>
    <body>
    <div class="wrapper">
    	<div id="pageHeader">
    	
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="${createLinkTo(dir:'')}"><img src="${resource(dir:'images',file:'nothunes_logo.png')}" alt="Grails" border="0" /></a></div>
        </div>
        
        <g:render template="/menu/nav"/>
        
        <div id="pageContent">
        <g:layoutBody />
        </div>
        </div>
        <div id="pageFooter">
        <g:meta name="app.poweredBy"/> - <g:meta name="app.license"/> - v<g:meta name="app.version"/>
        </div>
    </body>
</html>
