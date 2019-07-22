//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func not(_ rule: Rule<Value>) -> Rule<Value> {
        return SatisfyNotRule(rule)
    }
}

private class SatisfyNotRule<Value>: Rule<Value> {
    
    private let rule: Rule<Value>
    
    init(_ rule: Rule<Value>) {
        self.rule = rule
        super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        return !rule.isSatisfied(for: value)
    }
}
