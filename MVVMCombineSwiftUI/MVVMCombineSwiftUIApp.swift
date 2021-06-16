import SwiftUI

@main
struct MVVMCombineSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = PostsViewModel(jSONPlaceholderFetcher: JSONPlaceholderFetcher())
            PostsView(viewModel: viewModel)
        }
    }
}
