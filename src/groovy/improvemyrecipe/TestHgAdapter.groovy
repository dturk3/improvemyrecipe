package improvemyrecipe


def generateRecipe() {
	Time prepTime = new Time().with {
			quantity = 2
			time = TimeUnit.min
			it
		}
	Time cookTime = new Time().with {
			quantity = 7
			time = TimeUnit.min
			it
		}
	ServingRange servings = new ServingRange().with {
			min = 1
			max = 2
			it
		}
	Recipe r = new Recipe().with {
		title = "Grilled Cheese"
		author = "dturko"
		tags = []
		description = "Basic comfort food"
		ingredients = []
		instructions = []
		prep = prepTime
		cook = cookTime
		serves =  servings
		it
	}
	r.tags << "cheese"
	r.tags << "grilled"
	r.tags << "sandwich"
	r.tags << "comfort"
	Ingredient butter = new Ingredient().with {
		quantity = 2
		unit = QuantityUnit.tbsp
		name = "butter"
		it
	}
	Ingredient bread = new Ingredient().with {
		quantity = 2
		unit = QuantityUnit.piece
		name = "sliced white bread"
		it
	}
	Ingredient cheese = new Ingredient().with {
		quantity = 2
		unit = QuantityUnit.piece
		name = "processed cheese"
		it
	}
	r.ingredients << butter
	r.ingredients << bread
	r.ingredients << cheese
	InstructionStep step1 = new InstructionStep().with {
		instruction = "Butter both slices of bread"
		it
	}
	InstructionStep step2 = new InstructionStep().with {
		instruction = "Fry in hot pan, buttered side down, 1 minute"
		it
	}
	InstructionStep step3 = new InstructionStep().with {
		instruction = "Place cheese between slices, buttered side in"
		it
	}
	InstructionStep step4 = new InstructionStep().with {
		instruction = "Fry in hot pan, 3 minutes per side"
		it
	}
	r.instructions << step1
	r.instructions << step2
	r.instructions << step3
	r.instructions << step4
	r
}

HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR,Configuration.HG_BIN_PATH)
def timeStart = new Date().getTime()
Recipe r = generateRecipe()
def id
try
{
	id = hga.newRecipe( r )
}
finally
{
	def timeEnd = new Date().getTime()
	println "Elapsed " + (timeEnd - timeStart) + " ms"
	r.description = "Modified the description to test"
	hga.improveRecipe(r, id)
	def history = hga.recipeHistory(id)
	history.each {
		println it
	}
	def diffs = hga.recipeDiffs(id)
	diffs.each {
		println it
	}
}
