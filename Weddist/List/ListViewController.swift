//
// Copyright © Jose Martinez. All rights reserved.
//

import Foundation
import UIKit

protocol ListActionsFromPresenterToViewProtocol: class {
    func didFinishFetching()
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewToPresenter: ListActionsFromViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewToPresenter?.viewDidLoad()
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewToPresenter?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self),
                                                       for: indexPath) as? ListCell else {
            return UITableViewCell(frame: .zero)
        }
        
        let model = viewToPresenter?.modelForIndexPath(indexPath)
        cell.titleLabel.text = model
        
        return cell
    }
    
}

extension ListViewController: ListActionsFromPresenterToViewProtocol {
    
    func didFinishFetching() {
        tableView.reloadData()
    }
    
}
