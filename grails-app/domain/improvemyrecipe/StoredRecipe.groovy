package improvemyrecipe

class StoredRecipe {

    static constraints = {
    }
	
	String uid
	StoredChangeset changeset
	List<StoredChangeset> history
	List<String> tags
	int likes
	int dislikes
	int improvements
	//byte[] photo
	
	static hasMany = [history: StoredChangeset, tags: String]
}
