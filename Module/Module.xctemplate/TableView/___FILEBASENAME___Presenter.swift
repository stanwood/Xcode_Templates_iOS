//___FILEHEADER___

protocol ___VARIABLE_productName___Viewable: class {
    
}

class ___VARIABLE_productName___Presenter: Presentable, SourceTypePresentable {
    
    // MARK:- Properties
    
    weak var viewable: ___VARIABLE_productName___Viewable?
    var actionable: ___VARIABLE_productName___Actionable
    var parameterable: ___VARIABLE_productName___Parameterable
    var dataSource: ___VARIABLE_productName___DataSource!
    var delegate: ___VARIABLE_productName___Delegate!
    
    // MARK:- Typealias
    
    typealias Actionable = ___VARIABLE_productName___Actionable
    typealias Parameterable = ___VARIABLE_productName___Parameterable
    typealias Viewable = ___VARIABLE_productName___Viewable
    typealias DataSource = ___VARIABLE_productName___DataSource
    typealias Delegate = ___VARIABLE_productName___Delegate
    
    required init(actionable: ___VARIABLE_productName___Actionable, parameterable: ___VARIABLE_productName___Parameterable, viewable: ___VARIABLE_productName___Viewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
        delegate = ___VARIABLE_productName___Delegate(dataObject: Stanwood.Elements<Item>(items: []))
        dataSource = ___VARIABLE_productName___DataSource(dataObject: Stanwood.Elements<Item>(items: []))
        delegate.presenter = self
        dataSource.presenter = self
  }
    
    func viewDidLoad() {
    
    }
    
}
