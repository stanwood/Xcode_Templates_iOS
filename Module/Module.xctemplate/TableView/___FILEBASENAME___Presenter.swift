//___FILEHEADER___

import StanwoodCore
import SourceModel

protocol ___VARIABLE_productName___Viewable: class {
    func setupTableView(with modelCollection: ModelCollection?)
}

class ___VARIABLE_productName___Presenter: Presentable {

    // MARK:- Properties

    weak var view: ___VARIABLE_productName___Viewable?
    var actions: ___VARIABLE_productName___Actionable
    var parameters: ___VARIABLE_productName___Parameterable

    // MARK:- Initialiser

    required init(actions: ___VARIABLE_productName___Actionable, parameters: ___VARIABLE_productName___Parameterable, view: ___VARIABLE_productName___Viewable) {
        self.view = view
        self.actions = actions
        self.parameters = parameters
    }

    // MARK:- Functions

    func viewDidLoad() {
        // TODO: replace `nil` with data from paramaterable
        view?.setupTableView(with: nil)
    }
}
