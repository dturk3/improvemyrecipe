package improvemyrecipe

class RecipeTagLib {
	def recipeService  // This will be auto-wired
	
	def customTag = { attribs ->
		recipeService.getStoredRecipes().each { Recipe r ->
			out <<
"""
	<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
		<div id="insetBgd">
			<h1 class="insetType">${r.title}</h1>
			<h2 class="insetType">${r.author}</h2>
			<div class="insetTypeDate">${r.created}</div><br/><br/>
		    <h3 class="insetType">${r.description}</h3>
			<div class="insetTypeLikes" style="color: #660000">D<div class="insetTypeLikes" style="font-family: Rockwell; color: #660000">0</div></div><div class="insetTypeLikes">C<div class="insetTypeLikes" style="font-family: Rockwell">0</div></div>
		</div>
	</div>
"""
		}
	}
}
