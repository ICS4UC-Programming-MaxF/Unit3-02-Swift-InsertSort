import Foundation

func insertionSort(_ numbers: inout [Int]) {
    guard numbers.count > 1 else { return }
    for index in 1..<numbers.count {
        let key = numbers[index]
        var position = index - 1
        while position >= 0 && numbers[position] > key {
            numbers[position + 1] = numbers[position]
            position -= 1
        }
        numbers[position + 1] = key
    }
}

do {
    let contents = try String(contentsOfFile: "input.txt", encoding: .utf8)
    var output = ""

    for line in contents.split(separator: "\n") {
        var numbers = line.split(separator: " ").compactMap { Int($0) }
        if numbers.isEmpty { continue }
        insertionSort(&numbers)
        output += numbers.map { String($0) }.joined(separator: " ") + "\n"
    }

    try output.write(toFile: "output.txt", atomically: true, encoding: .utf8)
    print("Done! See output.txt")
} catch {
    print("File error: \(error)")
}