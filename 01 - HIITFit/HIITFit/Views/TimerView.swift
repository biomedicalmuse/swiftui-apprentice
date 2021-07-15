import SwiftUI

struct TimerView: View {
  @State private var timeRemaining = 3 // in seconds
  @Binding var timerDone: Bool
  /*
	This method publishes an event every 1 second on the main (UI) thread in common mode.
	*/
  let timer = Timer.publish(
	 every: 1,
	 on: .main,
	 in: .common)
	 .autoconnect() // connects the publisher to the Text view

  var body: some View {
	 Text("\(timeRemaining)") // 5
		.font(.system(size: 90, design: .rounded))
		.padding()
		// Subscribes to the timer publisher and updates timeRemaining
		.onReceive(timer) { _ in // 6
		  if self.timeRemaining > 0 {
			 self.timeRemaining -= 1
		  } else {
			 timerDone = true // stop
		  }
		}
  }
}

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
	 TimerView(timerDone: .constant(false))
		.previewLayout(.sizeThatFits)
  }
}

