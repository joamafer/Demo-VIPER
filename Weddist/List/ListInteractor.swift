//
// Copyright © Jose Martinez. All rights reserved.
//

import Foundation

protocol ListActionsFromPresenterToInteractorProtocol: class {
    func fetch(completion: @escaping ((ListViewModel?, Error?) -> Void))
    func numberOfRowsInSection(_ section: Int) -> Int
    func modelForIndexPath(_ indexPath: IndexPath) -> String?
}

class ListInteractor {
    var viewModel: ListViewModel?
}

extension ListInteractor: ListActionsFromPresenterToInteractorProtocol {
    
    func fetch(completion: @escaping ((ListViewModel?, Error?) -> Void)) {
        guard let url = URL(string: "https://s3.amazonaws.com/cdn.clearscore.com/native/json/TestsJose/peopleJoseTest.json") else {
            completion(nil, NSError(domain: "com.weddlist.ios", code: 404, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                
                guard let data = data else {
                    completion(nil, nil)
                    return
                }
                
                do {
                    let listModel = try JSONDecoder().decode(ListModel.self, from: data)
                    let listViewModel = ListViewModel(model: listModel)
                    self.viewModel = listViewModel
                    
                    completion(listViewModel, nil)
                } catch {
                    completion(nil, NSError(domain: "com.weddlist.ios", code: 404, userInfo: nil))
                }
            }
        }.resume()
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return viewModel?.names.count ?? 0
    }
    
    func modelForIndexPath(_ indexPath: IndexPath) -> String? {
        return viewModel?.names[indexPath.row]
    }
    
}
