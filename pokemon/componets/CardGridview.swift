import SwiftUI

struct GridCardItems: View {
    var item: Datum // Accepts a Datum object
    @StateObject private var viewModel = MainViewmodel()
    @Environment(\.colorScheme) var colorScheme
  
    var body: some View {
        let priceString = String(format: "%.2f", self.item.tcgplayer?.prices?.holofoil?.high ?? 0)
        
        VStack{
            VStack (alignment:.center){
                if let imageUrlString = item.images?.large, let imageUrl = URL(string: imageUrlString) {
                    AsyncImage(url: imageUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Placeholder while the image is loading
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 170)
                                .cornerRadius(6)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 170)
                                .cornerRadius(6)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            VStack(alignment:.leading){
                Text(item.name!) // Use the name from Datum
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3) // Allows up to 3 lines, adjust as needed
                    .fixedSize(horizontal: false, vertical: true) // Expands vertically, not horizontally
            }
            
            Spacer()
            
            HStack {
                Text("$\(priceString)")
                    .font(.system(size: 16))
                    .foregroundColor(Color.blue)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "cart.badge.plus")
                }
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                
                Button(action: {}) {
                    Image(systemName: "suit.heart")
                }
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
            .padding(.top, 5)
            
            Spacer()
        }
        .padding(20) // Add padding to the entire content inside the card
        .background(colorScheme == .dark ? Color(.systemGray5) : Color.white) // Background color for dark/light mode
        .cornerRadius(20) // Apply corner radius to the entire card
        .shadow(color: Color(.black).opacity(0.4), radius: 3) // Apply shadow
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Allow the card to fill the available space
    }
}

