//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func any(_ rules: Rule<Value>...) -> Rule<Value> {
        return SatisfyAnyRules(rules)
    }
    
    static func any(_ rules: AnySequence<Rule<Value>>) -> Rule<Value> {
        return SatisfyAnyRules(rules)
    }
}

private class SatisfyAnyRules<Value>: Rule<Value> {
    
    private let rules: AnySequence<Rule<Value>>
    
    init<RuleSequence: Sequence>(_ rules: RuleSequence)
        where RuleSequence.Element == Rule<Value> {
            self.rules = AnySequence<Rule<Value>>(rules)
            super.init()
    }
    
    public override func isSatisfied(for value: Value) -> Bool {
        for rule in rules {
            if rule.isSatisfied(for: value) {
                return true
            }
        }
        return false
    }
}
