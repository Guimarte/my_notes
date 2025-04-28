//
//  notificationNoteLiveActivity.swift
//  notificationNote
//
//  Created by Guilherme Martins on 26/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct notificationNoteAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct notificationNoteLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: notificationNoteAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension notificationNoteAttributes {
    fileprivate static var preview: notificationNoteAttributes {
        notificationNoteAttributes(name: "World")
    }
}

extension notificationNoteAttributes.ContentState {
    fileprivate static var smiley: notificationNoteAttributes.ContentState {
        notificationNoteAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: notificationNoteAttributes.ContentState {
         notificationNoteAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: notificationNoteAttributes.preview) {
   notificationNoteLiveActivity()
} contentStates: {
    notificationNoteAttributes.ContentState.smiley
    notificationNoteAttributes.ContentState.starEyes
}
