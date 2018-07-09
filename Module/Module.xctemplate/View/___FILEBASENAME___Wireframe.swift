//___FILEHEADER___

class ___VARIABLE_productName___Wireframe {
    
    static func makeViewController() -> ___VARIABLE_productName___ViewController {
    	return UIStoryboard.instantiate(viewController: ___VARIABLE_productName___ViewController.self)
    }
    
    static func prepare(_ viewController: ___VARIABLE_productName___ViewController, with  actions: ___VARIABLE_productName___Actionable, parameters: ___VARIABLE_productName___Parametable) {
    	let presenter =  ___VARIABLE_productName___Presenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
