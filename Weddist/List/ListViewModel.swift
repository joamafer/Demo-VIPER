//
// Copyright © Jose Martinez. All rights reserved.
//

import Foundation

struct ListViewModel {
    
    var names: [String]
    
    init(model: ListModel) {
        self.names = model.people.map{ $0.name }
    }
    
}
