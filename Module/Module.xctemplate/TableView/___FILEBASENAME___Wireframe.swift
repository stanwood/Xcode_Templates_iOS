//___FILEHEADER___

class ___VARIABLE_productName___Wireframe {

    static func makeViewController() -> ___VARIABLE_productName___ViewController {
      return UIStoryboard(name: ___VARIABLE_productName___ViewController.self.identifier, bundle: nil).instantiate(viewController: ___VARIABLE_productName___ViewController.self)
    }

    static func prepare(_ viewController: ___VARIABLE_productName___ViewController, actions: ___VARIABLE_productName___Actionable, parameters: ___VARIABLE_productName___Parameterable) {
    	let presenter =  ___VARIABLE_productName___Presenter(actions: actions, parameters: parameters, view: viewController)
        viewController.set(presenter)
    }

}
