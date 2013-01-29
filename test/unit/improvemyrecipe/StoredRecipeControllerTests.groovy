package improvemyrecipe



import org.junit.*
import grails.test.mixin.*

@TestFor(StoredRecipeController)
@Mock(StoredRecipe)
class StoredRecipeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/storedRecipe/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.storedRecipeInstanceList.size() == 0
        assert model.storedRecipeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.storedRecipeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.storedRecipeInstance != null
        assert view == '/storedRecipe/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/storedRecipe/show/1'
        assert controller.flash.message != null
        assert StoredRecipe.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/storedRecipe/list'

        populateValidParams(params)
        def storedRecipe = new StoredRecipe(params)

        assert storedRecipe.save() != null

        params.id = storedRecipe.id

        def model = controller.show()

        assert model.storedRecipeInstance == storedRecipe
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/storedRecipe/list'

        populateValidParams(params)
        def storedRecipe = new StoredRecipe(params)

        assert storedRecipe.save() != null

        params.id = storedRecipe.id

        def model = controller.edit()

        assert model.storedRecipeInstance == storedRecipe
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/storedRecipe/list'

        response.reset()

        populateValidParams(params)
        def storedRecipe = new StoredRecipe(params)

        assert storedRecipe.save() != null

        // test invalid parameters in update
        params.id = storedRecipe.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/storedRecipe/edit"
        assert model.storedRecipeInstance != null

        storedRecipe.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/storedRecipe/show/$storedRecipe.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        storedRecipe.clearErrors()

        populateValidParams(params)
        params.id = storedRecipe.id
        params.version = -1
        controller.update()

        assert view == "/storedRecipe/edit"
        assert model.storedRecipeInstance != null
        assert model.storedRecipeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/storedRecipe/list'

        response.reset()

        populateValidParams(params)
        def storedRecipe = new StoredRecipe(params)

        assert storedRecipe.save() != null
        assert StoredRecipe.count() == 1

        params.id = storedRecipe.id

        controller.delete()

        assert StoredRecipe.count() == 0
        assert StoredRecipe.get(storedRecipe.id) == null
        assert response.redirectedUrl == '/storedRecipe/list'
    }
}
