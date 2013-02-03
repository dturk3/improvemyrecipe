package improvemyrecipe

import com.aragost.javahg.Changeset

class NewRecipeResponse {
	UUID uid
	String fname
	Changeset cset
	List<String> searchTags = []
}
