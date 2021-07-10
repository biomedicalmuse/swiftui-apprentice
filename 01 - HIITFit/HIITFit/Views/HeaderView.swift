
import SwiftUI

struct HeaderView: View {
    let exerciseName: String
    var body: some View {
        VStack {
            Text(exerciseName)
                .font(.largeTitle)
            HStack {
                ForEach(1..<5) { number in
                    Image(systemName: "\(number).circle")
                }
            }
            .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(exerciseName: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(exerciseName: "Squat")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
