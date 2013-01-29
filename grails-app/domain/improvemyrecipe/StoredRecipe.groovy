package improvemyrecipe

class StoredRecipe {

    static constraints = {
    }
	
	String filename //UUID
	StoredChangeset changeset
	List<StoredChangeset> history
	List<String> tags
	int likes
	int dislikes
}
