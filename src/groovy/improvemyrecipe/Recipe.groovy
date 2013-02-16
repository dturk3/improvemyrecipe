package improvemyrecipe


class Recipe {
	String title
	String author
	Date created
	List<String> tags
	String description
	List<Ingredient> ingredients
	List<InstructionStep> instructions
	Time prep
	Time cook
	ServingRange serves
	
	Recipe() {
		created = new Date()
	}
	
	Recipe(String ttl, String auth, List<String> tgs, String desc, List<Ingredient> ing, List<InstructionStep> inst, Time prp, Time ck, ServingRange srv ) {
		title=ttl
		author=auth
		tags=tgs
		description=desc
		ingredients=ing
		instructions=inst
		prep=prp
		cook=ck
		serves=srv
		created = new Date()
	}
	
	def String toString() {
		String ing = ""
		String inst = ""
		ingredients.each{ ing+="  ${it.toString()}\n" }
		instructions.each{ inst+="  ${instructions.indexOf(it)+1}. ${it.instruction}\n" }
"""
${title} - ${author}
${description}
TAGS: ${tags}

${ing}
${inst}

Prep time: ${prep}
Cook time: ${cook}
"""
	}
}
