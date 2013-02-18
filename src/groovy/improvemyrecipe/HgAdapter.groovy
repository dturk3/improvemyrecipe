package improvemyrecipe

import grails.*
import groovy.util.logging.Log

import java.beans.IntrospectionException

import org.yaml.snakeyaml.Yaml
import org.yaml.snakeyaml.introspector.Property
import org.yaml.snakeyaml.representer.Representer

import com.aragost.javahg.BaseRepository
import com.aragost.javahg.Changeset
import com.aragost.javahg.Repository
import com.aragost.javahg.RepositoryConfiguration
import com.aragost.javahg.commands.AddCommand
import com.aragost.javahg.commands.CatCommand
import com.aragost.javahg.commands.CommitCommand
import com.aragost.javahg.commands.DiffCommand
import com.aragost.javahg.commands.LogCommand
import com.aragost.javahg.commands.RemoveCommand


@Log
class HgAdapter {
	BaseRepository repo
	String basePath
	
	class NonMetaClassRepresenter extends Representer {
		protected Set<Property> getProperties( Class<? extends Object> type ) throws IntrospectionException {
		  super.getProperties( type ).findAll { it.name != 'metaClass' }
		}
	  }
	
	HgAdapter(String repoRoot, String hgBin)
	{
		basePath = repoRoot
		File f = new File(repoRoot)
		log.info "Using repository rooted at ${f.absolutePath}"
		RepositoryConfiguration config = new RepositoryConfiguration()
		config.setHgBin(hgBin)
		repo = Repository.open(config, f)
	}
	
	def NewRecipeResponse newRecipe( Recipe r ) {
		Yaml y = new Yaml(new NonMetaClassRepresenter())
		UUID uuid = UUID.randomUUID()
		String filename = "${basePath}${File.separator}${uuid}.yaml"
		File file = new File(filename)
		y.dumperOptions.allowReadOnlyProperties=false
		y.dump(r, new FileWriter(file))
		log.info "Storing new recipe to file '${file.absolutePath}'"
		AddCommand add = AddCommand.on(repo)
		add.execute(filename)
		if(!add.isSuccessful())
		{
			throw new HgException("Failed to add new recipe")
		}
		CommitCommand ci = CommitCommand.on(repo)
		ci.message("New recipe '${r.title}' by '${r.author}'")
		ci.user("${r.author}")
		Changeset c = ci.execute()
		if(!ci.isSuccessful())
		{
			throw new HgException("Failed to commit new recipe")
		}
		new NewRecipeResponse().with {
			uid = uuid
			fname = filename
			cset = c
			searchTags = r.tags
			it
		}
	}
	
	def improveRecipe( Recipe r, UUID id ) {
		Yaml y = new Yaml(new NonMetaClassRepresenter())
		String filename = "${basePath}${File.separator}${id}.yaml"
		y.dump(r, new FileWriter(new File(filename)))
		CommitCommand ci = CommitCommand.on(repo)
		ci.message("Improved recipe '${id}' called '${r.title}' by '${r.author}'")
		ci.user("${r.author}")
		Changeset c = ci.execute(filename)
		if(!ci.isSuccessful())
		{
			throw new HgException("Failed to commit recipe improvement")
		}
		new NewRecipeResponse().with {
			uid = id
			fname = filename
			cset = c
			searchTags = r.tags
			it
		}
	}
	
	def removeRecipe( UUID id ) {
		String filename = "${basePath}${File.separator}${id}.yaml"
		RemoveCommand rm = RemoveCommand.on(repo)
		rm.execute(new File(filename))
		if(!rm.isSuccessful())
		{
			throw new HgException("Failed to remove recipe")
		}
	}
	
	def recipeHistory( UUID id ) {
		def history = []
		String filename = "${basePath}${File.separator}${id}.yaml"
		LogCommand log = LogCommand.on(repo)
		List<Changeset> fileHistory = log.execute(filename)
		Yaml y = new Yaml()
		fileHistory.each { Changeset c ->
			CatCommand cat = CatCommand.on(repo)
			cat.rev("${c.revision}")
			history << y.loadAs(cat.execute(filename), Map.class).asType(Recipe.class)
		}
		history
	}
	
	def getRecipe( UUID id, String rev ) {
		String filename = "${basePath}${File.separator}${id}.yaml"
		CatCommand cat = CatCommand.on(repo)
		cat.rev("${rev}")
		Yaml y = new Yaml()
		y.loadAs(cat.execute(filename), Map.class).asType(Recipe.class)
	}
	
	def recipeDiffs( UUID id ) {
		def diffs = []
		String filename = "${basePath}${File.separator}${id}.yaml"
		LogCommand log = LogCommand.on(repo)
		List<Changeset> fileHistory = log.execute(filename)
		fileHistory = fileHistory.reverse()
		fileHistory.eachWithIndex { Changeset c, int idx ->
			DiffCommand diff = DiffCommand.on(repo)
			if(fileHistory[idx+1] != null) {
				diff.rev("${c.revision}","${fileHistory[idx+1].revision}")
				diffs << diff.execute(filename)
			}
		}
		diffs
	}
	
	def generateRecipe() {
		Time prepTime = new Time().with {
				quantity = 2
				time = TimeUnit.min
				it
			}
		Time cookTime = new Time().with {
				quantity = 7
				time = TimeUnit.min
				it
			}
		ServingRange servings = new ServingRange().with {
				min = 1
				max = 2
				it
			}
		Recipe r = new Recipe("Grilled Cheese", "dturko", [], "Basic comfort food", [], [], prepTime, cookTime, servings)
		/*Recipe r = new Recipe().with {
			title = "Grilled Cheese"
			author = "dturko"
			tags = []
			description = "Basic comfort food"
			ingredients = []
			instructions = []
			prep = prepTime
			cook = cookTime
			serves =  servings
			it
		}*/
		r.tags << "cheese"
		r.tags << "grilled"
		r.tags << "sandwich"
		r.tags << "comfort"
		Ingredient butter = new Ingredient().with {
			quantity = 2
			unit = QuantityUnit.tbsp
			name = "butter"
			it
		}
		Ingredient bread = new Ingredient().with {
			quantity = 2
			unit = QuantityUnit.piece
			name = "sliced white bread"
			it
		}
		Ingredient cheese = new Ingredient().with {
			quantity = 2
			unit = QuantityUnit.piece
			name = "processed cheese"
			it
		}
		r.ingredients << butter
		r.ingredients << bread
		r.ingredients << cheese
		InstructionStep step1 = new InstructionStep().with {
			instruction = "Butter both slices of bread"
			it
		}
		InstructionStep step2 = new InstructionStep().with {
			instruction = "Fry in hot pan, buttered side down, 1 minute"
			it
		}
		InstructionStep step3 = new InstructionStep().with {
			instruction = "Place cheese between slices, buttered side in"
			it
		}
		InstructionStep step4 = new InstructionStep().with {
			instruction = "Fry in hot pan, 3 minutes per side"
			it
		}
		r.instructions << step1
		r.instructions << step2
		r.instructions << step3
		r.instructions << step4
		r
	}
}
