package improvemyrecipe



import org.junit.*
import grails.test.mixin.*

@TestFor(StoredChangesetController)
@Mock(StoredChangeset)
class StoredChangesetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/storedChangeset/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.storedChangesetInstanceList.size() == 0
        assert model.storedChangesetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.storedChangesetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.storedChangesetInstance != null
        assert view == '/storedChangeset/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/storedChangeset/show/1'
        assert controller.flash.message != null
        assert StoredChangeset.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/storedChangeset/list'

        populateValidParams(params)
        def storedChangeset = new StoredChangeset(params)

        assert storedChangeset.save() != null

        params.id = storedChangeset.id

        def model = controller.show()

        assert model.storedChangesetInstance == storedChangeset
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/storedChangeset/list'

        populateValidParams(params)
        def storedChangeset = new StoredChangeset(params)

        assert storedChangeset.save() != null

        params.id = storedChangeset.id

        def model = controller.edit()

        assert model.storedChangesetInstance == storedChangeset
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/storedChangeset/list'

        response.reset()

        populateValidParams(params)
        def storedChangeset = new StoredChangeset(params)

        assert storedChangeset.save() != null

        // test invalid parameters in update
        params.id = storedChangeset.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/storedChangeset/edit"
        assert model.storedChangesetInstance != null

        storedChangeset.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/storedChangeset/show/$storedChangeset.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        storedChangeset.clearErrors()

        populateValidParams(params)
        params.id = storedChangeset.id
        params.version = -1
        controller.update()

        assert view == "/storedChangeset/edit"
        assert model.storedChangesetInstance != null
        assert model.storedChangesetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/storedChangeset/list'

        response.reset()

        populateValidParams(params)
        def storedChangeset = new StoredChangeset(params)

        assert storedChangeset.save() != null
        assert StoredChangeset.count() == 1

        params.id = storedChangeset.id

        controller.delete()

        assert StoredChangeset.count() == 0
        assert StoredChangeset.get(storedChangeset.id) == null
        assert response.redirectedUrl == '/storedChangeset/list'
    }
}
