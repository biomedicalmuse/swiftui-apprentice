
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") {}
                  .padding(.bottom)
						
								
            }
				VStack {
					HStack(alignment: .bottom) {
						VStack(alignment: .leading) {
							Text("Get fit")
								.font(.largeTitle)
							Text("with high intensity interval training")
								.font(.headline)
						}
						Image("step-up")
							.resizedToFill(width: 240, height: 240)
							.clipShape(Circle())
					}
				
				}
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
