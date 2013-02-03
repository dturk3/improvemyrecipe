package improvemyrecipe

import grails.*
import groovy.util.logging.Log

import org.ho.yaml.Yaml

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
		Yaml y = new Yaml()
		UUID id = UUID.randomUUID()
		String filename = "${basePath}${File.separator}${id}.yaml"
		File file = new File( filename )
		y.dump( r, file )
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
			uid = id
			fname = filename
			cset = c
			searchTags = r.tags
			it
		}
	}
	
	def improveRecipe( Recipe r, UUID id ) {
		Yaml y = new Yaml()
		String filename = "${basePath}${File.separator}${id}.yaml"
		y.dump( r, new File( filename ) )
		CommitCommand ci = CommitCommand.on(repo)
		ci.message("Improved recipe '${id}' called '${r.title}' by '${r.author}'")
		ci.user("${r.author}")
		Changeset c = ci.execute(filename)
		if(!ci.isSuccessful())
		{
			throw new HgException("Failed to commit recipe improvement")
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
		fileHistory.each { Changeset c ->
			CatCommand cat = CatCommand.on(repo)
			cat.rev("${c.revision}")
			history << Yaml.loadType(cat.execute(filename),Recipe.class)
		}
		history
	}
	
	def getRecipe( UUID id, String rev ) {
		String filename = "${basePath}${File.separator}${id}.yaml"
		CatCommand cat = CatCommand.on(repo)
		cat.rev("${rev}")
		Yaml.loadType(cat.execute(filename),Recipe.class)
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
}
