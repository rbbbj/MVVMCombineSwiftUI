import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel: PostsViewModel
    init(viewModel: PostsViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataSource ) { post in
                    ItemRow(item: post)
                }
            }
            .navigationTitle("Posts")
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
