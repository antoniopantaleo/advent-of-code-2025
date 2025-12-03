import Foundation

let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
let input = String(data: try! Data(contentsOf: url), encoding: .utf8)!.trimmingCharacters(
    in: .whitespacesAndNewlines
)

let result = input
    .split(separator: ",")
    .reduce(into: 0) { result, rangeString in
        let bounds = rangeString.split(separator: "-")
        let lowerBound = Int(bounds[0])!
        let upperBound = Int(bounds[1])! + 1
        let range = CountableRange(uncheckedBounds: (lowerBound, upperBound))
        range.forEach {
            result += repeatingPattern(String($0)) ?? 0
        }
    }


print(result)
