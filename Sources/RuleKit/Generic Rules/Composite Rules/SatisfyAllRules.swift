//
//  Copyright © 2019 Apparata AB. All rights reserved.
//

import Foundation

public extension Rule {
    
    static func all(_ rules: Rule<Value>...) -> Rule<Value> {
        return SatisfyAllRules(rules)
    }
    
    static func all(_ rules: AnySequence<Rule<Value>>) -> Rule<Value> {
        return SatisfyAllRules(rules)
    }
}

private class SatisfyAllRules<Value>: Rule<Value> {
    
    private let rules: AnySequence<Rule<Value>>
    
    init<RuleSequence: Sequence>(_ rules: RuleSequence)
        where RuleSequence.Element == Rule<Value> {
        self.rules = AnySequence<Rule<Value>>(rules)
        super.init()
    }

    public override func isSatisfied(for value: Value) -> Bool {
        for rule in rules {
            if rule.isNotSatisfied(for: value) {
                return false
            }
        }
        return true
    }
}
