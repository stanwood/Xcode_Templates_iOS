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
        setupCollectionView()
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        
        delegate = ___VARIABLE_productName___Delegate(dataType: Stanwood.Elements<Item>(items: []))
        dataSource = ___VARIABLE_productName___DataSource(dataType: Stanwood.Elements<Item>(items: []))
        delegate.presenter = presenter
        dataSource.presenter = presenter
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
