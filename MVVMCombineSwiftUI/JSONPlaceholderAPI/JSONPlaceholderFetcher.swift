import Foundation
import Combine

protocol JSONPlaceholderFetchable {
    func fetchPosts() -> AnyPublisher<[PostResponse], JSONPlaceholderError>
}

class JSONPlaceholderFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}

extension JSONPlaceholderFetcher: JSONPlaceholderFetchable {

    
    func fetchPosts() -> AnyPublisher<[PostResponse], JSONPlaceholderError>  {
        let components = makePostsComponents()
        guard let url = components.url else {
            let error = JSONPlaceholderError.network(description: "Couldn't create URL")
            return Fail(error: error)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
              .map(\.data)
              .decode(type: [PostResponse].self, decoder: JSONDecoder())
            .mapError({ error in
                .network(description: error.localizedDescription)
            })
              .eraseToAnyPublisher()
          }
    }

private extension JSONPlaceholderFetcher {
    struct JSONPlaceholderAPI {
        static let scheme = "https"
        static let host = "jsonplaceholder.typicode.com"
        static let path = "/posts"
    }
    
    func makePostsComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = JSONPlaceholderAPI.scheme
        components.host = JSONPlaceholderAPI.host
        components.path = JSONPlaceholderAPI.path
        
        return components
    }
}
