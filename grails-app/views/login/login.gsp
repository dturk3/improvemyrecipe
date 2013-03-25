<html>
	<head>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>Improve My Recipe</title>
		<script type="text/javascript" src="../lib/dojo/dojo/dojo.js" data-dojo-config="'parseOnLoad':true,'async':true,'packages':[{'name':'gridx','location':'../gridx'},{'name':'clipart','location':'../../clipart'},{'name':'maqettaSamples','location':'../../../samples'},{'name':'maqetta','location':'../../maqetta'},{'name':'shapes','location':'../../shapes'},{'name':'zazl','location':'../../zazl'},{'name':'widgets','location':'../../custom'}],'themeMap':[['Android','',['themes/android/android.css']],['BlackBerry','',['themes/blackberry/blackberry.css']],['iPad','',['themes/ipad/ipad.css']],['iPhone','',['themes/iphone/iphone.css']],['.*','',['themes/iphone/iphone.css']]],'mblThemeFiles':[], mblLoadCompatPattern: /\/project1\/themes\/.*\.css$/"></script>
		<script type="text/javascript">
		require([
		  "dijit/dijit",
		  "dojo/parser",
		  "maqetta/space",
		  "maqetta/AppStates",
		  "dijit/TitlePane",
		  "dijit/layout/BorderContainer",
		  "dijit/layout/ContentPane",
		  "dijit/MenuBar",
		  "dijit/PopupMenuBarItem",
		  "dijit/MenuItem",
		  "dijit/Menu",
		  "dijit/layout/AccordionContainer",
		  "clipart/Browser"
		]);
		</script>
		<style>@import "../themes/claro/document.css";@import "../themes/claro/claro.css";@import "../app.css";
		</style>
		<g:javascript library="jquery" />
		<g:setProvider library="jquery"/>
		<r:layoutResources/>
	</head>
	    <%@ page import="improvemyrecipe.RecipeService" %>
	    <%@ page import="com.grailsrocks.authentication.AuthenticationService" %>
	    <%
	    	def recipeService = grailsApplication.classLoader.loadClass('improvemyrecipe.RecipeService').newInstance()
	    	def authService = grailsApplication.classLoader.loadClass('com.grailsrocks.authentication.AuthenticationService').newInstance()
		%>
	<body class="claro" data-maq-flow-layout="true" data-maq-comptype="desktop" data-maq-ws="collapse" data-maq-appstates="{}" id="myapp">
 <div data-dojo-type="dijit.layout.ContentPane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" region="top" splitter="true" maxSize="Infinity" doLayout="false" style="border: 1px solid gray; height: 44px; background-color: #88b897;">
<h4 style="float: left; height: 30%; right: 10px; top: -35px; left: 5px;" class="titlestyle">,</h4>
<h3 style="float: left; height: 30%; left: 10px;" data-title="improvemyrecipe" class="titlestyle">
<a href="/improvemyrecipe">
improvemyrecipe.com</a>
</h3>
<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
<a href="#" class="titlestyle" style="text-decoration: none;">
About</a>
</div>
<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
<g:link class="titlestyle" style="text-decoration: none;" url="/improvemyrecipe">
Browse</g:link>
</div>
<g:if test="${!authService.isLoggedIn(request)}" >
	<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
		<g:link class="titlestyle" controller="login" action="index">
			Log In
		</g:link>
	</div>
</g:if>
<g:if test="${authService.isLoggedIn(request)}" >
	<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
		<g:link class="titlestyle" controller="StoredRecipe" action="create">
			Add Recipe
		</g:link>
	</div>
	<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
		<g:link class="titlestyle" controller="authentication" action="logout">
			Log Out
		</g:link>
	</div>
</g:if>
<div style="float: right; height: 30%; margin-right: 30px;" class="titlestyle">
<g:form controller="storedRecipe" action="search">
	<input id="liveSearch" name="liveSearch" height="20px" style="color: black; margin-top: -10px; width: 150px; background-color: rgb(136, 184, 151);"/>
</g:form>
</div>
</div>
 <div data-dojo-type="dijit.layout.ContentPane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" region="center" splitter="false" maxSize="Infinity" doLayout="false">
  <table border="0" style="border-collapse: collapse; table-layout: fixed; width: 100%; height: 494px;">
