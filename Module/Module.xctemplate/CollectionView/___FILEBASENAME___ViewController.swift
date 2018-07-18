//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {
    var presenter: ___VARIABLE_productName___Presenter!
    
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = presenter.delegate
        collectionView.dataSource = presenter.dataSource
        collectionView.reloadData()
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
