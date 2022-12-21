// App.swift

import SwiftUI
import AppIntents

@main
struct SiriTipViewLocalizationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("contentView.sampleText")
            SiriTipView(intent: CurrentDateShortcut())
        }
        .padding()
    }
}

struct ShortcutsList: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CurrentDateShortcut(),
            phrases: ["intents.currentDate.appShortcutPhrase \(.applicationName)"]
        )
    }
}

struct CurrentDateShortcut: AppIntent {
    static var title: LocalizedStringResource = "intents.currentDate.title"

    func perform() async throws -> some IntentResult & ReturnsValue<Date> {
        return .result(value: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
