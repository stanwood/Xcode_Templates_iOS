//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: AbstractViewController {
    var presenter: ___VARIABLE_productName___Presenter!
    var delegate: ___VARIABLE_productName___ViewDelegate?
    var dataSource: ___VARIABLE_productName___ViewDataSource?
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
