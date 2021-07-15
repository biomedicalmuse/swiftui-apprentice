import SwiftUI

struct SuccessView: View {
	@Environment(\.presentationMode) var presentationMode
	@Binding var selectedTab: Int
	let message = """
		Good job completing all four exercises!
		Eat well and get some rest.
		"""
	 var body: some View {
		VStack(spacing: 10) {
			Spacer()
			Image(systemName: "hand.raised.fill")
				.resizedToFill(width: 75, height: 75)
				.foregroundColor(.purple)
			Text("High Five!")
				.font(.largeTitle)
				.fontWeight(.bold)
			Text(message)
				.multilineTextAlignment(.center)
				.foregroundColor(.gray)
			Spacer()
			Button("Continue") {
				presentationMode.wrappedValue.dismiss()
				selectedTab = 9
			}
			.padding()
		}
		.frame(width: 300)
	 }
}

struct SuccessView_Previews: PreviewProvider {
	 static var previews: some View {
		SuccessView(selectedTab: .constant(3))
	 }
}
