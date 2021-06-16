import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var dataSource: [PostResponse] = []
    
    private var disposables = Set<AnyCancellable>()
    private let jSONPlaceholderFetcher: JSONPlaceholderFetchable

    init(jSONPlaceholderFetcher: JSONPlaceholderFetchable) {
        self.jSONPlaceholderFetcher = jSONPlaceholderFetcher
        fetchPosts()
    }
    
    func fetchPosts() {
        jSONPlaceholderFetcher.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                  print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] posts in
                                guard let self = self else { return }
                                self.dataSource = posts
            })
            .store(in: &disposables)
    }
}
