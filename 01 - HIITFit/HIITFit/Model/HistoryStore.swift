
import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []

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
}

