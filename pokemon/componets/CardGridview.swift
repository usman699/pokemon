import SwiftUI

struct GridCardItems: View {
    var item: Datum // Accepts a Datum object
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ZStack {
                // You can replace this with item.images.large or small if you have an image URL
                // Load the image asynchronously using AsyncImage
                                if let imageUrlString = item.images?.large, let imageUrl = URL(string: imageUrlString) {
                                    AsyncImage(url: imageUrl) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView() // Placeholder while the image is loading
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 150)
                                        case .failure:
                                            Image(systemName: "photo") // Placeholder for error
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 150)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    // Fallback image or placeholder if URL is missing
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 150)
                                }
                                
                
                Button(action: {}) {
                    Image(systemName: "suit.heart")
                }
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .padding(.leading, 110)
                .padding(.bottom, 100)
            }
            .clipShape(
                .rect(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24))
            )
            
            VStack {
                HStack(spacing: 50) {
                 
                    Text(item.name!) // Use the name from Datum
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    
                    Button(action: {}) {
                        Image(systemName: "cart.badge.plus")
                    }
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                
                HStack {
                    Text("Price:  USD")
                        .font(.system(size: 16))
                        .foregroundColor(Color.blue)
                        .padding([.trailing], 90)
                }
                
                Spacer()
            }
        }
        .frame(height: 200) // Define the frame for the entire card
        .background(colorScheme == .dark ? Color(.systemGray5) : Color.white) // Background color for dark/light mode
        .cornerRadius(20) // Apply corner radius to the entire card
        .shadow(color: Color(.black).opacity(0.4), radius: 3) // Apply shadow
    }
}

