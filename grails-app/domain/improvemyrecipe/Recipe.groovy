package improvemyrecipe

class Recipe {

    static constraints = {
        title(blank: false)
        author(blank: false)
		ingredients(blank: false)
		instructions(blank: false)
    }
	
	String title
	String author
	List<String> tags
	String description
	List<Ingredient> ingredients
	List<InstructionStep> instructions
	Time prep
	Time cook
	ServingRange serves
}
