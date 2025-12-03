//: [Previous](@previous)

import Foundation

let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!

var current = 50
let total = 100
var passwordCount = 0

for line in input.components(separatedBy: .whitespacesAndNewlines) {
    let regex = /(?<direction>[LR])(?<amount>[0-9]+)/
    guard let match = line.wholeMatch(of: regex) else { continue }
    let sign = match.output.direction == "L" ? -1 : 1
    let amount = Int(match.output.amount)!
    let isGoingLeft = (sign == -1)
    let distanceToZero: Int
    if isGoingLeft {
        distanceToZero = (current == 0) ? total : current
    } else {
        distanceToZero = (current == 0) ? total : (total - current)
    }
    if amount >= distanceToZero {
        passwordCount += 1 + (amount - distanceToZero) / total
    }
    current = mod((current + (sign * amount)), total)
}

print(passwordCount)
//: [Next](@next)
