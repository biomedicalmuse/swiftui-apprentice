import SwiftUI
import AVKit

struct ExerciseView: View {
	@Binding var selectedTab: Int
    let index: Int
    let interval: TimeInterval = 30
	
	var lastExercise: Bool {
		// Check whether the last exercise is being displayed
		index + 1 == Exercise.exercises.count
	}
	
    var body: some View {
        GeometryReader { geometry in
            VStack {
					HeaderView(titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
					if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 90))
					HStack(spacing: 150) {
						Button("Start") {}
						Button("Done") {
							/*
							If this is the last exercise, go to WelcomeView.
							Otherwise, go to the next exercise.
							*/
							selectedTab = lastExercise ? 9 : selectedTab + 1
						}
					}
					  .font(.title3)
					  .padding()
                RatingView()
                    .padding()
                Spacer()
                Button(NSLocalizedString("History", comment: "view user activity")) {}
                    .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
		ExerciseView(selectedTab: .constant(1), index: 1)
    }
}


