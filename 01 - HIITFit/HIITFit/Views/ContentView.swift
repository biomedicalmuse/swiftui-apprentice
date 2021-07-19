import SwiftUI

struct ContentView: View {
	@SceneStorage("selectedTab") private var selectedTab = 9
	var body: some View {
	  TabView(selection: $selectedTab) {
		 WelcomeView(selectedTab: $selectedTab)  // 1
			.tag(9)  // 2
		 ForEach(0 ..< Exercise.exercises.count) { index in
			ExerciseView(selectedTab: $selectedTab, index: index)
			  .tag(index)  // 3
		 }
	  }
	  .environmentObject(HistoryStore()) // HistoryStore is now available to all views
	  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
	}

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

