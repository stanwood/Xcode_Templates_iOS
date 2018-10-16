//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController, SourceTypePresentable {
   
    // MARK:- Properties
    
    var presenter: ___VARIABLE_productName___Presenter!
    var dataSource: ___VARIABLE_productName___DataSource!
    var delegate: ___VARIABLE_productName___Delegate!
    
    // MARK:- Outlets

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK:- Typealias

    typealias DataSource = ___VARIABLE_productName___DataSource
    typealias Delegate = ___VARIABLE_productName___Delegate
    
    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
    func setupCollectionView(dataType: DataType?) {
        
        delegate = ___VARIABLE_productName___Delegate(dataType: dataType)
        dataSource = ___VARIABLE_productName___DataSource(dataType: dataType)
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

}
