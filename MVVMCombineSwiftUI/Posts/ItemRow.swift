import SwiftUI

struct ItemRow: View {
    let item: PostResponse
    
    var body: some View {
        HStack {
            Text(item.title ?? "Error")
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello world")
    }
}
