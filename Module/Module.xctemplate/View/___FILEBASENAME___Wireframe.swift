//___FILEHEADER___

class ___VARIABLE_productName___Wireframe {
    
    static func prepareViewController(with  action: ___VARIABLE_productName___Actionable, parameters: ___VARIABLE_productName___Parametable) -> ___VARIABLE_productName___ViewController {
    
    	let identifier = "___VARIABLE_productName___ViewController"
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! ___VARIABLE_productName___ViewController
        let presenter =  ___VARIABLE_productName___Presenter(with: controller, action: action, paramaters: parameters)
  
        controller.presenter = presenter
        return controller
    }
    
}
