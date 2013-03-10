package improvemyrecipe

import org.springframework.dao.DataIntegrityViolationException

class StoredRecipeController {

    static allowedMethods = [update: "POST", delete: "POST"]
	
	def recipeService
	def authenticationService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [storedRecipeInstanceList: StoredRecipe.list(params), storedRecipeInstanceTotal: StoredRecipe.count()]
    }
	
	def comment(Long id, String comment) {
		if( comment == null || comment.equals("") ) {
		}
		else {
			def instance = StoredRecipe.get(id)
					Comment c = Comment.create()
					c.timestamp = new Date()
			c.user = authenticationService.getUserPrincipal().login
			c.comment = comment
			c.save()
			instance.comments = instance.comments.reverse()
			instance.comments.add(c)
			instance.comments = instance.comments.reverse()
			instance.save()
		}
		redirect(action: "show", id: id)
	}
	
	def like(Long id) {
		def instance = StoredRecipe.get(id)
		instance.setLikes(instance.getLikes()+1)
		instance.save()
		render instance.getLikes()
	}
	
	def dislike(Long id) {
		def instance = StoredRecipe.get(id)
		instance.setDislikes(instance.getDislikes()+1)
		instance.save()
		render instance.getDislikes()
	}

    def create() {
        [storedRecipeInstance: new StoredRecipe(params)]
    }
	
	def improve() {
		println params
		Time prepTime = new Time()
		prepTime.quantity = Double.valueOf(params.prepTime)
		prepTime.time = TimeUnit.valueOf(params.prepTimeUnit)
		Time cookTime = new Time()
		cookTime.quantity = Double.valueOf(params.cookTime)
		cookTime.time = TimeUnit.valueOf(params.cookTimeUnit)
		int minS, maxS
		if( params.servings.contains('-') )
		{
			minS=Integer.valueOf(params.servings.split('-')[0])
			maxS=Integer.valueOf(params.servings.split('-')[1])
		}
		else
		{
			minS=Integer.valueOf(params.servings)
			maxS=minS
		}
		ServingRange srv = new ServingRange()
		srv.min = minS
		srv.max = maxS
		//TODO The ings is a list for some reason - figure out why, for now use known index
		List<String> ingListString = params.ings[1].split('\\|') as List
		List<Ingredient> ingList = []
		ingListString.each { String ingEntry ->
			if( ingEntry == null || ingEntry.equals('') || ingEntry.equals('\\|') ) {
				return
			}
			List<String> decomposedIng = ingEntry.split(' ') as List
			Ingredient i = new Ingredient()
			i.quantity = Double.valueOf(decomposedIng[0])
			i.unit = QuantityUnit.valueOf(decomposedIng[1])
			i.name = decomposedIng[2..decomposedIng.size()-1].join(' ')
			ingList << i
		}
		
		List<String> instListString = params.insts.split('\\|') as List
		List<InstructionStep> instList = []
		instListString.each { String instEntry ->
			if( instEntry == null || instEntry.equals('') || instEntry.equals('\\|') ) {
				return
			}
			InstructionStep i = new InstructionStep()
			i.instruction = instEntry
			instList << i
		}
		
		Recipe r = new Recipe(params.title, authenticationService.getUserPrincipal().login, params.tags.split(',') as List, params.description, ingList, instList, prepTime, cookTime, srv )
		println r
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		StoredRecipe sr = recipeService.improveRecipe(r,UUID.fromString(new StoredRecipe().get(params.id).uid),Long.valueOf(params.id))
		def storedRecipeInstance = sr
		println sr
		if (!storedRecipeInstance.save(flush: true)) {
			render(view: "create", model: [storedRecipeInstance: storedRecipeInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), storedRecipeInstance.id])
		redirect(action: "show", id: storedRecipeInstance.id)
	}
	
	def search() {
		redirect(action: "list", params: params)
	}
	
	def upload()
	{
		flash.currentRecipeParams = params
		forward(controller:"fileUploader",action:"process",params:[upload:"images",successAction:"save",successController:"storedRecipe",errorAction:"create",errorController:"storedRecipe"])
	}

    def save() {
		println flash.currentRecipeParams
		Time prepTime = new Time()
		prepTime.quantity = Double.valueOf(flash.currentRecipeParams.prepTime)
		prepTime.time = TimeUnit.valueOf(flash.currentRecipeParams.prepTimeUnit)
		Time cookTime = new Time()
		cookTime.quantity = Double.valueOf(flash.currentRecipeParams.cookTime)
		cookTime.time = TimeUnit.valueOf(flash.currentRecipeParams.cookTimeUnit)
		int minS, maxS
		if( flash.currentRecipeParams.servings.contains('-') )
		{
			minS=Integer.valueOf(flash.currentRecipeParams.servings.split('-')[0])
			maxS=Integer.valueOf(flash.currentRecipeParams.servings.split('-')[1])
		}
		else
		{
			minS=Integer.valueOf(flash.currentRecipeParams.servings)
			maxS=minS
		}
		ServingRange srv = new ServingRange()
		srv.min = minS
		srv.max = maxS
		//TODO The ings is a list for some reason - figure out why, for now use known index
		List<String> ingListString = flash.currentRecipeParams.ings.split('\\|') as List
		List<Ingredient> ingList = []
		ingListString.each { String ingEntry ->
			if( ingEntry == null || ingEntry.equals('') || ingEntry.equals('\\|') ) {
				return
			}
			List<String> decomposedIng = ingEntry.split(' ') as List
			Ingredient i = new Ingredient()
			i.quantity = Double.valueOf(decomposedIng[0])
			i.unit = QuantityUnit.valueOf(decomposedIng[1])
			i.name = decomposedIng[2..decomposedIng.size()-1].join(' ')
			ingList << i
		}
		
		List<String> instListString = flash.currentRecipeParams.insts.split('\\|') as List
		List<InstructionStep> instList = []
		instListString.each { String instEntry ->
			if( instEntry == null || instEntry.equals('') || instEntry.equals('\\|') ) {
				return
			}
			InstructionStep i = new InstructionStep()
			i.instruction = instEntry
			instList << i
		}
		
		Recipe r = new Recipe(flash.currentRecipeParams.title, authenticationService.getUserPrincipal().login, flash.currentRecipeParams.tags.split(',') as List, flash.currentRecipeParams.description, ingList, instList, prepTime, cookTime, srv )
		println r
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		StoredRecipe sr = recipeService.storeRecipe(r, params.ufileId)
        def storedRecipeInstance = sr
		println sr
        if (!storedRecipeInstance.save(flush: true)) {
            render(view: "create", model: [storedRecipeInstance: storedRecipeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), storedRecipeInstance.id])
        redirect(action: "show", id: storedRecipeInstance.id)
    }

    def show(Long id) {
        def storedRecipeInstance = StoredRecipe.get(id)
		storedRecipeInstance.views = storedRecipeInstance.views + 1
		storedRecipeInstance.save()
        if (!storedRecipeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
            return
        }
		
		println recipeService.getRecipe(storedRecipeInstance)
		
        [storedRecipeInstance: storedRecipeInstance]
    }

    def edit(Long id) {
        def storedRecipeInstance = StoredRecipe.get(id)
        if (!storedRecipeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
            return
        }

        [storedRecipeInstance: storedRecipeInstance]
    }

    def update(Long id, Long version) {
        def storedRecipeInstance = StoredRecipe.get(id)
        if (!storedRecipeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (storedRecipeInstance.version > version) {
                storedRecipeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'storedRecipe.label', default: 'StoredRecipe')] as Object[],
                          "Another user has updated this StoredRecipe while you were editing")
                render(view: "edit", model: [storedRecipeInstance: storedRecipeInstance])
                return
            }
        }

        storedRecipeInstance.properties = params

        if (!storedRecipeInstance.save(flush: true)) {
            render(view: "edit", model: [storedRecipeInstance: storedRecipeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), storedRecipeInstance.id])
        redirect(action: "show", id: storedRecipeInstance.id)
    }

    def delete(Long id) {
        def storedRecipeInstance = StoredRecipe.get(id)
        if (!storedRecipeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
            return
        }

        try {
            storedRecipeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "show", id: id)
        }
    }
}
