package improvemyrecipe

import org.springframework.dao.DataIntegrityViolationException

class StoredChangesetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [storedChangesetInstanceList: StoredChangeset.list(params), storedChangesetInstanceTotal: StoredChangeset.count()]
    }

    def create() {
        [storedChangesetInstance: new StoredChangeset(params)]
    }

    def save() {
        def storedChangesetInstance = new StoredChangeset(params)
        if (!storedChangesetInstance.save(flush: true)) {
            render(view: "create", model: [storedChangesetInstance: storedChangesetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), storedChangesetInstance.id])
        redirect(action: "show", id: storedChangesetInstance.id)
    }

    def show(Long id) {
        def storedChangesetInstance = StoredChangeset.get(id)
        if (!storedChangesetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "list")
            return
        }

        [storedChangesetInstance: storedChangesetInstance]
    }

    def edit(Long id) {
        def storedChangesetInstance = StoredChangeset.get(id)
        if (!storedChangesetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "list")
            return
        }

        [storedChangesetInstance: storedChangesetInstance]
    }

    def update(Long id, Long version) {
        def storedChangesetInstance = StoredChangeset.get(id)
        if (!storedChangesetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (storedChangesetInstance.version > version) {
                storedChangesetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'storedChangeset.label', default: 'StoredChangeset')] as Object[],
                          "Another user has updated this StoredChangeset while you were editing")
                render(view: "edit", model: [storedChangesetInstance: storedChangesetInstance])
                return
            }
        }

        storedChangesetInstance.properties = params

        if (!storedChangesetInstance.save(flush: true)) {
            render(view: "edit", model: [storedChangesetInstance: storedChangesetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), storedChangesetInstance.id])
        redirect(action: "show", id: storedChangesetInstance.id)
    }

    def delete(Long id) {
        def storedChangesetInstance = StoredChangeset.get(id)
        if (!storedChangesetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "list")
            return
        }

        try {
            storedChangesetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'storedChangeset.label', default: 'StoredChangeset'), id])
            redirect(action: "show", id: id)
        }
    }
}
