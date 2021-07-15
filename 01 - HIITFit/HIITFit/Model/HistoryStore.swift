
import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []

  init() {
	/*
	#if DEBUG is a compiler directive
	It's used to prevent dummy data from being included in the release version of the app.
	It checks whether the current Build Configuration is Debug.
	*/
	 #if DEBUG
	 createDevData()
	 #endif
  }
	
	func addDoneExercise(_ exerciseName: String) {
		let today = Date()
		if today.isSameDay(as: exerciseDays[0].date) {
			print("Adding \(exerciseName)")
			exerciseDays[0].exercises.append(exerciseName)
		} else {
			exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
		}
	}
}

