package improvemyrecipe

class StoredChangeset {

    static constraints = {
    }
	
	String changesetId
	Date created
	List<Date> modified
	String creator
	List<String> modifiers
}
