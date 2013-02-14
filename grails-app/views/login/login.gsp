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
		<style>
			p, form, button{border:0; margin:0; padding:0;}
			.spacer{clear:both; height:1px;}
			/* ----------- My Form ----------- */
			.myform{
			margin:0 auto;
			width:94%;
			height:450px;
			padding:14px;
			}
			
			/* ----------- stylized ----------- */
			#stylized{
			border:solid 2px #b7ddf2;
			background:#ebf4fb;
			}
			#stylized h1 {
			font-size:14px;
			font-weight:bold;
			margin-bottom:8px;
			}
			#stylized p{
			font-size:11px;
			color:#666666;
			margin-bottom:20px;
			border-bottom:solid 1px #b7ddf2;
			padding-bottom:10px;
			}
			#stylized label{
			margin-left: 20px;
			float: left;
			display:block;
			text-align:right;
			width:140px;
			}
			#stylized .small{
			color:#666666;
			display:block;
			font-size:11px;
			font-weight:normal;
			text-align:right;
			width:140px;
			}
			#stylized .med{
			color:#000000;
			display:block;
			font-size:13px;
			font-weight:normal;
			text-align:left;
			width:95%;
			}
			#stylized input{
			font-size:12px;
			padding:4px 2px;
			border:solid 1px #aacfe4;
			width:280px;
			margin:2px 0 20px 10px;
			}
			#stylized button{
			clear:both;
			margin-left:150px;
			width:125px;
			height:31px;
			background:#666666 url(img/button.png) no-repeat;
			text-align:center;
			line-height:31px;
			color:#FFFFFF;
			font-size:11px;
			font-weight:bold;
			}
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
			<div data-dojo-type="dijit.layout.ContentPane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" region="top" splitter="true" maxSize="Infinity" doLayout="false" style="border: 1px solid gray; border-radius: 3px; -moz-border-radius: 3px; height: 44px; background-color: #88b897;">
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
			<a href="#" class="titlestyle" style="text-decoration: none;">
			Browse</a>
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
			</div>
			 <div data-dojo-type="dijit.layout.ContentPane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" region="center" splitter="false" maxSize="Infinity" doLayout="false">
			  <table border="0" style="border-collapse: collapse; table-layout: fixed; width: 100%; height: 494px;">
			<colgroup>
			      <col></col>
			      <col></col>
			      <col></col>
			    </colgroup>
			    <richui:tagCloud class="tag" values="${recipeService.getTagCloud()}" />
			    <tbody>
			      <tr>
			        <th class="notepad-heading">
			          <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Log In</h1>
			          <h1 style="font-family: webdings; font-size: 2.2em; top: -10px;">
			            Ñ</h1>
			        </th>
			        <th class="notepad-heading">
			    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Sign Up</h1>
			    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
			      †</h1>
			        </th>
			        <th class="notepad-heading">
			    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
			            Why Join?</h1>
			    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
			      i</h1>
			        </th>
			      </tr>
			      <tr>
			        <td valign="top">
						<auth:ifLoggedIn>
						<div id="stylized" class="myform">
							<div class="success"><div style="font-family: webdings; font-size: 2.2em; margin-left:-35px; margin-top:-5px; float:left">a</div>You are currently logged in as: <auth:user/></div>
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
								<div class="error">Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/></div>
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
									<div class="error"><div style="font-family: webdings; font-size: 2.2em; margin-left:-35px; margin-top:-5px; float:left">x</div>Sorry but your login/signup failed - reason: <g:message code="authentication.failure.${flash.authenticationFailure.result}"/></div>
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