//___FILEHEADER___

import UIKit
import StanwoodCore
import SourceModel

class ___VARIABLE_productName___ViewController: UIViewController, SourceTypePresentable {

    // MARK:- Properties

    private var presenter: ___VARIABLE_productName___Presenter!
    var dataSource: ___VARIABLE_productName___DataSource!
    var delegate: ___VARIABLE_productName___Delegate!

    // MARK:- Outlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK:- Typealias

    typealias DataSource = ___VARIABLE_productName___DataSource
    typealias Delegate = ___VARIABLE_productName___Delegate

    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func set(_ presenter: ___VARIABLE_productName___Presenter) {
        self.presenter = presenter
    }
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {

    func setupTableView(with modelCollection: ModelCollection?) {

        guard dataSource == nil else {
            delegate.update(modelCollection: modelCollection)
            dataSource.update(modelCollection: modelCollection)

            tableView.reloadData()
            return
        }

        delegate = ___VARIABLE_productName___Delegate(modelCollection: modelCollection)
        dataSource = ___VARIABLE_productName___DataSource(modelCollection: modelCollection)

        // Uncomment when registering XIB files
        // tableView.register(cellTypes: UITableViewCell.self, AnotherUITableViewCell.self)

        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
}
