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



        var total = 0

        for word in entities {
            let finalWord = find(in: word)
            //            let replacedWord = find(in: word)
            //            var firstDigit: String?
            //            var secondDigit: String?
            //            for char in replacedWord {
            //                if char.isNumber {
            //                    if firstDigit == nil {
            //                        firstDigit = String(char)
            //                    } else {
            //                        secondDigit = String(char)
            //                    }
            //                }
            //            }
            //            if secondDigit == nil {
            //                secondDigit = firstDigit
            //            }
            //
            //            guard let first = firstDigit, let second = secondDigit else { return 0 }
            //
            //            if let combinedDigits = Int(first.appending(second)) {
            //                print("Combined Digits: \(combinedDigits)")
            //                total += combinedDigits
            //            }
        }

        return total
    }

    private func find(in string: String) -> String {
        var finalWord = ""
        var firstNumber: Int?
        var secondNumber: Int?
        print("-------")
        print("Incoming word: \(string)")

        for (index, char) in string.enumerated() {

            print("char: \(char)")
            if char.isWholeNumber {
                firstNumber = Int(String(char))
                break
            } else {
                let candidates = getCandidates(for: char)
                print("Found \(candidates.count) candidates")
                if !candidates.isEmpty {
                    // first = wo, second = hree
                    for candidate in candidates {
                        let possibleMatch = getCandidateSubstring(with: string, candidate: candidate, offset: index)
                        print("possible match: \(possibleMatch)")
                        if possibleMatch == candidate {
                            // get number and break
                            firstNumber = getNumber(for: possibleMatch)
                            break
                        } else {
                            continue
                        }
                    }
                    if firstNumber != nil {
                        break
                    }
                } else {
                    continue
                }
            }
        }


        print("Found first number: \(firstNumber.debugDescription)")
        secondNumber = findReversed(in: String(string.reversed()))

        print("Final word: \(finalWord)")
        return finalWord
    }


    func findReversed(in string: String) -> Int {

        var secondNumber: Int?

        print("Reversed word: \(string)")

        for (index, char) in string.enumerated() {
            print("char: \(char)")
            if char.isWholeNumber {
                secondNumber = Int(String(char))
                return secondNumber!
            } else {
                let candidates = getCandidatesReversed(for: char)
                print("Found \(candidates.count) candidates")
                if !candidates.isEmpty {
                    // first = wo, second = hree
                    for candidate in candidates {
                        let possibleMatch = getCandidateSubstring(with: string, candidate: candidate, offset: index)
                        print("possible match: \(possibleMatch)")
                        if possibleMatch == candidate {
                            // get number and break
                            secondNumber = getNumberReversed(for: String(possibleMatch.reversed()))
                            return secondNumber!
                        } else {
                            continue
                        }
                    }
                } else {
                    continue
                }
            }
        }
        return 0
    }


    private func getCandidates(for char: Character) -> [String] {
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

    private func getCandidatesReversed(for char: Character) -> [String] {
        switch char {
        case "e": return ["eno", "eerht", "evif", "enin"]
        case "o": return ["owt"]
        case "r": return ["ruof"]
        case "x": return ["xis"]
        case "n": return ["neves"]
        case "t": return ["thgie"]
        default: return []
        }
    }

    private func getNumber(for string: String) -> Int {
        switch string {
        case "one": return 1
        case "two": return 2
        case "three": return 3
        case "four": return 4
        case "five": return 5
        case "six": return 6
        case "seven": return 7
        case "eight": return 8
        case "nine": return 9
        default: fatalError("No number found")
        }
    }

    private func getNumberReversed(for string: String) -> Int {
        switch string {
        case "one": return 1
        case "two": return 2
        case "three": return 3
        case "four": return 4
        case "five": return 5
        case "six": return 6
        case "seven": return 7
        case "eight": return 8
        case "nine": return 9
        default: fatalError("No number found")
        }
    }

    private func getCandidateSubstring(with string: String, candidate: String, offset: Int) -> String {
        let startIndex = string.index(string.startIndex, offsetBy: offset)
        let endIndex = string.index(string.startIndex, offsetBy: offset + candidate.count)

        return String(string[startIndex..<endIndex])
    }
}



//indirect enum Animal {
//    case dog(name: String, kind: Animal)
//}
