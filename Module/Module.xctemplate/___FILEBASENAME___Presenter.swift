//___FILEHEADER___

protocol ___VARIABLE_productName___Viewable: class {
    
}

class ___VARIABLE_productName___Presenter {
    
    private weak var view: ___VARIABLE_productName___Viewable?
    private var action: ___VARIABLE_productName___Actionable
    private var parameters: ___VARIABLE_productName___Parametable
    
    init(with view: ___VARIABLE_productName___Viewable, action: ___VARIABLE_productName___Actionable, paramaters: ___VARIABLE_productName___Parametable) {
        self.view = view
        self.action = action
        self.parameters = paramaters
    }
    
    func viewDidLoad() {
    
    }
    
}
