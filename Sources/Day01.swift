import Algorithms
import Foundation

struct Day01: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map { String($0) }
    }

    let wordNumbers: [String] = [
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine"
    ]

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var total = 0

        for word in entities {
            var firstDigit: String?
            var secondDigit: String?
            for char in word {
                if char.isNumber {
                    if firstDigit == nil {
                        firstDigit = String(char)
                    } else {
                        secondDigit = String(char)
                    }
                }
            }
            if secondDigit == nil {
                secondDigit = firstDigit
            }

            guard let first = firstDigit, let second = secondDigit else { return 0 }

            if let combinedDigits = Int(first.appending(second)) {
                total += combinedDigits
            }
        }
        return total
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return entities.map { word in
            let firstNumber = find(in: word, reversed: false)
            let secondNumber = find(in: String(word.reversed()), reversed: true)
            return Self.formDigits(for: [firstNumber, secondNumber])

        }.reduce(0, +)
    }

    static func formDigits(for digits: [Int]) -> Int {
        digits.first! * 10 + digits.last!
    }

    private func find(in string: String, reversed: Bool) -> Int {
        for (index, char) in string.enumerated() {
            if char.isWholeNumber {
                return Int(String(char))!
            } else {
                let candidates = getCandidates(for: char, reversed: reversed)
                if !candidates.isEmpty {
                    for candidate in candidates {
                        if let possibleMatch = getCandidateSubstring(with: string, candidate: candidate, offset: index) {
                            if possibleMatch == candidate {
                                return getNumber(for: possibleMatch)
                            }
                        }
                    }
                } else {
                    continue
                }
            }
        }
        return 0
    }

    private func getCandidates(for char: Character, reversed: Bool) -> [String] {
        if reversed {
            switch char {
            case "e": return ["eno", "eerht", "evif", "enin"]
            case "o": return ["owt"]
            case "r": return ["ruof"]
            case "x": return ["xis"]
            case "n": return ["neves"]
            case "t": return ["thgie"]
            default: return []
            }
        } else {
            switch char {
            case "o": return ["one"]
            case "t": return ["two", "three"]
            case "f": return ["four", "five"]
            case "s": return ["six", "seven"]
            case "e": return ["eight"]
            case "n": return ["nine"]
            default: return []
            }
        }
    }

    private func getNumber(for string: String) -> Int {
        switch string {
        case "one", "eno": return 1
        case "two", "owt": return 2
        case "three", "eerht": return 3
        case "four", "ruof": return 4
        case "five", "evif": return 5
        case "six", "xis": return 6
        case "seven", "neves": return 7
        case "eight", "thgie": return 8
        case "nine", "enin": return 9
        default: fatalError("No number found")
        }
    }

    private func getCandidateSubstring(with string: String, candidate: String, offset: Int) -> String? {
        guard offset + candidate.count <= string.count else { return nil }

        let startIndex = string.index(string.startIndex, offsetBy: offset)
        let endIndex = string.index(string.startIndex, offsetBy: offset + candidate.count)

        return String(string[startIndex..<endIndex])
    }
}



//indirect enum Animal {
//    case dog(name: String, kind: Animal)
//}
