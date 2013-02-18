package improvemyrecipe





class RecipeService {
	static transactional = false
	
	def authenticationService
	
	def List<RecipePair> collectRecipes(List<StoredRecipe> result, HgAdapter hga) {
		def recs = []
		result.each{
			StoredRecipe r ->
			Recipe rec = hga.getRecipe(UUID.fromString(r.uid), r.changeset.changesetId)
			RecipePair pair = new RecipePair().with {
				recipe = rec
				storedRecipe = r
				it
			}
			recs << pair
		}
		recs
	}
	
	def Recipe getRecipe( StoredRecipe r ) {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		Recipe recipe = hga.getRecipe(UUID.fromString(r.uid), "${r.changeset.changesetId}")
		recipe
	}
	
    def List<RecipePair> getStoredRecipes() {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.changeset.created desc limit 10')
		collectRecipes(result, hga)
    }
	
	def List<RecipePair> getTrendingRecipes() {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by (r.likes - r.dislikes) desc limit 10')
		collectRecipes(result, hga)
	}
	
	def List<RecipePair> getImprovedRecipes() {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.improvements desc, r.changeset.created desc limit 10')
		collectRecipes(result, hga)
	}
	
	def Map<String,Float> getTagCloud() {
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.changeset.created desc limit 1000')
		def tagMap = [:]
		result.each { StoredRecipe r ->
			if( r.tags != null ) {
				r.tags.each { String t ->
					int totalTags = tagMap.keySet().isEmpty() ? 1 : tagMap.keySet().size()
					if(tagMap.get(t)!=null)
						tagMap.put(t, ++tagMap.get(t)/totalTags)
					else
						tagMap.put(t, 1/totalTags)
				}
			}
		}
		tagMap
	}
	
	def getHistory( StoredRecipe r )
	{
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		List<Recipe> history = hga.recipeHistory(UUID.fromString(r.uid))
		List<RecipePair> plist = []
		int csetIndex = r.history.size()-1
		history.each {
			HistoricRecipePair p = new HistoricRecipePair()
			p.cset = r.history[csetIndex]
			p.recipe = it
			plist << p
			csetIndex--
		}
		plist
	}
	
	def storeRecipe( Recipe r ) {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		NewRecipeResponse rsp = hga.newRecipe(r)
		StoredRecipe sr = new StoredRecipe().create()
		sr.setUid(rsp.uid.toString())
		StoredChangeset sc = new StoredChangeset().create()
		sc.setChangesetId("${rsp.cset.revision}")
		sc.setCreated(rsp.cset.timestamp.date)
		sc.setCreator(rsp.cset.user)
		sc.save()
		sr.setChangeset(sc)
		sr.setHistory([sc])
		sr.setTags(rsp.searchTags)
		sr.setLikes(0)
		sr.setDislikes(0)
		sr.setImprovements(0)
		sr.setComments([])
		sr.save()
		sr
	}
	
	def improveRecipe( Recipe r, UUID rId, Long dbId ) {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		NewRecipeResponse rsp = hga.improveRecipe(r, rId)
		StoredRecipe sr = new StoredRecipe().get(dbId)
		StoredChangeset sc = new StoredChangeset().create()
		sc.setChangesetId("${rsp.cset.revision}")
		sc.setCreated(rsp.cset.timestamp.date)
		sc.setCreator(rsp.cset.user)
		sc.save()
		sr.setChangeset(sc)
		sr.history.add(sc)
		sr.setTags(rsp.searchTags)
		sr.setImprovements(sr.getImprovements()+1)
		sr.save()
		sr
	}
}
