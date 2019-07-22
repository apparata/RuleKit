//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func none(_ rules: Rule<Value>...) -> Rule<Value> {
        return SatisfyNoRule(rules)
    }
    
    static func none(_ rules: AnySequence<Rule<Value>>) -> Rule<Value> {
        return SatisfyNoRule(rules)
    }
}

private class SatisfyNoRule<Value>: Rule<Value> {
    
    private let rules: AnySequence<Rule<Value>>
    
    init<RuleSequence: Sequence>(_ rules: RuleSequence)
        where RuleSequence.Element == Rule<Value> {
            self.rules = AnySequence<Rule<Value>>(rules)
            super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        for rule in rules {
            if rule.isSatisfied(for: value) {
                return false
            }
        }
        return true
    }
}
