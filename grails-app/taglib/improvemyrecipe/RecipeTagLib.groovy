package improvemyrecipe

class RecipeTagLib {
	def recipeService  // This will be auto-wired
	
	
	def recentRecipes = { attribs ->
		recipeService.getStoredRecipes().each { RecipePair p ->
			out << formatFeedPanel(p)
		}
	}
	
	def trendingRecipes = { attribs ->
		recipeService.getTrendingRecipes().each { RecipePair p ->
			out <<formatFeedPanel(p)
		}
	}
	
	def improvedRecipes = { attribs ->
		recipeService.getImprovedRecipes().each { RecipePair p ->
			out << formatFeedPanel(p)
		}
	}
	
	def String formatFeedPanel(RecipePair p) {
		"""
	<div data-dojo-type="dijit.layout.ContentPane" title="Pane" extractContent="false" preventCache="false" preload="false" refreshOnShow="false" style="height: auto; width: 96%;" doLayout="false" class="recipeBox">
		<div id="insetBgd">
			<h1 class="insetType"><a href="storedRecipe/show/${p.storedRecipe.id}">${p.recipe.title}</a></h1>
			<h2 class="insetType">${p.recipe.author}</h2>
			<div class="insetTypeDate">${p.recipe.created}</div><br/><br/>
		    <h3 class="insetType">${p.recipe.description}</h3>
			<div class="insetTypeLikes" style="color: #660000">D<div class="insetTypeLikes" style="font-family: Rockwell; color: #660000">${p.storedRecipe.dislikes}</div></div><div class="insetTypeLikes"><a href="storedRecipe/like/${p.storedRecipe.id}" style="text-decoration: none">C</a><div class="insetTypeLikes" style="font-family: Rockwell" name="likes${p.storedRecipe.id}">${p.storedRecipe.likes}</div></div>
		</div>
	</div>
		"""
	}
}
