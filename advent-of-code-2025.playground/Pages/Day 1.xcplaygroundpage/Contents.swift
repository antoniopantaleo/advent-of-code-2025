//: [Previous](@previous)

import Foundation

let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!

var current = 50
let total = 100
var passwordCount = 0

for line in input.components(separatedBy: .whitespacesAndNewlines) {
    let regex = /(?<direction>[LR])(?<amount>[0-9]+)/
    if let match = line.wholeMatch(of: regex) {
        let sign = match.output.direction == "L" ? -1 : 1
        let amount = Int(match.output.amount)!
        current = mod((current + (sign * amount)), total)
        if current == 0 { passwordCount += 1}
    }
}

print(passwordCount)
//: [Next](@next)
