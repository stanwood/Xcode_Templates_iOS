//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {
    var presenter: ___VARIABLE_productName___Presenter!
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = presenter.delegate
        tableView.dataSource = presenter.dataSource
        tableView.reloadData()
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
