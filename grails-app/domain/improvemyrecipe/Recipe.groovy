package improvemyrecipe

class Recipe {

    static constraints = {
        title(blank: false)
        author(blank: false)
    }
	
	String title
	String author
	String tags
	String description
	String ingredients
	String instructions
	String prep
	String cook
}
