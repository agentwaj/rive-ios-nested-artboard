import RiveRuntime
import SwiftUI

@main
struct MyApp: App {
    init() {
        RiveLogger.isEnabled = true
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var parentVm: RiveViewModel
    @State var nestedVm: RiveViewModel

    init() {
        parentVm = RiveViewModel(
            fileName: "rive-ios-nested-artboard",
            artboardName: "parent"
        )

        nestedVm = RiveViewModel(
            fileName: "rive-ios-nested-artboard",
            artboardName: "nested"
        )
    }

    var body: some View {
        VStack {
            parentVm.view()
            nestedVm.view()
        }
        .onAppear {
            parentVm.setInput("num_input", value: 50.0, path: "nested")
            nestedVm.setInput("num_input", value: 50.0)
        }
    }
}

#Preview {
    ContentView()
}
