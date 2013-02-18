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
	List<Comment> comments
	int views
	//byte[] photo
	
	static hasMany = [history: StoredChangeset, tags: String, comments: Comment]
}
