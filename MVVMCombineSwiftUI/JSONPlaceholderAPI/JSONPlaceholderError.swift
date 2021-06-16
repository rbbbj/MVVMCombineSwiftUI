import Foundation

enum JSONPlaceholderError: Error {
    case parsing(description: String)
    case network(description: String)
}