<colgroup>
      <col></col>
      <col></col>
      <col></col>
    </colgroup>
  	<div style="float:left" class="tagCloud">
  		<div class="tagCloudTitle">POPULAR NOW</div>
   		<richui:tagCloud class="tag" values="${recipeService.getTagCloud()}" />
	</div>
	<div style="float:right" class="announcementBox">
		<div class="tagCloudTitle">ANNOUNCEMENTS</div>
		<h1>improvemyrecipe.com</h1>
		<p>Welcome to the launch of improvemyrecipe.com! We are still working on certain aspects of our site, please be patient over the coming weeks as we finalize our layout and features. In the meantime, feel free to register, contribute your recipes and browse.</p>
	</div>
			    <tbody>
			      <tr>
			        <th class="notepad-heading">
			          <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Log In</h1>
			          <object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/login.svg" type="image/svg+xml"></object>
			        </th>
			        <th class="notepad-heading">
			    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Sign Up</h1>
    			<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/sup.svg" type="image/svg+xml"></object>
			        </th>
			        <th class="notepad-heading">
			    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Why Join?</h1>
    			<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/whyjoin.svg" type="image/svg+xml"></object>
			        </th>
			      </tr>
			      <tr>
			        <td valign="top">
						<auth:ifLoggedIn>
						<div id="stylized" class="myform">
							<div class="success"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../images/success.svg" type="image/svg+xml"></object>You are currently logged in as: <auth:user/></div>
							<auth:form authAction="logout" success="[controller:'login', action:'index']" error="[controller:'login', action:'index']">
							    <g:actionSubmit value="Log out"/> 
							</auth:form>
							</div>
						</auth:ifLoggedIn>
						<auth:ifUnconfirmed>
							You've registered but we're still waiting to confirm your account. <g:link action="reconfirm">Click here to send a new confirmation request</g:link> if you missed it the first time.
						</auth:ifUnconfirmed>
						<auth:ifNotLoggedIn>
						<div id="stylized" class="myform">
							<p>You are currently browsing as a guest. Please log in or sign up:</p>
							<g:if test="${flash.authenticationFailure}">
								<div class="error"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../images/error.svg" type="image/svg+xml"></object>Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/></div>
							</g:if>
							<auth:form authAction="login" success="[controller:'login', action:'index']" error="[controller:'login', action:'index']">
   								<label>
								    Login
							    	<span class="small">Your alphanumeric username</span>
							    </label> 
							     <g:textField name="login"/><br/>
									<label>
									    Password
									    <span class="small">Case-sensitive alphanumeric password</span>
								    </label><input type="password" name="password"/><br/>
							    <input type="submit" value="Log in"/>
							</auth:form>
							</div>
						</auth:ifNotLoggedIn>
					</td>
			        <td valign="top">
 						<auth:ifNotLoggedIn>
 							<div id="stylized" class="myform">
 								<p>Register for FREE to become a member of our community!</p>
								<g:if test="${flash.authenticationFailure}">
									<div class="error"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../images/error.svg" type="image/svg+xml"></object>Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/></div>
								</g:if>
								<auth:form name="signupForm" authAction="signup" success="[controller:'login', action:'index']" error="[controller:'login', action:'index']">
    								<label>
									    Login
   									    <span class="small">Your alphanumeric username</span>
								    </label> 
								    <g:textField name="login"/><br/>
   									<label>
									    Email
									    <span class="small">A valid email address</span>
								    </label> 
								    <g:textField name="email"/><br/>
   									<label>
								    	Password
										<span class="small">Case-sensitive alphanumeric password</span>
   									</label>
								    <input type="password" name="password"/><br/>
   								    <label>
								    	Confirm Password
										<span class="small">Type password again</span>
								    </label>
									<input type="password" name="passwordConfirm"/><br/>
								    <input type="submit" value="Sign up"/>
								</auth:form>
							</div>
 						</auth:ifNotLoggedIn>
			        </td>
			        <td valign="top">
    					<div id="stylized" class="myform">
    						<span class="med"><!--<g:dailyFacts/>--></span>
			       		</div>
			        </td>
			      </tr>
			    </tbody>
			  </table>
			</div>
	</body>
</html>