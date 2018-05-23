//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: AbstractViewController {
    var presenter: ___VARIABLE_productName___Presenter!
    var delegate: ___VARIABLE_productName___ViewDelegate?
    var dataSource: ___VARIABLE_productName___ViewDataSource?
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
