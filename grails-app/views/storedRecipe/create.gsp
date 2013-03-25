<!DOCTYPE html>
<%@page import="improvemyrecipe.TimeUnit"%>
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
			
		</style>
<!--<script type="text/javascript" src="app.js"></script>-->
<g:javascript library="jquery" />
<g:setProvider library="jquery"/>
<r:layoutResources/>
<script type="text/javascript" src="../js/application.js"></script>
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
		<h1>Submit a Recipe</h1>
		<p>Follow the intuitive on-screen prompts to quickly submit your favourite recipes to us. We do not own your recipes, and we are not liable for anything that pertains to them after they are submitted. We simply want to help share them with other foodies.</p>
	</div>
    <tbody>
      <tr>
        <th class="notepad-heading">
          <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Basic Information</h1>
    	<object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/info.svg" type="image/svg+xml"></object>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Ingredient List</h1>
    <object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/list.svg" type="image/svg+xml"></object>
        </th>
        <th class="notepad-heading">
    <h1 style="font-family: Lucida Sans Unicode; font-size: 1.2em;">
            Cooking Instructions</h1>
    <object style="float: left; padding: 5px; margin-top: -25px; height: 32px; width: 32px; margin-left: 10px;" data="../images/instructions.svg" type="image/svg+xml"></object>
        </th>
      </tr>
      <tr>
        <td valign="top">
		<div id="stylized" class="myform">
			<p>General recipe parameters</p>
			<g:form controller="storedRecipe" action="upload"  method="post" enctype="multipart/form-data">
				<label>
				    Title
		    		<span class="small">Ex: "Grilled Cheese in Butter"</span>
			    </label> 
			     <g:textField name="title"/><br/>
   				<label>
				    Tags
		    		<span class="small">Ex: "cheese, sandwich, butter, snack"</span>
			    </label> 
			    <g:textField name="tags"/><br/>
   				<label>
				    Description
		    		<span class="small">Ex: "Simple and favourite comfort food." (max. 80 characters)</span>
			    </label> 
			    <g:textField style="height:40px" name="description"/><br/>
	   			<label>
				    Preparation Time
		    		<span class="small">Ex: 1 min</span>
			    </label> 
			    <g:textField style="width:20px" name="prepTime"/>
			    <g:select id="prepTimeUnit" name="prepTimeUnit" from="${TimeUnit.values() as List}" /><br/>
			    <label>
				    Cooking Time
		    		<span class="small">Ex: 5 min</span>
			    </label> 
   			    <g:textField style="width:20px" name="cookTime"/>
			    <g:select id="cookTimeUnit" name="cookTimeUnit" from="${TimeUnit.values() as List}" /><br/>
   			    <label>
				    Servings
		    		<span class="small">Ex: "2" or "3-4"</span>
			    </label> 
   			    <g:textField style="width:40px" name="servings"/><br/>
		    <label>
				    Upload Image
		    		<span class="small">Optional max. 500 KB</span>
		    </label> 
			<g:hiddenField name="ings" id="ings"/>
			<g:hiddenField name="insts" id= "insts"/>
			<input type="file" name="file" />
			<!--<fileuploader:form	upload="images" 
				successAction="show"
				successController="storedRecipe"
				errorAction="create"
				errorController="storedRecipe"/>-->
			<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
		</td>
        <td valign="top">
		<div id="stylized" class="myform">
			<p>Required ingredients with quantities</p>
			<label>
			    Add an ingredient
	    		<span class="small">Ex: "3 tbsp butter" or "3 slice cheddar"</span>
		    </label> 
		    <input type="text" name="ing" id="ing" onKeyUp="validateIng(this,event);"/><br/>
		    <div class="info"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../images/tip.svg" type="image/svg+xml"></object><div id="ingTip" >Start by typing ingredients quantity...</div></div>
		    <div name="ingList" id="ingList"></div>
		</div>
        </td>
        <td valign="top">
     	<div id="stylized" class="myform">
		 	<p>Instructions to follow</p>
		 	<label>
			    Add an instruction
	    		<span class="small">Ex: "Simmer on low heat for 5 minutes."</span>
		    </label> 
		    <input type="text" name="inst" id="inst" onKeyUp="validateInst(this,event);"/><br/>
   		    <div class="info"><object style="float: left; margin-top: -5px; margin-left: -40px; height: 32px; width: 32px;" data="../images/tip.svg" type="image/svg+xml"></object><div id="instTip" >Type a cooking instruction and hit ENTER to add it to the list.</div></div>
		    <ol name="instList" id="instList"></ol>
		</div>
        </td>
      </tr>
    </tbody>
  </table>
</div>
 </body>
</html>
