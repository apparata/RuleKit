//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

extension Sequence {

    func satisfying(_ rule: Rule<Element>) -> [Element] {
        return filter { element in
            rule.isSatisfied(for: element)
        }
    }
}
