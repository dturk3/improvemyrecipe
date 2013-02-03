package improvemyrecipe


class Recipe {
	String title
	String author
	List<String> tags
	String description
	List<Ingredient> ingredients
	List<InstructionStep> instructions
	Time prep
	Time cook
	ServingRange serves
	
	Recipe() {}
	
	Recipe(String ttl, String auth, List tgs, String desc, List ing, List inst, Time prp, Time ck, ServingRange srv ) {
		title=ttl
		author=auth
		tags=tgs
		description=desc
		ingredients=ing
		instructions=inst
		prep=prp
		cook=ck
		serves=srv
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
"""
	}
}
