//___FILEHEADER___

import UIKit

class ___VARIABLE_productName___ViewController: UIViewController {
   
    private var presenter: ___VARIABLE_productName___Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func set(_ presenter: ___VARIABLE_productName___Presenter) {
        self.presenter = presenter
    }
    
}

extension ___VARIABLE_productName___ViewController: ___VARIABLE_productName___Viewable {
    
}
