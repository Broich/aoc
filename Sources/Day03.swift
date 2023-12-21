import Algorithms
import Foundation

struct Day03: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map { String($0) }
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        return ""
    }

    // Replace this with your solution for the second part of the day's challenge.
    func part2() -> Any {
        return ""
    }
}

//indirect enum Animal {
//    case dog(name: String, kind: Animal)
//}

