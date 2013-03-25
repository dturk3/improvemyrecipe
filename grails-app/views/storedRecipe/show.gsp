<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>Improve My Recipe - Recipe name here</title>
<script type="text/javascript" src="../../lib/dojo/dojo/dojo.js" data-dojo-config="'parseOnLoad':true,'async':true,'packages':[{'name':'gridx','location':'../gridx'},{'name':'clipart','location':'../../clipart'},{'name':'maqettaSamples','location':'../../../samples'},{'name':'maqetta','location':'../../maqetta'},{'name':'shapes','location':'../../shapes'},{'name':'zazl','location':'../../zazl'},{'name':'widgets','location':'../../custom'}],'themeMap':[['Android','',['themes/android/android.css']],['BlackBerry','',['themes/blackberry/blackberry.css']],['iPad','',['themes/ipad/ipad.css']],['iPhone','',['themes/iphone/iphone.css']],['.*','',['themes/iphone/iphone.css']]],'mblThemeFiles':[], mblLoadCompatPattern: /\/project1\/themes\/.*\.css$/"></script>
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
<style>@import "../../themes/claro/document.css";@import "../../themes/claro/claro.css";@import "../../app.css";
</style>
<!--<script type="text/javascript" src="app.js"></script>-->
<g:javascript library="jquery" />
<g:setProvider library="jquery"/>
<r:layoutResources/>
<script type="text/javascript" src="../../js/application.js"></script>
</head>
	<%@ page import="improvemyrecipe.StoredRecipe" %>
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
            Recipe Card</h1>
		<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../../images/list.svg" type="image/svg+xml"></object>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Improvements</h1>
	<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../../images/improved.svg" type="image/svg+xml"></object>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Social</h1>
	<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../../images/social.svg" type="image/svg+xml"></object>
        </th>
      </tr>
      <tr>
        <td valign="top">
	<div id="show-storedRecipe" class="content scaffold-show" role="main">
		<% def r = recipeService.getRecipe(storedRecipeInstance) %>
		<g:set var="title" value="${r.title}" />
			<div class="notepad">
				<div class="recipeCard" id="recipeView">
			       	<g:if test="${flash.message}">
						<div class="success" role="status"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../../images/success.svg" type="image/svg+xml"></object>${flash.message}</div>
					</g:if>
					<p>
					${r.toHtml()}
					</p>
				</div>
			</div>
			<g:form>
				<g:hiddenField name="id" value="${storedRecipeInstance?.id}" />
			</g:form>
		</div>
		</td>
        <td valign="top">
			<div id="stylized" class="myform">
    				<div class="insetTypeLikes" style="color: #660000">
						<g:link title="Improve" style="margin-left:25px; float:left; color: #000000" class="insetTypeLikes" controller="storedRecipe" action="edit" id="${storedRecipeInstance?.id}">
							Improve
						</g:link>
					</div>
					<g:if test="${authService.getUserPrincipal()?.login?.equals(r.author)}" >
	    				<div class="insetTypeLikes" style="color: #660000">
							<g:link title="Delete" style="margin-left:25px; float:left; color: #000000" class="insetTypeLikes" controller="storedRecipe" action="delete" id="${storedRecipeInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
								Delete
							</g:link>
						</div>
					</g:if>
       				<br/><br/><br/><br/>
       				<p>Recipe History</p>
       				<g:each in="${recipeService.getHistory(storedRecipeInstance)}">
       						<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
			       			<div id="insetBgd">
								<h1 class="insetType"><a href="#" onclick="replaceView('${it.cset.changesetId}')">${it.recipe.title}</a></h1>
								<h2 class="insetType">${it.cset.creator}</h2>
								<div class="insetTypeDate">${it.cset.created}</div><br/><br/>
							    <h3 class="insetType">${it.recipe.description}</h3>
							    <div id="cset${it.cset.changesetId}" style="display:none">${it.recipe.toHtml()}</div>				
							</div>
						</div>
       				</g:each>
			</div>
        </td>
        <td valign="top">
       		<div id="stylized" class="myform">
    				<div class="insetTypeLikes" style="color: #660000">
						<g:remoteLink title="Dislikes" style="margin-left:35px; float:left; color: #000000" class="insetTypeLikes" controller="storedRecipe" action="dislike" id="${storedRecipeInstance?.id}" update="dislikes${storedRecipeInstance?.id}">
							Dislike
							<div style="font-family: Rockwell; color: #660000" id="dislikes${storedRecipeInstance?.id}">
								${storedRecipeInstance?.dislikes}
							</div>
						</g:remoteLink>
					</div>
					<div class="insetTypeLikes">
						<a title="Views" href="#" style="margin-left:35px; float:left; color: #000000" class="insetTypeLikes">
							Views
							<div style="font-family: Rockwell">
								${storedRecipeInstance?.views}
							</div>
						</a>
						<a title="Comments" href="#" style="margin-left:35px;  float:left; color: #000000" class="insetTypeLikes">
							Comments
							<div style="font-family: Rockwell">
								${storedRecipeInstance?.comments.size()}
							</div>
						</a>
						<g:remoteLink title="Likes" style="margin-left:35px; float:left; color: #000000" controller="storedRecipe" action="like" id="${storedRecipeInstance?.id}" update="likes${storedRecipeInstance?.id}">
							Like
							<div style="font-family: Rockwell; color: #00CC00" id="likes${storedRecipeInstance?.id}">
								${storedRecipeInstance?.likes}
							</div>
						</g:remoteLink>
						
					</div>
       			<g:if test="${authService.isLoggedIn(request)}" >
       				<br/><br/><br/><br/>
	       			<g:form>
	       				<p>Leave a comment!</p>
						<label>
						    Leave a Note
					    	<span class="small">Comments/questions?</span>
					    </label> 
					    <input type="text" name="comment"/><br/>
					    <g:hiddenField name="id" value="${storedRecipeInstance?.id}" />
					    <g:actionSubmit value="Submit"  controller="storedRecipe" action="comment" id="${storedRecipeInstance?.id}"/>
	       			</g:form>
       			</g:if>
       			<g:each in="${storedRecipeInstance?.comments}">
       				<div class="comment"><div style="float:none"><p style="float:left"><strong>${it.user}</strong> said...</p><p style="float:right">${it.timestamp}</p></div><br/><br/><div style="float:none">${it.comment}</div></div>
       			</g:each>
       		</div>
        </td>
      </tr>
    </tbody>
  </table>
</div>
 </body>
</html>
