//___FILEHEADER___

protocol ___VARIABLE_productName___Viewable: class {
    
}

class ___VARIABLE_productName___Presenter: Presentable {
    
    // MARK:- Properties
    
    weak var viewable: ___VARIABLE_productName___Viewable?
    var actionable: ___VARIABLE_productName___Actionable
    var parameterable: ___VARIABLE_productName___Parameterable
    
    // MARK:- Typealias
    
    typealias Actionable = ___VARIABLE_productName___Actionable
    typealias Parameterable = ___VARIABLE_productName___Parameterable
    typealias Viewable = ___VARIABLE_productName___Viewable
    
    
    required init(actionable: ___VARIABLE_productName___Actionable, parameterable: ___VARIABLE_productName___Parameterable, viewable: ___VARIABLE_productName___Viewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    func viewDidLoad() {
    
    }
    
}
