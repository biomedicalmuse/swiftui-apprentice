
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: NSLocalizedString("Welcome", comment: "greeting"))
                Spacer()
                Button(NSLocalizedString("History", comment: "view user activity")) {}
                  .padding(.bottom)
						
								
            }
				VStack {
					HStack(alignment: .bottom) {
						VStack(alignment: .leading) {
							Text(NSLocalizedString("Get Fit", comment: "invitation to exercise"))
								.font(.largeTitle)
							Text("with high intensity interval training")
								.font(.headline)
						}
						Image("step-up")
							.resizedToFill(width: 240, height: 240)
							.clipShape(Circle())
					}
					Button(action: {}) {
						Text(NSLocalizedString("Get Started", comment: "invitation"))
						Image(systemName: "arrow.right.circle")
//						Label("Get Started", systemImage: "arrow.right.circle")
					}
					.font(.title2)
					.padding()
				}
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
