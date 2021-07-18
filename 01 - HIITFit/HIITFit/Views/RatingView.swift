import SwiftUI

struct RatingView: View {
	let exerciseIndex: Int
	@AppStorage("ratings") private var ratings = "0000" // 1st character = rating for the first video, etc.
	@State private var rating = 0
	let maximumRating = 5
	let onColor = Color.red
	let offColor = Color.gray
	
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1) { index in
                Image(systemName: "waveform.path.ecg")
						.foregroundColor(
						  index > rating ? offColor : onColor)
						.onTapGesture {
							updateRating(index: index)
						}
						.onAppear {
						  // 2
						  let index = ratings.index(
							 ratings.startIndex,
							 offsetBy: exerciseIndex)
						  // 3
						  let character = ratings[index]
						  // 4
						  rating = character.wholeNumberValue ?? 0
						}
            }
        }
			.font(.largeTitle)
    }
	func updateRating(index: Int) {
		rating = index
		let index = ratings.index(
			ratings.startIndex,
			offsetBy: exerciseIndex)
		ratings.replaceSubrange(index...index, with: String(rating)
		)
	}
}

struct RatingView_Previews: PreviewProvider {
	@AppStorage("ratings") static var ratings: String?
    static var previews: some View {
		ratings = nil
		return RatingView(exerciseIndex: 0)
            .previewLayout(.sizeThatFits)
    }
}
