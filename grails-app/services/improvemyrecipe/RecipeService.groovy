package improvemyrecipe

import org.ho.yaml.Yaml

import com.aragost.javahg.BaseRepository



class RecipeService {
	static transactional = false
	
    def List<Recipe> getStoredRecipes() {
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.changeset.created desc')
		result.each{
			StoredRecipe r ->
			
		}
    }
	
	def storeRecipe( Recipe r ) {
		UUID genId = UUID.randomUUID()
		String file = "${genId}.yaml"
		Yaml.dump( r, new File(file) )
		
		BaseRepository.open(new File(Configuration.HG_REPO_DIR))
		
		StoredRecipe.with {
			filename : file
			
		}
		//def p = new Person(name: "Fred", age: 40, lastVisit: new Date())
		//p.save()
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.changeset.created desc')

	}
}
