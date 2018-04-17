//
// Copyright © Jose Martinez. All rights reserved.
//

import Foundation
import UIKit

class ListWireframe {
    
    var viewController: ListViewController?
    var wireframeToPresenter: ListPresenter?
    
    /// Creates presenter, interactor, wireframe and setup dependencies.
    static func makeWireframe() -> ListWireframe {
        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor()
        let listWireframe = ListWireframe()
        
        listPresenter.presenterToInteractor = listInteractor
        listPresenter.presenterToWireframe = listWireframe
        listWireframe.wireframeToPresenter = listPresenter
        
        return listWireframe
    }
    
    func present(window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listViewControllerIdentifier = String(describing: ListViewController.self)
        
        guard let listViewController = storyboard.instantiateViewController(withIdentifier: listViewControllerIdentifier) as? ListViewController else {
            return
        }
        
        listViewController.viewToPresenter = wireframeToPresenter
        wireframeToPresenter?.presenterToView = listViewController
        
        window.rootViewController = listViewController
    }
    
}
