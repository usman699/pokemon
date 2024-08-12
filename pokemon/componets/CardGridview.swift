import SwiftUI

struct GridCardItems: View {
    @Environment(\.colorScheme) var colorscheme
    var body: some View {
        VStack {
            ZStack {
                Image("9439678")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
              
                Button(){}
            label:{
                    Image(systemName: "suit.heart")}
            
            .foregroundColor(.white)
           
            .frame(width: 30 ,height: 30)
            .padding(.leading, 110)
            .padding(.bottom, 100)
            }
            .clipShape(
                .rect(cornerRadii: RectangleCornerRadii(topLeading: 24, topTrailing: 24))
            )
    
            VStack {
                HStack (spacing:50){
                    Text("Homies")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(colorscheme == .dark ? Color.white : Color.black)
                    
                    Button{
                        
                    }
                   
                    label:{
                        Image(systemName: "cart.badge.plus")
                        
                    }
                     .foregroundColor(colorscheme == .dark ? Color.white : Color.black)
                }
           
                HStack {
                    
                    Text("Price")
                        .font(.system(size: 16))
                        .foregroundColor( Color.blue)
                        .padding([.trailing], 90)
                }
                
                Spacer()
            }
        }
        
        .frame(height: 200) // Define the frame for the entire card
        .background(colorscheme == .dark ? Color(.systemGray5) : Color.white) // Background color for dark/light mode
        .cornerRadius(20) // Apply corner radius to the entire card
        .shadow(color:   Color(.black).opacity(0.4), radius: 3 ) // Apply shadow
    }
}

#Preview {
    GridCardItems()
}

