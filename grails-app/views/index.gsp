<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>Improve My Recipe</title>
<script type="text/javascript" src="lib/dojo/dojo/dojo.js" data-dojo-config="'parseOnLoad':true,'async':true,'packages':[{'name':'gridx','location':'../gridx'},{'name':'clipart','location':'../../clipart'},{'name':'maqettaSamples','location':'../../../samples'},{'name':'maqetta','location':'../../maqetta'},{'name':'shapes','location':'../../shapes'},{'name':'zazl','location':'../../zazl'},{'name':'widgets','location':'../../custom'}],'themeMap':[['Android','',['themes/android/android.css']],['BlackBerry','',['themes/blackberry/blackberry.css']],['iPad','',['themes/ipad/ipad.css']],['iPhone','',['themes/iphone/iphone.css']],['.*','',['themes/iphone/iphone.css']]],'mblThemeFiles':[], mblLoadCompatPattern: /\/project1\/themes\/.*\.css$/"></script>
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
<style>@import "themes/claro/document.css";@import "themes/claro/claro.css";@import "app.css";
</style>
<!--<script type="text/javascript" src="app.js"></script>-->
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
            Recent Recipes</h1>
          <h1 style="font-family: webdings; font-size: 2.2em; top: -10px;">
            ä</h1>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Trending Recipes</h1>
    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
      %</h1>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Recently Improved</h1>
    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
      `</h1>
        </th>
      </tr>
      <tr>
        <td valign="top">
        	<g:each in="${recipeService.getStoredRecipes()}">
	        	<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
	       			<div id="insetBgd">
	       				<!-- TODO: if no image, do not display! -->
	       				<img src="${createLink(controller:'fileUploader', action:'show', id:it.storedRecipe.imageId )}" style="float:left;margin-right:10px;border:1px gray solid;" width="70" height="70" />
						<h1 class="insetType"><a href="storedRecipe/show/${it.storedRecipe.id}">${it.recipe.title}</a></h1>
						<h2 class="insetType">${it.recipe.author}</h2>
						<div class="insetTypeDate">${it.recipe.created}</div><br/><br/>
					    <h3 class="insetType">${it.recipe.description}</h3>
						<div class="insetTypeLikes" style="color: #660000">
							<g:remoteLink style="float:left" class="insetTypeLikes" controller="storedRecipe" action="dislike" id="${it.storedRecipe.id}" update="dislikes${it.storedRecipe.id}">
								D
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell; color: #660000" id="dislikes${it.storedRecipe.id}">
								${it.storedRecipe.dislikes}
							</div>
						</div>
						<div class="insetTypeLikes">
							<g:remoteLink style="float:left" controller="storedRecipe" action="like" id="${it.storedRecipe.id}" update="likes${it.storedRecipe.id}">
								C
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell" id="likes${it.storedRecipe.id}">
								${it.storedRecipe.likes}
							</div>
						</div>
					</div>
				</div>
        	</g:each>

		</td>
        <td valign="top">
     		<g:each in="${recipeService.getTrendingRecipes()}">
	        	<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
	       			<div id="insetBgd">
   				       	<!-- TODO: if no image, do not display! -->
	       				<img src="${createLink(controller:'fileUploader', action:'show', id:it.storedRecipe.imageId )}" style="float:left;margin-right:10px;border:1px gray solid;" width="70" height="70" />
						<h1 class="insetType"><a href="storedRecipe/show/${it.storedRecipe.id}">${it.recipe.title}</a></h1>
						<h2 class="insetType">${it.recipe.author}</h2>
						<div class="insetTypeDate">${it.recipe.created}</div><br/><br/>
					    <h3 class="insetType">${it.recipe.description}</h3>
						<div class="insetTypeLikes" style="color: #660000">
							<g:remoteLink style="float:left" controller="storedRecipe" action="dislike" id="${it.storedRecipe.id}" update="dislikes${it.storedRecipe.id}">
								D
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell; color: #660000" id="dislikes${it.storedRecipe.id}">
								${it.storedRecipe.dislikes}
							</div>
						</div>
						<div class="insetTypeLikes">
							<g:remoteLink style="float:left" controller="storedRecipe" action="like" id="${it.storedRecipe.id}" update="likes${it.storedRecipe.id}">
								C
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell" id="likes${it.storedRecipe.id}">
								${it.storedRecipe.likes}
							</div>
						</div>					
					</div>
				</div>
        	</g:each>
        </td>
        <td valign="top">
       		<g:each in="${recipeService.getImprovedRecipes()}">
	        	<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
	       			<div id="insetBgd">
	       				<!-- TODO: if no image, do not display! -->
	       				<img src="${createLink(controller:'fileUploader', action:'show', id:it.storedRecipe.imageId )}" style="float:left;margin-right:10px;border:1px gray solid;" width="70" height="70" />
						<h1 class="insetType"><a href="storedRecipe/show/${it.storedRecipe.id}">${it.recipe.title}</a></h1>
						<h2 class="insetType">${it.recipe.author}</h2>
						<div class="insetTypeDate">${it.recipe.created}</div><br/><br/>
					    <h3 class="insetType">${it.recipe.description}</h3>
						<div class="insetTypeLikes" style="color: #660000">
							<g:remoteLink style="float:left" controller="storedRecipe" action="dislike" id="${it.storedRecipe.id}" update="dislikes${it.storedRecipe.id}">
								D
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell; color: #660000" id="dislikes${it.storedRecipe.id}">
								${it.storedRecipe.dislikes}
							</div>
						</div>
						<div class="insetTypeLikes">
							<g:remoteLink style="float:left" controller="storedRecipe" action="like" id="${it.storedRecipe.id}" update="likes${it.storedRecipe.id}">
								C
							</g:remoteLink>
							<div class="insetTypeLikes" style="font-family: Rockwell" id="likes${it.storedRecipe.id}">
								${it.storedRecipe.likes}
							</div>
						</div>				
					</div>
				</div>
        	</g:each>
        </td>
      </tr>
    </tbody>
  </table>
</div>
 </body>
</html>
