

import SwiftUI

struct SuccessView: View {
	let message = """
		Good job completing all four exercises!
		Eat well and get some rest.
		"""
    var body: some View {
		VStack(spacing: 10) {
			Image(systemName: "hand.raised.fill")
				.resizedToFill(width: 75, height: 75)
				.foregroundColor(.purple)
			Text("High Five!")
				.font(.largeTitle)
				.fontWeight(.bold)
			Text(message)
				.multilineTextAlignment(.center)
				.foregroundColor(.gray)
		}
		.frame(width: 300)
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
