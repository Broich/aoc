import Algorithms
import Foundation

let redLimit = 12
let greenLimit = 13
let blueLimit = 14

struct Day02: AdventDay {
    // Save your data in a corresponding text file in the `Data` directory.
    var data: String

    // Splits input data into its component parts and convert from string.
    var entities: [String] {
        data.split(separator: "\n").map { String($0) }
    }

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Any {
        var gameIdSum = 0

        for (index, entity) in entities.enumerated() {
            var limitHit = false
            let components = entity.components(separatedBy: ":")

            let sets = components.last!.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }
            for gamseSet in sets {
                // 3 blue, 4 red
                let cubes = gamseSet.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces)}
                for cubeValues in cubes {
                    let cubeValue = cubeValues.components(separatedBy: " ")
                    switch cubeValue.last {
                    case "blue":
                        if Int(cubeValue.first!)! > blueLimit {
                            limitHit = true
                            break
                        }
                    case "red":
                        if Int(cubeValue.first!)! > redLimit {
                            limitHit = true
                            break
                        }
                    case "green":
                        if Int(cubeValue.first!)! > greenLimit {
                            limitHit = true
                            break
                        }
                    default: break
                    }
                }
            }
            if !limitHit {
                gameIdSum += index+1
            }
        }
        return gameIdSum
    }

    // Replace this with your solution for the second part of the day's challenge.
//    func part2() -> Any {
//        return ""
//    }
}



//indirect enum Animal {
//    case dog(name: String, kind: Animal)
//}

