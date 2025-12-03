import Foundation

public func repeatingPattern(_ string: String) -> Int? {
    if string.count % 2 != 0 { return nil }
    let firstHalf = String(string[string.index(string.startIndex, offsetBy: 0)..<string.index(string.startIndex, offsetBy: string.count / 2)])
    let secondHalf = String(string[string.index(string.startIndex, offsetBy: string.count / 2)..<string.index(string.startIndex, offsetBy: string.count)])
    if firstHalf == secondHalf {
        return Int(string)!
    } else {
        return nil
    }
}
