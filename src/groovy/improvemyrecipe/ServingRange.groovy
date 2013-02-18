package improvemyrecipe

class ServingRange {
	int min
	int max
	
	def String toString() {
		if ( max==min )
			return "${min}"
		else
			return "${min}-${max}"
	}
}
