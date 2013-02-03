package improvemyrecipe


class FuzzyQuantityConverter {
	static def toFuzzy( double num ) {
		int whole = num/1*1
		def asStr = Double.valueOf(num).toString()
		if (asStr.contains(".25"))
		{
			return "${whole} 1/4"
		}
		if (asStr.contains(".5"))
		{
			return "${whole} 1/2"
		}
		if (asStr.contains(".75"))
		{
			return "${whole} 3/4"
		}
		if (asStr.contains(".3"))
		{
			return "${whole} 1/3"
		}
		if (asStr.contains(".6"))
		{
			return "${whole} 2/3"
		}
		return "${whole}"
	}
}
