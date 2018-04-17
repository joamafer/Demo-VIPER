//
// Copyright © Jose Martinez. All rights reserved.
//

import Foundation

protocol ListActionsFromViewToPresenterProtocol: class {
    func viewDidLoad()
    func numberOfRowsInSection(section: Int) -> Int
    func modelForIndexPath(_ indexPath: IndexPath) -> String?
}

class ListPresenter {
    var presenterToInteractor: ListActionsFromPresenterToInteractorProtocol?
    var presenterToView: ListActionsFromPresenterToViewProtocol?
    var presenterToWireframe: ListWireframe?
}

extension ListPresenter: ListActionsFromViewToPresenterProtocol {
    
    func viewDidLoad() {
        presenterToInteractor?.fetch(completion: { (listViewModel, error) in
            self.presenterToView?.didFinishFetching()
        })
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return presenterToInteractor?.numberOfRowsInSection(section) ?? 0
    }
    
    func modelForIndexPath(_ indexPath: IndexPath) -> String? {
        return presenterToInteractor?.modelForIndexPath(indexPath)
    }
    
}
