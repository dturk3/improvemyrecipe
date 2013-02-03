package improvemyrecipe

class Ingredient {
    double quantity
	QuantityUnit unit
	String name
	
	def String toString() {
		"${FuzzyQuantityConverter.toFuzzy(quantity)} ${unit} ${name}"
	}
}
