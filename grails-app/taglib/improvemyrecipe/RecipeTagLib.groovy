package improvemyrecipe

class RecipeTagLib {
	def recipeService  // This will be auto-wired
	
	def customTag = { attribs ->
		out << recipeService.getStoredRecipes()
	}
}
