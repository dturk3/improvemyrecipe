package improvemyrecipe

import org.springframework.dao.DataIntegrityViolationException

class StoredRecipeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def recipeService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [storedRecipeInstanceList: StoredRecipe.list(params), storedRecipeInstanceTotal: StoredRecipe.count()]
    }

    def create() {
		HgAdapter hga = new HgAdapter(Configuration.HG_REPO_DIR, Configuration.HG_BIN_PATH)
		recipeService.storeRecipe(hga.generateRecipe())
        [storedRecipeInstance: new StoredRecipe(params)]
    }

    def save() {
        def storedRecipeInstance = new StoredRecipe(params)
        if (!storedRecipeInstance.save(flush: true)) {
            render(view: "create", model: [storedRecipeInstance: storedRecipeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), storedRecipeInstance.id])
        redirect(action: "show", id: storedRecipeInstance.id)
    }

    def show(Long id) {
        def storedRecipeInstance = StoredRecipe.get(id)
        if (!storedRecipeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedRecipe.label', default: 'StoredRecipe'), id])
            redirect(action: "list")
            return
        }

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
