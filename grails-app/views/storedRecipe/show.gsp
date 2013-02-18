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
<style>
			p, form, button{border:0; margin:0; padding:0;}
			.spacer{clear:both; height:1px;}
			/* ----------- My Form ----------- */
			.myform{
			margin:0 auto;
			width:94%;
			height:450px;
			padding:14px;
			overflow-y: scroll;
			overflow-x: hidden;
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
<g:link class="titlestyle" style="text-decoration: none;" controller="StoredRecipe" action="list">
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
</div>
 <div data-dojo-type="dijit.layout.ContentPane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" region="center" splitter="false" maxSize="Infinity" doLayout="false">
  <table border="0" style="border-collapse: collapse; table-layout: fixed; width: 100%; height: 494px;">
<colgroup>
      <col></col>
      <col></col>
      <col></col>
    </colgroup>
  	<div class="tagCloud">
   		<richui:tagCloud class="tag" values="${recipeService.getTagCloud()}" />
	</div>
    <tbody>
      <tr>
        <th class="notepad-heading">
          <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Recipe Card</h1>
          <h1 style="font-family: webdings; font-size: 2.2em; top: -10px;">
            ä</h1>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Improvements</h1>
    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
      `</h1>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Social</h1>
    <h1 style="font-family: webdings; font-size: 2.2em; float: none;">
      ^</h1>
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
						<div class="success" role="status">${flash.message}</div>
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
						<g:link title="Improve" style="margin-left:25px; float:left" class="insetTypeLikes" controller="storedRecipe" action="edit" id="${storedRecipeInstance?.id}">
							!
						</g:link>
					</div>
					<g:if test="${authService.getUserPrincipal()?.login?.equals(r.author)}" >
	    				<div class="insetTypeLikes" style="color: #660000">
							<g:link title="Delete" style="margin-left:25px; float:left" class="insetTypeLikes" controller="storedRecipe" action="delete" id="${storedRecipeInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
								û
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
						<g:remoteLink title="Dislikes" style="margin-left:35px; float:left" class="insetTypeLikes" controller="storedRecipe" action="dislike" id="${storedRecipeInstance?.id}" update="dislikes${storedRecipeInstance?.id}">
							D
							<div style="font-family: Rockwell; color: #660000" id="dislikes${storedRecipeInstance?.id}">
								${storedRecipeInstance?.dislikes}
							</div>
						</g:remoteLink>
					</div>
					<div class="insetTypeLikes">
						<a title="Views" href="#" style="margin-left:35px; float:left" class="insetTypeLikes">
							&
							<div style="font-family: Rockwell">
								${storedRecipeInstance?.views}
							</div>
						</a>
						<a title="Comments" href="#" style="margin-left:35px;  float:left" class="insetTypeLikes">
							~
							<div style="font-family: Rockwell">
								${storedRecipeInstance?.comments.size()}
							</div>
						</a>
						<g:remoteLink title="Likes" style="margin-left:35px; float:left" controller="storedRecipe" action="like" id="${storedRecipeInstance?.id}" update="likes${storedRecipeInstance?.id}">
							C
							<div style="font-family: Rockwell" id="likes${storedRecipeInstance?.id}">
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
