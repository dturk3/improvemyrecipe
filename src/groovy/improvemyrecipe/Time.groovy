package improvemyrecipe

class Time {
	double quantity
	TimeUnit time
	
	def String toString() {
		"${quantity} ${time}"
	}
}
