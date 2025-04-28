//
//  noteNotificationBundle.swift
//  noteNotification
//
//  Created by Guilherme Martins on 26/04/25.
//

import WidgetKit
import SwiftUI

@main
struct noteNotificationBundle: WidgetBundle {
    var body: some Widget {
        noteNotification()
        noteNotificationControl()
        noteNotificationLiveActivity()
    }
}
