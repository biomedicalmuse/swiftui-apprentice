
import SwiftUI

@main
struct HIITFitApp: App {
 /*
	@StateObject creates an observable object that won't disappear when the view does.
	It is a read-only property wrapper. It can only be initialized once.
	*/
  @StateObject private var historyStore: HistoryStore
  @State private var showAlert = false
	
	/*
	 If the history data can't be loaded, load an empty history store.
	*/
	init() {
		let historyStore: HistoryStore
		do {
			historyStore = try HistoryStore(withChecking: true)
		} catch {
			print("Could not load history data.")
			showAlert = true 
			historyStore = HistoryStore()
		}
		_historyStore = StateObject(wrappedValue: historyStore)
	}
	
  var body: some Scene {
    WindowGroup {
      ContentView()
			.environmentObject(historyStore) // HistoryStore is now available to all views
			.alert(isPresented: $showAlert) {
			 Alert(
				 title: Text("History"),
				 message: Text(
					 """
					 Unfortunately, we can't load your history.
					 Please contact us at support@example.com.
					 """
				 )
			 )
		 }
	}
  }
}
