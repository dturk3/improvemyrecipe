package improvemyrecipe





class RecipeService {
	static transactional = false
	
	def authenticationService
	
    def List<Recipe> getStoredRecipes() {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		List<StoredRecipe> result = StoredRecipe.executeQuery('from StoredRecipe r order by r.changeset.created desc')
		def recs = []
		result.each{
			StoredRecipe r ->
			Recipe rec = hga.getRecipe(UUID.fromString(r.uid), r.changeset.changesetId)
			recs << rec
		}
		recs
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
		sr.save()
		sr
	}
}
