import SwiftUI

struct PostDetailsView: View {
    var postItem: PostResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(postItem.title ?? "Error occured")
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(postItem.body ?? "Error occured")
                .foregroundColor(.black)
        }
        .padding(8)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        
        Spacer()
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello World")
    }
}
