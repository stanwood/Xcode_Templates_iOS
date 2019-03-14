//___FILEHEADER___

protocol ___VARIABLE_productName___Viewable: class {
    func setupTableView(dataType: DataType?)
}

class ___VARIABLE_productName___Presenter: Presentable {
    
    // MARK:- Properties
    
    private weak var view: ___VARIABLE_productName___Viewable?
    private var actions: ___VARIABLE_productName___Actionable
    private var parameters: ___VARIABLE_productName___Parameterable
    
    // MARK:- Typealias
    
    typealias Actionable = ___VARIABLE_productName___Actionable
    typealias Parameterable = ___VARIABLE_productName___Parameterable
    typealias Viewable = ___VARIABLE_productName___Viewable
    
    // MARK:- Initialiser
    
    required init(actions: ___VARIABLE_productName___Actionable, parameters: ___VARIABLE_productName___Parameterable, view: ___VARIABLE_productName___Viewable) {
        self.view = view
        self.actions = actions
        self.parameters = parameters
    }
    
    // MARK:- Functions
    
    func viewDidLoad() {
        // TODO: replace `nil` with data from paramaterable
        viewable.setupTableView(dataType: nil)
    }
}
